<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList,java.util.List,org.rolandGarros.model.Joueur"%>
<%
List<Joueur> listJoueurs = (List<Joueur>) request.getAttribute("listJoueurs");
String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Programmer un Match</title>
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
			<form name="ajouter match" method="post">

				<h2 style="text-align: left">Programmer un Match</h2>
				<table>
					<tr>
						<td><label for="court" style="text-align: left;">Court</label></td>
						<td><input type="text" name="court" pattern="[0-9]*" required /></td>
					</tr>
					<tr>
						<td><label for="etape" style="text-align: left;">Etape</label></td>
						<td><input type="text" name="etape" required /></td>
					</tr>
					<tr>
						<td><label for="date" style="text-align: left;">Date
						</label></td>
						<td><input type="date" name="date" required /></td>
					</tr>
					<tr>
						<td><label for="idj1" style="text-align: left;">Joueur
								1</label></td>
						<td><select id="idj1" name="idj1" required>
								<%
								for (Joueur joueur : listJoueurs) {
								%>
								<option value="<%=joueur.getIdJoueur()%>"><%=joueur.getNom()%>
									<%=joueur.getPrenom()%></option>
								<%
								}
								%>
						</select></td>
					</tr>
					<tr>
						<td><label for="idj2" style="text-align: left;">Joueur
								2</label></td>
						<td><select id="idj2" name="idj2" required>
								<%
								for (Joueur joueur : listJoueurs) {
								%>
								<option value="<%=joueur.getIdJoueur()%>"><%=joueur.getNom()%>
									<%=joueur.getPrenom()%></option>
								<%
								}
								%>
						</select></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" name="Valider" value="Valider" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</main>
<%@include file="includes/footer.jsp"%>
</html>