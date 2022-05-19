<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList,java.util.List,org.rolandGarros.model.Match,org.rolandGarros.model.Set,org.rolandGarros.model.Joueur"%>
<%
List<Match> listMatchs = (List<Match>) request.getAttribute("listMatchs");
%>
<!DOCTYPE html>
<html>
<head>
<title>Matchs</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/affichageListe.css" />
<%@include file="includes/header.jsp"%>

<main>
	<div class="overcontainer" style="margin-top: 2em;">
		<ul class="container">
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
			<li class="item"><a class="card">
					<div style="margin-top: 5px;">
						<h3><%=etape%></h3>
						<div class="row" style="margin-botton: 5px;">
							<span>Court : <%=court%></span> <span><%=h%>h<%=m%></span>
						</div>
						<div style="flex-grow: 4">
							<table style="">
								<tbody>
									<%
									for (Joueur joueur : joueurs) {
										String winner = (((match.getIdWinner() == match.getIdJ1()) && (match.getIdJ1() == joueur.getIdJoueur()))
										|| ((match.getIdWinner() == match.getIdJ2()) && (match.getIdJ2() == joueur.getIdJoueur()))) ? "win"
												: "loose";
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
											</div> <%
 }
 %>
										</td>
									</tr>

									<%
									}
									%>
								</tbody>
							</table>
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