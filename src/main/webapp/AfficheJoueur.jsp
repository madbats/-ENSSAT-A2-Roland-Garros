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

</style>
<%@include file="includes/header.jsp"%>


	<ul class="info">
		<li id="nom" style="padding-left:0px;list-style-type:none;font-size:30px;font-weight:bold;text-transform:uppercase;"> <%=prenom %>  <%=nom %></li>
		<li id="pays">Nationnalite: <%=pays %></li>
		<li id="catégorie">Catégorie: <%=categorie %></li>
		<li id="classement">Classement mondial: <%=classement %></li>
		<li id="main">Main: <%=main %></li>
		<li id="age">Age: <%=age %></li>
	</ul>
	
	<div><%=error %></div>

</body>
<%@include file="includes/footer.jsp"%>
</html>