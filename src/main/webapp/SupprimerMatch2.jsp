<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.rolandGarros.model.Match"%>
<%
Match match = (Match) request.getAttribute("match");
int id = match.getIdMatch();
int duree = match.getDureeSecondes();
String etape = match.getEtape();
int idj1 = match.getIdJ1();
int idj2 = match.getIdJ2();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Suppression d'un match</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/affichageListe.css" />
<%@include file="includes/header.jsp"%>
</head>
<main>

	<ul>
		<li id="id">Identifiant: <%=id %></li>
		<li id="duree">Durée: <%=duree %></li>
		<li id="etape">Etape: <%=etape %></li>
		<li id="idj1">Joueur 1: <%=idj1 %></li>
		<li id="idj2">Joueur 2: <%=idj2 %></li>
	</ul>

</main>
<%@include file="includes/footer.jsp"%>
</html>