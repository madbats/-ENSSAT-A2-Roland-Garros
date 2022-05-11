<%@ page language="java"%>
<%@ page import="org.rolandGarros.model.Joueur"%>
<%
String nom = null;
String prenom = null;
String pays = null;
String categorie = null;
int classement = 0;
String main = null;
int age = 0;
String error = null;
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
	if(categorie==null)
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
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fiche Joueur</title>
<%@include file="includes/header.jsp"%>
<main>

	<ul>
		<li id="nom">Nom: <%=nom %></li>
		<li id="prenom">Prenom: <%=prenom %></li>
		<li id="pays">Nationnalite: <%=pays %></li>
		<li id="catégorie">Catégorie: <%=categorie %></li>
		<li id="classement">Classement mondial: <%=classement %></li>
		<li id="main">Main: <%=main %></li>
		<li id="age">Age: <%=age %></li>
	</ul>
	
	<div><%=error %></div>

</main>
<%@include file="includes/footer.jsp"%>
</html>