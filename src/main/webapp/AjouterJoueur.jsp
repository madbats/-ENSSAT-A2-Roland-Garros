<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ajouter un joueur</title>
</head>
<body>
<form name="ajouter joueur" action="PlayerAdd" method="post">
                 
        <h2 style="text-align:left">Ajouter Match</h2>
        <p style="text-align:left;">Identifiant : <input type="text" name="id" /></p>
        <p style="text-align:left;">Prénom : <input type="text" name="prenom" /></p>
        <p style="text-align:left;">Nom : <input type="text" name="nom" /></p>
        <p style="text-align:left;">Age : <input type="text" name="age" /></p>
        <p style="text-align:left;">Lieu de Naissance : <input type="text" name="lieu_naissance" /></p>
        <p style="text-align:left;">Taille : <input type="text" name="taille" /></p>
        <p style="text-align:left;">Poids : <input type="text" name="poids" /></p>
        <p style="text-align:left;">Nationnalité : <input type="text" name="nationnalite" /></p>
        <p style="text-align:left;">Début de Carrière : <input type="text" name="debut_carriere" /></p>
        <p style="text-align:left;">Main Dominante : <input type="text" name="main" /></p>
        <p style="text-align:left;">Classement : <input type="text" name="classement" /></p>
        <p style="text-align:left;">Entraineur : <input type="text" name="entraineur" /></p>
        <p style="text-align:left;">Salaire : <input type="text" name="salaire" /></p>
        <p style="text-align:left;">Victoires : <input type="text" name="victoires" /></p>
        <p style="text-align:left;">Défaites : <input type="text" name="defaites" /></p>
        <p style="text-align:left;">Catégorie : <input type="text" name="categorie" /></p>
             
        <p style="text-align:left;width:75%;margin:auto;"><input type="submit" name="Valider" value="Valider"/></p>
         	
       	</form>
</body>
</html>