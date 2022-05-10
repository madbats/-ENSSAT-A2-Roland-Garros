<%@ page language="java"%>
<%@ page import="org.rolandGarros.model.Joueur"%>
<%
String nom=request.getParameter("nom");
String prenom=request.getParameter("prenom");
String pays=request.getParameter("pays");
String catégorie=request.getParameter("catégorie");
String classement=request.getParameter("classement");
String main=request.getParameter("main");
String age=request.getParameter("age");
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
		<li id="pays">Pays: <%=pays %></li>
		<li id="catégorie">Catégorie: <%=catégorie %></li>
		<li id="classement">Classement mondial: <%=classement %></li>
		<li id="main">Main: <%=main %></li>
		<li id="age">Age: <%=age %></li>
	</ul>
</body>
<footer>
	<p>Conditions Générales d'Utilisation:</p>
</footer>
</html>