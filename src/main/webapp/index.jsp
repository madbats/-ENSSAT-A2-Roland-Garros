<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Roland-Garros</title>
<%@include file="includes/header.jsp"%>

<main>
<div class="conteneur">

	<h2 style="text-align:center;"> Bienvenue sur le site de Roland-Garros ! </h2>
	<div class="imaged"><a href="matchs"><img src="pictures/balle_sur_court.jpg" style="height:400px; width:auto; display: block; margin-left: auto; margin-right: auto; width: 50%;" /></a></div>
	<a href="matchs" style="text-decoration: none;"><div class="index" style="text-align: center; text-decoration: none; box-shadow: none; list-style-type: none; color:black;"> Accès à la liste des matchs </div> </a>

	<div class="imaged"><a href="joueurs"><img src="pictures/balles-tennis-deux-raquettes.jpg" style="height:400px; width:auto; display: block; margin-left: auto; margin-right: auto; width: 50%;"/></a></div>
	<a href="joueurs" style="text-decoration: none;"><div class="index" style="text-align: center; text-decoration: none; box-shadow: none; list-style-type: none; color:black;"> Accès aux fiches des joueurs </div> </a>

</div>
</main>
<%@include file="includes/footer.jsp"%>
</html>