<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestion des joueurs</title>
</head>
<body>
<form name="ajouter un joueurs" action="PlayerAdd" method="get">
<p style="text-align:left;width:75%;margin:auto;"><input type="submit" name="Ajouter un joueur" value="AjouterJoueur"/></p>
</form>
<form name="modifier un joueur" action="PlayerUpdate" method="get">
<p style="text-align:left;width:75%;margin:auto;"><input type="submit" name="Modifier un joueur" value="ModifierJoueur"/></p>
</form>
<form name="supprimer un joueur" action="PlayerDelete" method="get">
<p style="text-align:left;width:75%;margin:auto;"><input type="submit" name="Supprimer un joueur" value="SupprimerJoueur"/></p>
</form>
</body>
</html>