<%@ page language="java"%>
<%@ page import="org.rolandGarros.model.Joueur"%>
<%@ page import="java.util.Collection"%>
<%@ page import="org.rolandGarros.model.Match"%>
<%
//Initialisation des variables pour récupérer les informations du joueur dans la requête.
int id = -1;//Si on n'arrive pas à récupérer cette information sur le joueur, la valeur initialisé est affichée.
String nom = null;
String prenom = null;
String pays = null;
String categorie = null;
int classement = -1;//Si on n'arrive pas à récupérer cette information sur le joueur, la valeur initialisé est affichée.
String main = null;
int age = -1;//Si on n'arrive pas à récupérer cette information sur le joueur, la valeur initialisé est affichée.
String lieuNaissance = null;
float taille = 0;
float poids = 0;
String nationalite = null;
int debutCarriere = 0;
String entraineur = null;
int salaire = -1;//Si on n'arrive pas à récupérer cette information sur le joueur, la valeur initialisé est affichée.
int victoires = -1;//Si on n'arrive pas à récupérer cette information sur le joueur, la valeur initialisé est affichée.
int defaites = -1;//Si on n'arrive pas à récupérer cette information sur le joueur, la valeur initialisé est affichée.
String error = (String) request.getAttribute("error");
if (error == null) {//Si on a pu récupéré le joueur dans la base de données.
	Joueur joueur = (Joueur) request.getAttribute("joueur");
	nom = joueur.getNom();
	if (nom == null) {//Si on a pas pu récupérer cette information sur le joueur, on affiche "inconnu"
		nom = "inconnu";
	}
	prenom = joueur.getPrenom();
	if (prenom == null) {//Si on a pas pu récupérer cette information sur le joueur, on affiche "inconnu"
		prenom = "inconnu";
	}
	pays = joueur.getNationnalite();
	if (pays == null) {//Si on a pas pu récupérer cette information sur le joueur, on affiche "inconnu"
		pays = "inconnu";
	}
	categorie = joueur.getCategorie();//Pour la catégorie, on remplace la lettre par le mot complet.
	if (categorie.equals("H")) {
		categorie = "Homme";
	} else if (categorie.equals("F")) {
		categorie = "Femme";
	} else {//Si on a pas pu récupérer cette information sur le joueur, on affiche "inconnu"
		categorie = "inconnu";
	}
	classement = joueur.getClassement();
	main = joueur.getMain();
	if (main == null) {//Si on a pas pu récupérer cette information sur le joueur, on affiche "inconnu"
		main = "inconnu";
	}
	age = joueur.getAge();
	id = joueur.getIdJoueur();
	lieuNaissance = joueur.getLieuNaissance();
	if (lieuNaissance == null) {//Si on a pas pu récupérer cette information sur le joueur, on affiche "inconnu"
		lieuNaissance = "inconnu";
	}
	taille = joueur.getTaille();
	poids = joueur.getPoids();
	debutCarriere = joueur.getDebutCarriere();
	entraineur = joueur.getEntraineur();
	if (entraineur == null) {//Si on a pas pu récupérer cette information sur le joueur, on affiche "inconnu"
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
			if (error != null) {//Si l'attribut error n'est pas null, on l'affiche. Cela signifie que l'id du joueur n'a pas été trouvé dans la base de données
			%>
			<div class="error">
				<%=error%>
			</div>
			<%
			} else {//Si on a le joueur, on affiche ses informations issues de la base de données.
			%>

			<ul class="info">
				<li id="nom"
					style="padding-left: 0px; list-style-type: none; font-size: 30px; font-weight: bold; text-transform: uppercase;">
					<%=prenom%> <%=nom%></li>
				<li id="pays">Nationnalite: <%=pays%></li>
				<li id="categorie">Categorie: <%=categorie%></li>
				<li id="classement">Classement mondial: <%=classement%></li>
				<li id="main">Main: <%=main%></li>
				<li id="age">Age: <%=age%></li>
				<li style="margin-top: 20px;">Lieu de naissance: <%=lieuNaissance%></li>
				<li>Taille: <%
				if (taille != 0) {//Si on n'arrive pas à récupérer cette information sur le joueur, on affiche "inconnue".
				%> <%=taille%>m <%
 } else {
 %> inconnue <%
 }
 ;
 %>
				</li>
				<li>Poids: <%
				if (poids != 0) {//Si on n'arrive pas à récupérer cette information sur le joueur, on affiche "inconnu".
				%> <%=poids%>kg <%
 } else {
 %> inconnu <%
 }
 ;
 %>
				</li>
				<li style="margin-top: 50px;">Debut de sa carriere: <%
				if (debutCarriere != 0) {
				%>
					<%=debutCarriere%> <%
 } else {//Si on n'arrive pas à récupérer cette information sur le joueur, on affiche "inconnu".
 %> inconnu <%
 }
 ;
 %>
 
 				
				</li>
				<li>Entraineur: <%=entraineur%></li>
				<li>Salaire: <%=salaire%> euros
				</li>
				<li style="list-style-type: none;">
				<%--! Le nombre de victoires et de défaites sont affichés dans un tableau. --%>
					<table>
						<tr>
							<th style="border-right: 1px black solid;">Victoires</th>
							<th>Defaites</th>
						</tr>
						<tr>
							<th
								style="border-right: 1px black solid; border-top: 1px black solid;"><%=victoires%></th>
							<th style="border-top: 1px black solid;"><%=defaites%></th>
						</tr>
					</table>
				</li>

			</ul>
			<%
			}
			%>
		</div>
	</div>
</main>
<%@include file="includes/footer.jsp"%>
</html>