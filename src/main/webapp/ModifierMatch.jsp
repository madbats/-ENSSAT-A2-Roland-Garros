<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.List,org.rolandGarros.model.Match,java.util.List,org.rolandGarros.model.Joueur"%>
<%
Match match = (Match) request.getAttribute("match");
String message = (String) request.getAttribute("message");
int nombreSet = match.getSets().size();

Joueur joueur1 = match.getJoueurs().stream().filter(e->e.getIdJoueur()==match.getIdJ1()).toList().get(0);
Joueur joueur2 = match.getJoueurs().stream().filter(e->e.getIdJoueur()==match.getIdJ2()).toList().get(0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
			<%if(nombreSet<2){ %>
			<form name="update match" action="/Roland-Garros/mm/update?id=<%=match.getIdMatch()%>" method="post">
			
				<h2 style="text-align: left">Résultat du Match</h2>
				<label for="duree" style="text-align: left;">Duree (hh:mm)</label> 
				<input type="time" name="duree" required value=<%=match.getCourt() %>/>
				<fieldset>
				<legend>Set 1</legend>
				<input for="number" name="numero" hidden>
				<label for="set1-sc1" style="text-align: left;"><%= joueur1.getNom() %></label> 
				<input type="number" name="set1-sc1" required%>
				<label for="set1-sc2" style="text-align: left;"><%= joueur2.getNom() %></label> 
				<input type="number" name="set1-sc2" required%>
				</fieldset>
				</br>
				
				<fieldset>
				<legend>Set 2</legend>
				<input for="number" name="numero" hidden>
				<label for="set2-sc1" style="text-align: left;"><%= joueur1.getNom() %></label> 
				<input type="number" name="set2-sc1" required%>
				<label for="set2-sc2" style="text-align: left;"><%= joueur2.getNom() %></label> 
				<input type="number" name="set2-sc2" required%>
				</fieldset>
				</br>
				<input type="submit" name="Valider" value="Valider" />
			</form>
			<%}else{ %>
			<form name="update match" action="/Roland-Garros/mm/update?id=<%=match.getIdMatch()%>" method="post">
			
				<h2 style="text-align: left"><%=nombreSet+1 %>e Set</h2>
				
				<input for="number" name="numero" hidden>
				<label for="set-sc1" style="text-align: left;"><%= joueur1.getNom() %></label> 
				<input type="number" name="set-sc1" required%>
				<label for="set-sc2" style="text-align: left;"><%= joueur2.getNom() %></label> 
				<input type="number" name="set-sc2" required%>
				<input type="submit" name="Valider" value="Valider" />
				
			</form>
			<% } %>
			<a href="/Roland-Garros/mm"><button>Annuler</button></a>
		</div>
	</div>
</main>
<%@include file="includes/footer.jsp"%>
</html>