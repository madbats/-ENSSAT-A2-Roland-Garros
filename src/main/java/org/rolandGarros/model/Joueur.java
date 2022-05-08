package org.rolandGarros.model;

public class Joueur {
	public Joueur(int idJoueur, String prenom, String nom, int age, String lieuNaissance, float taille, float poids,
			String nationnalite, int debutCarriere, String main, int classement, String entraineur, int salaire,
			int victoires, int defaites,String categorie) {
		super();
		this.idJoueur = idJoueur;
		this.prenom = prenom;
		this.nom = nom;
		this.age = age;
		this.lieuNaissance = lieuNaissance;
		this.taille = taille;
		this.poids = poids;
		this.nationnalite = nationnalite;
		this.debutCarriere = debutCarriere;
		this.main = main;
		this.classement = classement;
		this.entraineur = entraineur;
		this.salaire = salaire;
		this.victoires = victoires;
		this.defaites = defaites;
		this.categorie = categorie;
	}
	
	private int idJoueur;
	private String prenom;
	private String nom;
	private int age;
	private String lieuNaissance;
	private float taille;
	private float poids;
	private String nationnalite;
	private int debutCarriere;
	private String main;
	private int classement;
	private String entraineur;
	private int salaire;
	private int victoires;
	private int defaites;
	private String categorie;
	
	public int getIdJoueur() {
		return idJoueur;
	}
	public void setId(int idJoueur) {
		this.idJoueur = idJoueur;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getLieuNaissance() {
		return lieuNaissance;
	}
	public void setLieuNaissance(String lieuNaissance) {
		this.lieuNaissance = lieuNaissance;
	}
	public float getTaille() {
		return taille;
	}
	public void setTaille(float taille) {
		this.taille = taille;
	}
	public float getPoids() {
		return poids;
	}
	public void setPoids(float poids) {
		this.poids = poids;
	}
	public String getNationnalite() {
		return nationnalite;
	}
	public void setNationnalite(String nationnalite) {
		this.nationnalite = nationnalite;
	}
	public int getDebutCarriere() {
		return debutCarriere;
	}
	public void setDebutCarriere(int debutCarriere) {
		this.debutCarriere = debutCarriere;
	}
	public String getMain() {
		return main;
	}
	public void setMain(String main) {
		this.main = main;
	}
	public int getClassement() {
		return classement;
	}
	public void setClassement(int classement) {
		this.classement = classement;
	}
	public String getEntraineur() {
		return entraineur;
	}
	public void setEntraineur(String entraineur) {
		this.entraineur = entraineur;
	}
	public int getSalaire() {
		return salaire;
	}
	public void setSalaire(int salaire) {
		this.salaire = salaire;
	}
	public int getVictoires() {
		return victoires;
	}
	public void setVictoires(int victoires) {
		this.victoires = victoires;
	}
	public int getDefaites() {
		return defaites;
	}
	public void setDefaites(int defaites) {
		this.defaites = defaites;
	}

	public String getCategorie() {
		return categorie;
	}
	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}
}
