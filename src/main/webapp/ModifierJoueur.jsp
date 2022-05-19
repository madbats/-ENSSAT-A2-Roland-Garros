<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.List,org.rolandGarros.model.Joueur"%>
<%
Joueur joueur = (Joueur) request.getAttribute("joueur");
String message = (String) request.getAttribute("message");
String isFemme = "", isHomme = "", isDroite = "", isGauche = "";
if (joueur.getCategorie().contains("F")) {
	isFemme = "checked";
} else {
	isHomme = "checked";
}
if (joueur.getMain().contains("Droite")) {
	isDroite = "checked";
} else {
	isGauche = "checked";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
			<form name="modifier joueur" action="/Roland-Garros/jm/update"
				method="post">

				<h2 style="text-align: left">Modifier Joueur</h2>
				<table>
					<tr>
						<td><label for="prenom"> Prénom : </label></td>
						<td><input required type="text" name="prenom"
							value="<%=joueur.getPrenom()%>" /></td>
					</tr>
					<tr>
						<td><label for="nom"> Nom : </label></td>
						<td><input required type="text" name="nom"
							value="<%=joueur.getNom()%>" /></td>
					</tr>
					<tr>
						<td><label for="age"> Age : </label></td>
						<td><input required type="text" name="age"
							value="<%=joueur.getAge()%>" pattern="[0-9]{2}" /></td>
					</tr>
					<tr>
						<td><label for="lieu_naissance"> Lieu de Naissance :
						</label></td>
						<td><input required type="text" name="lieu_naissance"
							value="<%=joueur.getLieuNaissance()%>" /></td>
					</tr>
					<tr>
						<td><label for="taille"> Taille (en mètres): </label></td>
						<td><input required type="text" name="taille" pattern="[0-9.]*"
							value="<%=joueur.getTaille()%>" /></td>
					</tr>
					<tr>
						<td><label for="poids"> Poids (en kilogramme): </label></td>
						<td><input required type="text" name="poids" pattern="[0-9.]*"
							value="<%=joueur.getPoids()%>" /></td>
					</tr>
					<tr>
						<td><label for="nationnalite"> Nationnalité : </label></td>
						<td><input required type="text" name="nationnalite"
							value="<%=joueur.getNationnalite()%>" /></td>
					</tr>
					<tr>
						<td><label for="debut_carriere"> Début de Carrière :
						</label></td>
						<td><input required type="text" name="debut_carriere"
							value="<%=joueur.getDebutCarriere()%>" pattern="[0-9]{4}" /></td>
					</tr>
					<tr>
						<td>Main Dominante :</td>
						<td><label for="Droite">Droite</label> <input required type="radio"
							id="Droite" name="main" value="Droite" <%=isDroite%>> <label
							for="Gauche">Gauche</label> <input required type="radio" id="Gauche"
							name="main" value="Gauche" <%=isGauche%>></td>
					</tr>
					<tr>
						<td><label for="classement"> Classement : </label></td>
						<td><input required type="text" name="classement"
							value="<%=joueur.getClassement()%>" pattern="[0-9]*" /></td>
					</tr>
					<tr>
						<td><label for="entraineur"> Entraineur : </label></td>
						<td><input required type="text" name="entraineur"
							value="<%=joueur.getEntraineur()%>" /></td>
					</tr>
					<tr>
						<td><label for="salaire"> Gain (en €) : </label></td>
						<td><input required type="text" name="salaire" pattern="[0-9]*"
							value="<%=joueur.getSalaire()%>" /></td>
					</tr>
					<tr>
						<td><label for="victoires"> Victoires : </label></td>
						<td><input required type="text" name="victoires" pattern="[0-9]*"
							value="<%=joueur.getVictoires()%>" /></td>
					</tr>
					<tr>
						<td><label for="defaites"> Défaites : </label></td>
						<td><input required type="text" name="defaites" pattern="[0-9]*"
							value="<%=joueur.getDefaites()%>" /></td>
					</tr>

					<tr>
						<td>Catégorie :</td>
						<td><label for="F">Femme</label> <input required type="radio" id="F"
							name="categorie" value="F" <%=isFemme%>> <label for="H">Homme</label><br>
							<input required type="radio" id="H" name="categorie" value="H"
							<%=isHomme%>></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" name="Valider" value="Valider" /></td>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</main>
<%@include file="includes/footer.jsp"%>
</html>