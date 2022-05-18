<%@ page language="java"%>
<%@ page import="org.rolandGarros.model.Joueur"%>
<%@ page import="java.util.Collection"%>
<%@ page import="org.rolandGarros.model.Match"%>
<%
int id = -1;
String nom = null;
String prenom = null;
String pays = null;
String categorie = null;
int classement = -1;
String main = null;
int age = -1;
String lieuNaissance = null;
float taille = 0;
float poids = 0;
String nationalite = null;
int debutCarriere = 0;
String entraineur = null;
int salaire = -1;
int victoires = -1;
int defaites = -1;
String error = (String) request.getAttribute("error");
if (error != null) {
	Joueur joueur = (Joueur) request.getAttribute("joueur");
	nom = joueur.getNom();
	if (nom == null) {
		nom = "inconnu";
	}
	prenom = joueur.getPrenom();
	if (prenom == null) {
		prenom = "inconnu";
	}
	pays = joueur.getNationnalite();
	if (pays == null) {
		pays = "inconnu";
	}
	categorie = joueur.getCategorie();
	if (categorie.equals("H")) {
		categorie = "Homme";
	} else if (categorie.equals("F")) {
		categorie = "Femme";
	} else {
		categorie = "inconnu";
	}
	classement = joueur.getClassement();
	main = joueur.getMain();
	if (main == null) {
		main = "inconnu";
	}
	age = joueur.getAge();
	id = joueur.getIdJoueur();
	lieuNaissance = joueur.getLieuNaissance();
	if (lieuNaissance == null) {
		lieuNaissance = "inconnu";
	}
	taille = joueur.getTaille();
	poids = joueur.getPoids();
	debutCarriere = joueur.getDebutCarriere();
	entraineur = joueur.getEntraineur();
	if (entraineur == null) {
		entraineur = "inconnu";
	}
	salaire = joueur.getSalaire();
	victoires = joueur.getVictoires();
	defaites = joueur.getDefaites();

	Collection<Match> matches = joueur.getMatchs();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Joueur</title>
<style>
ul.info {
	list-style-type: square;
	margin: 50px;
}

ul.info li {
	padding: 20px
}

table {
	border: 1px solid black;
}

th {
	padding: 10px;
}
</style>
<%@include file="includes/header.jsp"%>
<main>

	<div class="overcontainer" style="margin-top: 2em;">
		<div style="display: flex; flex-flow: column;">
			<%
			if (error != null) {
			%>
			<div class="error">
				<%=error%>
			</div>
			<%
			} else {
			%>

	<ul class="info">
		<li id="nom" style="padding-left:0px;list-style-type:none;font-size:30px;font-weight:bold;text-transform:uppercase;"> <%=prenom %>  <%=nom %></li>
		<li id="pays">Nationnalite: <%=pays %></li>
		<li id="categorie">Categorie: <%=categorie %></li>
		<li id="classement">Classement mondial: <%=classement %></li>
		<li id="main">Main: <%=main %></li>
		<li id="age">Age: <%=age %></li>
		<li style="margin-top: 20px;">Lieu de naissance: <%=lieuNaissance %></li>
		<li>Taille: 
		<% 	if (taille != 0) { %>
			<%= taille %>m 
		<% }
			else { %> inconnue <% };
		%>
		</li>
		<li>Poids: 
		<% if (poids != 0) { %>
			<%=poids %>kg
		<%}
		   else { %> inconnu <% }; 
		%>
		</li>
		<li style="margin-top: 50px;">Debut de sa carriere: 
		<% if(debutCarriere != 0) { %>
			<%=debutCarriere %>
		<%}
		  else { %> inconnu <% }; %>
		</li>
		<li>Entraineur: <%=entraineur %></li>
		<li>Salaire: <%=salaire %> euros</li>
		<li style="list-style-type: none;">
		<table>
			<tr>
				<th style="border-right: 1px black solid;">Victoires</th>
				<th>Defaites</th>
			</tr>
			<tr>
				<th style="border-right: 1px black solid; border-top: 1px black solid;"><%=victoires %></th>
				<th style="border-top: 1px black solid;"><%=defaites %></th>
			</tr>
		</table>
		</li>
		
	</ul>
	

			</ul>
			<%
			}
			%>
		</div>
	</div>
</main>
<%@include file="includes/footer.jsp"%>
</html>