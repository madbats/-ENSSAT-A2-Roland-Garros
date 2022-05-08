<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.List,org.rolandGarros.model.Joueur"%>
<%
List<Joueur> listJoueurs = (List<Joueur>) request.getAttribute("listJoueurs");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Joueurs et joueuses</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/joueurs.css" />
</head>
<body>
	<h1>Accueil</h1>
	Liste des joueurs :
	<div class="overcontainer" style="margin-top: 2em;">
		<ul class="container">
			<%
			for (Joueur joueur : listJoueurs) {
				String prenom = joueur.getPrenom();
				String nom = joueur.getNom();
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
							Classement
							<%=classement%></p>
						<div>
							<p>Age <%=age%> | <%=main%></p>
						</div>
					</div>
			</a></li>
			<%
			}
			%>
		</ul>
	</div>
</body>
</html>