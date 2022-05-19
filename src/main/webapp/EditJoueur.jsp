<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.List,org.rolandGarros.model.Joueur"%>
<%
List<Joueur> listJoueurs = (List<Joueur>) request.getAttribute("listJoueurs");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Joueurs et joueuses</title>
<style>
#showpopup{
    display: none;
}           
label[for="showpopup"]{
    color: white;
    background-color: black;
    border: 3px solid;
    cursor: pointer;
    outline: none;
}
label[for="showpopup"]::selection{
    display: none;
}
#popup{
    display: none;
    border: 1px solid black;
    position: absolute;
    width: 300px;
    height: 200px;
}
#showpopup:checked ~ #popup{
    display: block;
} 
</style>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/affichageListe.css" />
<%@include file="includes/header.jsp"%>
<main>

	<div class="overcontainer" style="margin-top: 2em;">
		<div class="dropdown">
			<button class="dropbtn">Tri</button>
			<div class="dropdown-content test">
				<a href="/Roland-Garros/joueurs?sort=nom">Nom</a> 
				<a href="/Roland-Garros/joueurs?sort=classement">Classement</a>
				<a href="/Roland-Garros/joueurs?sort=sex">Sex</a> 
				<a href="/Roland-Garros/joueurs?sort=victoire">Victoire</a>
			</div>
		</div>
		<ul class="container">
			<li class="item"><a href="/Roland-Garros/jm/new" class="card">
				<div style="margin-top: 5px;">
					Inscrire un joueur
				</div>
			</a></li>
			<%
			for (Joueur joueur : listJoueurs) {
				int id = joueur.getIdJoueur();
				String prenom = joueur.getPrenom();
				String nom = joueur.getNom();
				String sex = joueur.getCategorie();
				String nationnalite = joueur.getNationnalite();
				int classement = joueur.getClassement();
				int age = joueur.getAge();
				String main = joueur.getMain();
			%>
			<li class="item"><a class="card">
					<div style="margin-top: 5px;">
						<h3><%=prenom%>
							<%=nom%></h3>
						<span><%=nationnalite%></span>
						<p>
							<%=sex%>
							Classement
							<%=classement%></p>
						<div>
							<p>
								Age
								<%=age%>
								|
								<%=main%></p>
						</div>
							
					</div>
			</a>
			<div class="modif" style="display: flex">
					<a href="/Roland-Garros/jm/update?id=<%=id%>"><button>Update</button></a>
					<% if(joueur.getMatchs().size()<1){ %>
					<a href="/Roland-Garros/jm/delete?id=<%=id%>"><button>Delete</button></a>
					<% } %>			
			</div>
			</li>
					
			<%
			}
			%>
		</ul>
	</div>
</main>
<%@include file="includes/footer.jsp"%>
</html>