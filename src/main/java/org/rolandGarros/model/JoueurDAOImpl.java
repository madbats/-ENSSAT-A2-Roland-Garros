/**
 * 
 */
package org.rolandGarros.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Optional;


/**
 * @author matthieu
 *
 */
public class JoueurDAOImpl implements Dao<Joueur> {

	@Override
	public Optional<Joueur> get(int id) {
		Connection connexion = DBManager.getInstance().getConnection();
		Optional<Joueur> joueur = Optional.empty();
		Statement statement;
		try {
			statement = connexion.createStatement();
			ResultSet rs = statement.executeQuery("select * from `info_team01_schema`.`Joueur` where idJoueurs='"+id+"'");
			while(rs.next()) {
				joueur = Optional.of(new Joueur(
						rs.getInt("idJoueurs"),
						rs.getString("prénom"),
						rs.getString("nom"),
						rs.getInt("age"),
						rs.getString("lieuNaissance"),
						rs.getFloat("taille"),
						rs.getFloat("poids"),
						rs.getString("nationnalite"),
						rs.getInt("debutCarriere"),
						rs.getString("main"),
						rs.getInt("classement"),
						rs.getString("entraineur"),
						rs.getInt("gain"),
						rs.getInt("victoire"),
						rs.getInt("defaites"),
						rs.getString("catégorie")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return joueur;
	}

	@Override
	public Collection<Joueur> getAll() {
		Connection connexion = DBManager.getInstance().getConnection();
		Collection<Joueur> joueurs = new ArrayList<Joueur>();
		Statement statement;
		try {
			statement = connexion.createStatement();
			ResultSet rs = statement.executeQuery(" select * from `info_team01_schema`.`Joueur`");
			while(rs.next()) {
				joueurs.add(new Joueur(
						rs.getInt("idJoueurs"),
						rs.getString("prénom"),
						rs.getString("nom"),
						rs.getInt("age"),
						rs.getString("lieuNaissance"),
						rs.getFloat("taille"),
						rs.getFloat("poids"),
						rs.getString("nationnalite"),
						rs.getInt("debutCarriere"),
						rs.getString("main"),
						rs.getInt("classement"),
						rs.getString("entraineur"),
						rs.getInt("gain"),
						rs.getInt("victoire"),
						rs.getInt("defaites"),
						rs.getString("catégorie")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return joueurs;
	}

	@Override
	public int save(Joueur t) {
		Connection connexion = DBManager.getInstance().getConnection();
		Statement statement;
		int retour = t.getIdJoueur();
		try {
			statement = connexion.createStatement();
			statement.executeUpdate("INSERT INTO `info_team01_schema`.`Joueurs`"
					+ "(`nom`,"
					+ "`prénom`,"
					+ "`age`,"
					+ "`lieuNaissance`,"
					+ "`taille`,"
					+ "`poids`,"
					+ "`nationnalite`,"
					+ "`debutCarriere`,"
					+ "`main`,"
					+ "`classement`,"
					+ "`entraineur`,"
					+ "`gain`,"
					+ "`victoire`,"
					+ "`defaites`,"
					+ "`catégorie`)"
					+ "VALUES"
					+ "("+t.getNom()+"',"
					+ "'"+t.getPrenom()+"',"
					+ "'"+t.getAge()+"',"
					+ "'"+t.getLieuNaissance()+"',"
					+ "'"+t.getTaille()+"',"
					+ "'"+t.getPoids()+"',"
					+ "'"+t.getNationnalite()+"',"
					+ "'"+t.getDebutCarriere()+"',"
					+ "'"+t.getMain()+"',"
					+ "'"+t.getClassement()+"',"
					+ "'"+t.getEntraineur()+"',"
					+ "'"+t.getSalaire()+"',"
					+ "'"+t.getVictoires()+"',"
					+ "'"+t.getDefaites()+"',"
					+ "'"+t.getCategorie()+"');");
		} catch (SQLException e) {
			retour = -1;
			e.printStackTrace();
		}
		return retour;
	}

	@Override
	public void update(Joueur t) {
		Connection connexion = DBManager.getInstance().getConnection();
		Statement statement;
		try {
			statement = connexion.createStatement();
			statement.executeUpdate("UPDATE `info_team01_schema`.`Joueurs`"
					+ "SET"
					+ "`idJoueurs` =`"+t.getIdJoueur()+"',"
					+ "`nom` =`"+t.getNom()+"',"
					+ "`prénom` =`"+t.getPrenom()+"',"
					+ "`age` =`"+t.getAge()+"',"
					+ "`lieuNaissance` =`"+t.getLieuNaissance()+"',"
					+ "`taille` =`"+t.getTaille()+"',"
					+ "`poids` =`"+t.getPoids()+"',"
					+ "`nationnalite` =`"+t.getNationnalite()+"',"
					+ "`debutCarriere` =`"+t.getDebutCarriere()+"',"
					+ "`main` =`"+t.getMain()+"',"
					+ "`classement` =`"+t.getClass()+"',"
					+ "`entraineur` =`"+t.getEntraineur()+"',"
					+ "`gain` =`"+t.getMain()+"',"
					+ "`victoire` =`"+t.getVictoires()+"',"
					+ "`defaites` =`"+t.getDefaites()+"',"
					+ "`catégorie` =`"+t.getCategorie()+"'"
					+ "WHERE `idJoueurs` =`"+t.getIdJoueur()+"';");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Joueur t) {
		Connection connexion = DBManager.getInstance().getConnection();
		Statement statement;
		int retour = t.getIdJoueur();
		try {
			statement = connexion.createStatement();
			statement.executeUpdate("DELETE FROM `info_team01_schema`.`Joueurs`"
					+ "WHERE `idJoueurs` =`"+t.getIdJoueur()+";");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
