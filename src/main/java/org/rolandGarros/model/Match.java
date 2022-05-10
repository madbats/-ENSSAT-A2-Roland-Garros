package org.rolandGarros.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.rolandGarros.controller.JoueurServiceImpl;

public class Match {
	private int idWinner = -1;
	private Collection<Set> sets = null;
	private Collection<Joueur> joueurs = null;

	public Match(int idMatch, int dureeSecondes, int court, String etape, int idJ1, int idJ2) {
		super();
		this.idMatch = idMatch;
		this.dureeSecondes = dureeSecondes;
		this.court = court;
		this.etape = etape;
		this.idJ1 = idJ1;
		this.idJ2 = idJ2;
	}

	public Match(int dureeSecondes, int court, String etape, int idJ1, int idJ2) {
		this.dureeSecondes = dureeSecondes;
		this.court = court;
		this.etape = etape;
		this.idJ1 = idJ1;
		this.idJ2 = idJ2;
	}

	private int idMatch;
	private int dureeSecondes;
	private int court;
	private String etape;
	private int idJ1;
	private int idJ2;

	public int getIdMatch() {
		return idMatch;
	}

	public void setIdMatch(int idMatch) {
		this.idMatch = idMatch;
	}

	public int getDureeSecondes() {
		return dureeSecondes;
	}

	public void setDureeSecondes(int dureeSecondes) {
		this.dureeSecondes = dureeSecondes;
	}

	public int getCourt() {
		return court;
	}

	public void setCourt(int court) {
		this.court = court;
	}

	public String getEtape() {
		return etape;
	}

	public void setEtape(String etape) {
		this.etape = etape;
	}

	public int getIdJ1() {
		return idJ1;
	}

	public void setIdJ1(int idJ1) {
		this.idJ1 = idJ1;
	}

	public int getIdJ2() {
		return idJ2;
	}

	public void setIdJ2(int idJ2) {
		this.idJ2 = idJ2;
	}

	public Collection<Set> getSets() {
		if (this.sets == null) {
			SetServiceImpl ss = new SetServiceImpl();
			this.sets = ss.getAll().stream().filter(s -> s.getIdMatch() == this.getIdMatch()).toList();
		}
		return this.sets;
	}

	public Collection<Joueur> getJoueurs() {
		if (this.joueurs == null) {

			JoueurServiceImpl js = new JoueurServiceImpl();
			this.joueurs = js.getAll().stream()
					.filter(j -> j.getIdJoueur() == this.getIdJ1() || j.getIdJoueur() == this.getIdJ2()).toList();
		}
		return this.joueurs;
	}

	public int getIdWinner() {
		if (this.idWinner == -1) {
			int setsWonByJ1 = 0;
			List<Set> setList = new ArrayList<Set>(this.getSets());
			for (Set set : setList) {
				if (set.getScoreJ1() > set.getScoreJ2()) {
					setsWonByJ1++;
				}
			}
			this.idWinner = (setsWonByJ1 > setList.size() / 2) ? this.getIdJ1() : this.getIdJ2();
		}

		return this.idWinner;

	}

}
