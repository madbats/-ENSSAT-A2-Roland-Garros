<%@ page language="java"%>
<%@ page import="org.rolandGarros.model.Joueur"%>
<%
Joueur joueur = (Joueur) request.getAttribute("joueur");
String nom = joueur.getNom();
String prenom = joueur.getPrenom();
String pays = joueur.getNationnalite();
String categorie = joueur.getCategorie();
int classement = joueur.getClassement();
String main = joueur.getMain();
int age = joueur.getAge();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fiche Joueur</title>
</head>
<body>
	<ul>
		<li id="nom">Nom: <%=nom %></li>
		<li id="prenom">Prenom: <%=prenom %></li>
		<li id="pays">Nationnalite: <%=pays %></li>
		<li id="catégorie">Catégorie: <%=categorie %></li>
		<li id="classement">Classement mondial: <%=classement %></li>
		<li id="main">Main: <%=main %></li>
		<li id="age">Age: <%=age %></li>
	</ul>
</body>
</html>