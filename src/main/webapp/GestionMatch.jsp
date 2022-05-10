<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestion des matchs</title>
<%@include file="includes/header.jsp"%>
<main>
<form name="ajouter match" action="MatchAdd" method="get">
<p style="text-align:left;width:75%;margin:auto;"><input type="submit" name="Ajouter un Match" value="AjouterMatch"/></p>
</form>
<form name="modifier match" action="MatchUpdate" method="get">
<p style="text-align:left;width:75%;margin:auto;"><input type="submit" name="Modifier un match" value="ModifierMatch"/></p>
</form>
<form name="supprimer match" action="MatchDelete" method="get">
<p style="text-align:left;width:75%;margin:auto;"><input type="submit" name="Supprimer un match" value="SupprimerMatch"/></p>
</form>
</main>
<%@include file="includes/footer.jsp"%>
</html>