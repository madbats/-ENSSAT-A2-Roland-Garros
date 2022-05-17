<%@ page language="java"%>
<%@ page import="org.rolandGarros.model.Joueur"%>
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
float taille = -1;
float poids = -1;
String nationalite = null;
int debutCarriere = -1;
String entraineur = null;
int salaire = -1;
int victoires = -1;
int defaites = -1;
String error = "";

if(request.getAttribute("error")!=null)
{
	error = (String) request.getAttribute("error");
}
else
{
	Joueur joueur = (Joueur) request.getAttribute("joueur");
	nom = joueur.getNom();
	if(nom==null)
	{
		nom="inconnu";
	}
	prenom = joueur.getPrenom();
	if(prenom==null)
	{
		prenom="inconnu";
	}
	pays = joueur.getNationnalite();
	if(pays==null)
	{
		pays="inconnu";
	}
	categorie = joueur.getCategorie();
	if(categorie.equals("H"))
	{
		categorie = "Homme";
	}
	else if(categorie.equals("F"))
	{
		categorie = "Femme";
	}
	else
	{
		categorie="inconnu";
	}
	classement = joueur.getClassement();
	main = joueur.getMain();
	if(main==null)
	{
		main="inconnu";
	}
	age = joueur.getAge();
	id = joueur.getIdJoueur();
	lieuNaissance = joueur.getLieuNaissance();
	if(lieuNaissance==null)
	{
		lieuNaissance="inconnu";
	}
	taille = joueur.getTaille();
	poids = joueur.getPoids();
	debutCarriere = joueur.getDebutCarriere();
	entraineur = joueur.getEntraineur();
	if(entraineur == null)
	{
		entraineur = "inconnu";
	}
	salaire = joueur.getSalaire();
	victoires = joueur.getVictoires();
	defaites = joueur.getDefaites();
	
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fiche Joueur</title>
<style>
ul.info{
 list-style-type: square;
 margin: 50px;	
 }
ul.info li{
padding: 20px
}
table{
border: 1px solid black;
}
th{padding: 10px;}

</style>
<%@include file="includes/header.jsp"%>


	<ul class="info">
		<li style="padding: 0px; list-style-type: none;"><%=id %></li>
		<li id="nom" style="padding-left:0px;list-style-type:none;font-size:30px;font-weight:bold;text-transform:uppercase;"> <%=prenom %>  <%=nom %></li>
		<li id="pays">Nationnalite: <%=pays %></li>
		<li id="categorie">Categorie: <%=categorie %></li>
		<li id="classement">Classement mondial: <%=classement %></li>
		<li id="main">Main: <%=main %></li>
		<li id="age">Age: <%=age %></li>
		<li style="margin-top: 20px;">Lieu de naissance: <%=lieuNaissance %></li>
		<li>Taille: <%=taille %>m</li>
		<li>Poids: <%=poids %>kg</li>
		<li style="margin-top: 50px;">Debut de sa carriere: <%=debutCarriere %></li>
		<li>Entraineur: <%=entraineur %></li>
		<li>Salaire: <%=salaire %> euros</li>
		<li style="list-style-type: none;">Vicotory
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
	
	<div><%=error %></div>

</body>
<%@include file="includes/footer.jsp"%>
</html>