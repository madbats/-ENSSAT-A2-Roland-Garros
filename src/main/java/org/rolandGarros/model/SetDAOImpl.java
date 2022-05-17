package org.rolandGarros.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Optional;

public class SetDAOImpl implements Dao<Set> {

	@Override
	public Optional<Set> get(int id) {
		Connection connexion = DBManager.getInstance().getConnection();
		Optional<Set> set = Optional.empty();
		Statement statement;
		try {
			statement = connexion.createStatement();
			ResultSet rs = statement.executeQuery("select * from `info_team01_schema`.`Set` where idSet='"+id+"'");
			while(rs.next()) {
				set = Optional.of(new Set(
						rs.getInt("idSet"),
						rs.getInt("idMatch"),
						rs.getInt("scoreJ1"),
						rs.getInt("scoreJ2"),
						rs.getInt("numero")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return set;
	}

	@Override
	public Collection<Set> getAll() {
		Connection connexion = DBManager.getInstance().getConnection();
		Collection<Set> sets = new ArrayList<Set>();
		Statement statement;
		try {
			statement = connexion.createStatement();
			ResultSet rs = statement.executeQuery("select * from `info_team01_schema`.`Set`");
			while(rs.next()) {
				sets.add(new Set(
						rs.getInt("idSet"),
						rs.getInt("idMatch"),
						rs.getInt("scoreJ1"),
						rs.getInt("scoreJ2"),
						rs.getInt("numero")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sets;
	}

	@Override
	public int save(Set t) {
		Connection connexion = DBManager.getInstance().getConnection();
		Statement statement;
		int retour = t.getIdSet();
		try {
			statement = connexion.createStatement();
			statement.executeUpdate("INSERT INTO `info_team01_schema`.`Set`"
					+ "(`idMatch`,"
					+ "`scoreJ1`,"
					+ "`scoreJ2`,"
					+ "`numero`)"
					+ "VALUES"
					+ "("
					+ t.getIdMatch()+","
					+ t.getScoreJ1() + ","
					+ t.getScoreJ2() + ","
					+ t.getNumero() + ");");
		} catch (SQLException e) {
			retour = -1;
			e.printStackTrace();
		}
		
		return retour;
	}
	
	@Override
	public void update(Set t) {
		Connection connexion = DBManager.getInstance().getConnection();
		Statement statement;
		try {
			statement = connexion.createStatement();
			statement.executeUpdate("UPDATE `info_team01_schema`.`Set`"
					+ "SET"
					+ "`idSet` = " + t.getIdSet() +","
					+ "`idMatch` = " + t.getIdMatch() + ","
					+ "`scoreJ1` = " + t.getScoreJ1() + ","
					+ "`scoreJ2` = " + t.getScoreJ2() + ","
					+ "`numero` = " + t.getNumero() + ","
					+ "WHERE `idSet` = " + t.getIdSet() + ";");
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void delete(Set t) {
		Connection connexion = DBManager.getInstance().getConnection();
		Statement statement;
		int retour = t.getIdSet();
		try {
			statement = connexion.createStatement();
			statement.executeUpdate("DELETE FROM `info_team01_schema`.`Set`"
					+ "WHERE `idSet` ="+t.getIdSet()+";");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
