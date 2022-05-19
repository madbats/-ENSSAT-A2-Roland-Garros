<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.List,org.rolandGarros.model.Match,java.util.List,org.rolandGarros.model.Joueur"%>
<%
Match match = (Match) request.getAttribute("match");
String message = (String) request.getAttribute("message");
int nombreSet = match.getSets().size();

Joueur joueur1 = match.getJoueurs().stream().filter(e -> e.getIdJoueur() == match.getIdJ1()).toList().get(0);
Joueur joueur2 = match.getJoueurs().stream().filter(e -> e.getIdJoueur() == match.getIdJ2()).toList().get(0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifier Match</title>
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
			<%
			if (nombreSet < 2) {
			%>
			<form name="update match"
				action="/Roland-Garros/mm/update?id=<%=match.getIdMatch()%>"
				method="post">

				<h2 style="text-align: left">Résultat du Match</h2>
				<table>
					<tr>
						<td><label for="duree" style="text-align: left;">Duree
								(hh:mm)</label></td>
						<td><input type="time" name="duree" required
							value=<%=match.getCourt()%> /></td>
					</tr>
				</table>
				<fieldset>
					<legend>Set 1</legend>
					<table>
						<tr>
							<td><label for="set1-sc1" style="text-align: left;"><%=joueur1.getNom()%></label></td>
							<td><input type="number" name="set1-sc1"required%></td>
						</tr>
						<tr>
							<td><label for="set1-sc2" style="text-align: left;"><%=joueur2.getNom()%></label></td>
							<td><input type="number" name="set1-sc2"required%></td>
						</tr>
					</table>
				</fieldset>
				</br>

				<fieldset>
					<legend>Set 2</legend>
					<table>
						<tr>
							<td><label for="set2-sc1" style="text-align: left;"><%=joueur1.getNom()%></label></td>
							<td><input type="number" name="set2-sc1"required%></td>
							<td><label for="set2-sc2" style="text-align: left;"><%=joueur2.getNom()%></label></td>
							<td><input type="number" name="set2-sc2"required%></td>
						</tr>
					</table>
				</fieldset>
				<input type="submit" name="Valider" value="Valider" />

			</form>
			<%
			} else {
			%>
			<form name="update match"
				action="/Roland-Garros/mm/update?id=<%=match.getIdMatch()%>"
				method="post">

				<h2 style="text-align: left"><%=nombreSet + 1%>e Set
				</h2>

				<input for="number" name="numero" hidden> <label
					for="set-sc1" style="text-align: left;"><%=joueur1.getNom()%></label>
				<input type="number" name="set-sc1"required%> <label
					for="set-sc2" style="text-align: left;"><%=joueur2.getNom()%></label>
				<input type="number" name="set-sc2"required%> <input
					type="submit" name="Valider" value="Valider" />

			</form>
			<%
			}
			%>
			<a href="/Roland-Garros/mm"><button>Annuler</button></a>
		</div>
	</div>
</main>
<%@include file="includes/footer.jsp"%>
</html>