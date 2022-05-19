<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajouter un joueur</title>
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
			<form name="ajouter joueur" action="/Roland-Garros/jm/new" method="post">

				<h2 style="text-align: left">Ajouter Joueur</h2>
				<table>
					<tr>
						<td><label for="prenom">Prénom : </label></td>
						<td><input required type="text" name="prenom" /></td>
					</tr>
					<tr>
						<td><label for="nom">Nom : </label></td>
						<td><input required type="text" name="nom" /></td>
					</tr>
					<tr>
						<td><label for="age">Age : </label></td>
						<td><input required type="text" name="age" pattern="[0-9]{2}" /></td>
					</tr>
					<tr>
						<td><label for="lieu_naissance">Lieu de Naissance : </label></td>
						<td><input required type="text" name="lieu_naissance" /></td>
					</tr>
					<tr>
						<td><label for="taille">Taille (en mètres): </label></td>
						<td><input required type="text" name="taille" pattern="[0-9.]+" /></td>
					</tr>
					<tr>
						<td><label for="poids">Poids (en kilogramme): </label></td>
						<td><input required type="text" name="poids" pattern="[0-9.]*" /></td>
					</tr>
					<tr>
						<td><label for="nationnalite">Nationnalité : </label></td>
						<td><input required type="text" name="nationnalite" /></td>
					</tr>
					<tr>
						<td><label for="debut_carriere">Début de Carrière : </label></td>
						<td><input required type="text" name="debut_carriere"
							pattern="[0-9]{4}" />
						</td>
					</tr>

					<tr>
						<td>Main Dominante :</td>
						<td>
							<input required type="radio" id="Droite" name="main" value="Droite"> 
							<label for="Droite">Droite</label>
							<input required type="radio" id="Gauche" name="main" value="Gauche">
							<label for="Gauche">Gauche</label>
						</td>
					</tr>
					<tr>
						<td><label for="classement">Classement : </label></td>
						<td><input required type="text" name="classement" pattern="[0-9]*" /></td>
					</tr>
					<tr>
						<td><label for="entraineur">Entraineur : </label></td>
						<td><input required type="text" name="entraineur" /></td>
					</tr>
					<tr>
						<td><label for="salaire">Gain (en €): </label></td>
						<td><input required type="text" name="salaire" pattern="[0-9]*" /></td>
					</tr>
					<tr>
						<td><label for="victoires">Victoires : </label></td>
						<td><input required type="text" name="victoires" pattern="[0-9]*" /></td>
					</tr>
					<tr>
						<td><label for="defaites">Défaites : </label></td>
						<td><input required type="text" name="defaites" pattern="[0-9]*" /></td>
					</tr>

					<tr>
						<td>Catégorie :</td>
						<td>
							<label for="F">Femme</label>
							<input required type="radio" id="F" name="categorie" value="F"> 	
							<label for="H">Homme</label>
							<input required type="radio" id="H" name="categorie" value="H">
						</td>
					</tr>
					<tr style="text-align: left; width: 75%; margin: auto;">
						<td>
						<td><input  type="submit" name="Valider" value="Valider" /></td>
					</tr>
				</table>
			</form>

		</div>
	</div>
</main>
<%@include file="includes/footer.jsp"%>
</html>