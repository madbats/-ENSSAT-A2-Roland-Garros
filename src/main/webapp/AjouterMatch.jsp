<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.ArrayList,java.util.List,org.rolandGarros.model.Joueur"%>
<%
List<Joueur> listJoueurs = (List<Joueur>) request.getAttribute("listJoueurs");
String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
				<label for="court" style="text-align: left;">Court</label> <input
					type="number" name="court" pattern="[0-9]*" required /> </br> <label
					for="etape" style="text-align: left;">Etape</label> <input
					type="text" name="etape" required /> </br> <label for="date"
					style="text-align: left;">Date </label> <input type="date"
					name="date" required /> </br> <label for="idj1"
					style="text-align: left;">Joueur 1</label> <select id="idj1"
					name="idj1" required>
					<%
					for (Joueur joueur : listJoueurs) {
					%>
					<option value="<%=joueur.getIdJoueur()%>"><%=joueur.getNom()%>
						<%=joueur.getPrenom()%></option>
					<%
					}
					%>
				</select> </br> <label for="idj2" style="text-align: left;">Joueur 2</label> <select
					id="idj2" name="idj2" required>
					<%
					for (Joueur joueur : listJoueurs) {
					%>
					<option value="<%=joueur.getIdJoueur()%>"><%=joueur.getNom()%>
						<%=joueur.getPrenom()%></option>
					<%
					}
					%>
				</select> </br> <input type="submit" name="Valider" value="Valider" />
			</form>
		</div>
	</div>
</main>
<%@include file="includes/footer.jsp"%>
</html>