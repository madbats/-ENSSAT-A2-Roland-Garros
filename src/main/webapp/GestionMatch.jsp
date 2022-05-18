<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.ArrayList,java.util.List,org.rolandGarros.model.Match,org.rolandGarros.model.Set,org.rolandGarros.model.Joueur"%>
<%
List<Match> listMatchs = (List<Match>) request.getAttribute("listMatchs");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestion des matchs</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/affichageListe.css" />
<%@include file="includes/header.jsp"%>
<main>
	<div class="overcontainer" style="margin-top: 2em;">
		<ul class="container">
			<li class="item"><a href="/Roland-Garros/mm/new" class="card">
					<div style="margin-top: 5px;">Programmer un Match</div>
			</a></li>
			<%
			for (Match match : listMatchs) {
				String etape = match.getEtape();
				int court = match.getCourt();
				int duree = match.getDureeSecondes();
				int h = duree / 3600;
				int m = (duree - h * 3600) / 60;
				List<Joueur> joueurs = new ArrayList<Joueur>(match.getJoueurs());
				List<Set> sets = new ArrayList<Set>(match.getSets());
			%>
			<li class="item">
				<a class="card">
					<div style="margin-top: 5px;">
						<h3><%=etape%></h3>
						<div class="row" style="margin-botton: 5px;">
							<span>Court : <%=court%></span> <span><%=match.getDate()%></span>
							<%
							if (duree > 0) {
							%>
							<span><%=h%>h<%=m%></span>
							<%
							}
							%>
						</div>
						<div style="flex-grow: 4">
							<table style="">
								<tbody>
									<%
									for (Joueur joueur : joueurs) {
										int idWin = match.getIdWinner();
										String winner;
										if (idWin != -1) {
											winner = (((idWin == match.getIdJ1()) && (match.getIdJ1() == joueur.getIdJoueur()))
											|| ((idWin == match.getIdJ2()) && (match.getIdJ2() == joueur.getIdJoueur()))) ? "win" : "loose";
										} else {
											winner = "loose";
										}
									%>
									<tr class="row <%=winner%>">

										<th style="flex-grow: 1; width: 50%"><%=joueur.getNom()%>
											<%=joueur.getPrenom()%></th>
										<%
										if (winner == "win") {
										%>
										<td style="width: 25px; margin: 0px 5px 0;">&#10003;</td>
										<%
										}
										%>
										<td class="row">
											<%
											for (Set set : sets) {
												int score = (match.getIdJ1() == joueur.getIdJoueur()) ? set.getScoreJ1() : set.getScoreJ2();
											%>
											<div style="width: 25px; margin: 0px 5px 0;">
												<%=score%>
											</div> 
											<% } %>

										</td>
									</tr>

									<%
									}
									%>


								</tbody>
							</table>
							
						</div>
					</div>
				</a>
				<div class="modif" style="display: flex">
					<% if(match.getDureeSecondes()>0){ %>
					<a href="/Roland-Garros/mm/update?id=<%=match.getIdMatch()%>"><button type="submit">Ajouter des Sets</button></a>
					<%}else{ %>
					<a href="/Roland-Garros/mm/update?id=<%=match.getIdMatch()%>"><button type="submit">Update</button></a>	
					<% } %>
					<a href="/Roland-Garros/mm/delete?id=<%=match.getIdMatch()%>"><button type="submit">Delete</button></a>
					
										
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