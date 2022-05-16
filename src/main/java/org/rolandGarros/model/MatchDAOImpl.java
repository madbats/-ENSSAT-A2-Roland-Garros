package org.rolandGarros.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Optional;

public class MatchDAOImpl implements Dao<Match> {
	public Optional<Match> get(int id) {
		Connection connexion = DBManager.getInstance().getConnection();
		Optional<Match> match = Optional.empty();
		Statement statement;
		try {
			statement = connexion.createStatement();
			ResultSet rs = statement.executeQuery("select * from `info_team01_schema`.`Match` where idMatch='"+id+"'");
			while(rs.next()) {
				match = Optional.of(new Match(
						rs.getInt("idMatch"),
						rs.getInt("dureeSecond"),
						rs.getInt("court"),
						rs.getString("etape"),
						rs.getInt("idJ1"),
						rs.getInt("idJ2")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return match;
	}

	@Override
	public Collection<Match> getAll() {
		Connection connexion = DBManager.getInstance().getConnection();
		Collection<Match> matchs = new ArrayList<Match>();
		Statement statement;
		try {
			statement = connexion.createStatement();
			ResultSet rs = statement.executeQuery("select * from `info_team01_schema`.`Match`");
			while(rs.next()) {
				matchs.add(new Match(
						rs.getInt("idMatch"),
						rs.getInt("dureeSecond"),
						rs.getInt("court"),
						rs.getString("etape"),
						rs.getInt("idJ1"),
						rs.getInt("idJ2")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return matchs;
	}

	@Override
	public int save(Match t) {
		Connection connexion = DBManager.getInstance().getConnection();
		Statement statement;
		int retour = t.getIdMatch();
		try {
			statement = connexion.createStatement();
			statement.executeUpdate("INSERT INTO `info_team01_schema`.`Match`"
					+ "(`dureeSecond`,"
					+ "`court`,"
					+ "`etape`,"
					+ "`idJ1`,"
					+ "`idJ2`)"
					+ "VALUES"
					+ "(" + t.getDureeSecondes() + ","
					+ t.getCourt() + ","
					+ "'"+t.getEtape() + "',"
					+ t.getIdJ1() + ","
					+ t.getIdJ2() + ");");
		} catch (SQLException e) {
			retour = -1;
			e.printStackTrace();
		}
		return retour;
	}

	@Override
	public void update(Match t) {
		Connection connexion = DBManager.getInstance().getConnection();
		Statement statement;
		try {
			statement = connexion.createStatement();
			ResultSet rs = statement.executeQuery("UPDATE `info_team01_schema`.`Match`"
					+ "SET"
					+ "`idMatch` =`" + t.getIdMatch() +"`,"
					+ "`dureeSecond` =`" + t.getDureeSecondes() +"`,"
					+ "`court` =`"+ t.getCourt() + "`,"
					+ "`etape` =`" + t.getEtape() + "`,"
					+ "`idJ1` =`" + t.getIdJ1() + "`,"
					+ "`idJ2` = " + t.getIdJ2() + "`"
					+ "WHERE `idMatch` = `" + t.getIdMatch() +"`;");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Match t) {
		Connection connexion = DBManager.getInstance().getConnection();
		Statement statement;
		try {
			statement = connexion.createStatement();
			statement.executeUpdate("DELETE FROM `info_team01_schema`.`Match`"
					+ "WHERE `idMatch` ='"+t.getIdMatch()+"';");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
