package org.rolandGarros.model;

import java.util.Collection;

import org.rolandGarros.controller.JoueurServiceImpl;

public class Match {
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
		SetServiceImpl ss = new SetServiceImpl();
		
		return ss.getAll().stream().filter(s -> s.getIdMatch() == this.getIdMatch()).toList();
	}
	
	public Collection<Joueur> getJoueurs() {
		JoueurServiceImpl js = new JoueurServiceImpl();
		
		return js.getAll().stream().filter(j -> j.getIdJoueur() == this.getIdJ1() || j.getIdJoueur() == this.getIdJ2()).toList();
	}
	
}
