<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.List,org.rolandGarros.model.Joueur"%>
<%
Joueur joueur = (Joueur) request.getAttribute("joueur");
String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modifier Joueur</title>
<%@include file="includes/header.jsp"%>
<main>

	<div class="overcontainer" style="margin-top: 2em;">
		<div style="display: flex; flex-flow: column;">
			<%
			if (message != null) {
			%>
			<div class="error">
				<%=message%>
			</div>
			<%
			}
			%>
			<form name="modifier joueur" action="PlayerUpdate" method="post">

				<h2 style="text-align: left">Modifier Joueur</h2>
				<p style="text-align: left;">
					Prénom : <input type="text" name="prenom"
						value="<%=joueur.getPrenom()%>" />
				</p>
				<p style="text-align: left;">
					Nom : <input type="text" name="nom" value="<%=joueur.getNom()%>" />
				</p>
				<p style="text-align: left;">
					Age : <input type="text" name="age" value="<%=joueur.getAge()%>" />
				</p>
				<p style="text-align: left;">
					Lieu de Naissance : <input type="text" name="lieu_naissance"
						value="<%=joueur.getLieuNaissance()%>" />
				</p>
				<p style="text-align: left;">
					Taille : <input type="text" name="taille"
						value="<%=joueur.getTaille()%>" />
				</p>
				<p style="text-align: left;">
					Poids : <input type="text" name="poids"
						value="<%=joueur.getPoids()%>" />
				</p>
				<p style="text-align: left;">
					Nationnalité : <input type="text" name="nationnalite"
						value="<%=joueur.getNationnalite()%>" />
				</p>
				<p style="text-align: left;">
					Début de Carrière : <input type="text" name="debut_carriere"
						value="<%=joueur.getDebutCarriere()%>" />
				</p>
				<p style="text-align: left;">
					Main Dominante : <input type="text" name="main"
						value="<%=joueur.getMain()%>" />
				</p>
				<p style="text-align: left;">
					Classement : <input type="text" name="classement"
						value="<%=joueur.getClassement()%>" />
				</p>
				<p style="text-align: left;">
					Entraineur : <input type="text" name="entraineur"
						value="<%=joueur.getEntraineur()%>" />
				</p>
				<p style="text-align: left;">
					Salaire : <input type="text" name="salaire"
						value="<%=joueur.getSalaire()%>" />
				</p>
				<p style="text-align: left;">
					Victoires : <input type="text" name="victoires"
						value="<%=joueur.getVictoires()%>" />
				</p>
				<p style="text-align: left;">
					Défaites : <input type="text" name="defaites"
						value="<%=joueur.getDefaites()%>" />
				</p>
				<p style="text-align: left;">
					Catégorie : <input type="text" name="categorie"
						value="<%=joueur.getCategorie()%>" />
				</p>
				<p style="text-align: left; width: 75%; margin: auto;">
					<input type="submit" name="Valider" value="Valider" />
				</p>

			</form>
		</div>
	</div>
</main>
<%@include file="includes/footer.jsp"%>
</html>