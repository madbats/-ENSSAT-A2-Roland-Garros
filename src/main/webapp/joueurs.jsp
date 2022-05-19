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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/affichageListe.css" />
<%@include file="includes/header.jsp"%>
<main>

	<div class="overcontainer" style="margin-top: 2em;">
		<div class="dropdown">
			<button class="dropbtn">Tri</button>
			<div class="dropdown-content test">
				<a href="joueurs?sort=nom">Nom</a>
				<a href="joueurs?sort=classement">Classement</a>
				<a href="joueurs?sort=sexe">Sexe</a>
				<a href="joueurs?sort=victoire">Victoire</a>
				<a href="joueurs?sort=duree">Duree de Jeu</a>
			</div>
		</div>
		<ul class="container">
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
				int victoire = joueur.getVictoires();
				int defaite = joueur.getDefaites();
			%>
			<li class="item"><a href="joueur?id=<%=id%>" class="card">
					<div style="margin-top: 5px;">
						<h3><%=prenom%>
							<%=nom%></h3>
						<span><%=nationnalite%></span>
						<p>
							<%=sex%>
							Classement
							<%=classement%>
						</p>
						<div>
							<p>
								Age
								<%=age%>
								|
								<%=main%>
							</p>
							<p>
								<%= victoire %> victoires / <%= victoire + defaite %> matchs
						</div>
					</div>
			</a></li>
			<%
			}
			%>
		</ul>
	</div>
</main>
<%@include file="includes/footer.jsp"%>
</html>