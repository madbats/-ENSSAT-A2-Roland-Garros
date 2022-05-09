<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Coucou</title>
</head>
<body>
<form name="ajouter match" action="MatchAdd" method="post">
                 
        <h2 style="text-align:left">Ajouter Match</h2>
        <p style="text-align:left;">Identifiant : <input type="text" name="id" /></p>
        <p style="text-align:left;">Durée : <input type="text" name="duree" /></p>
        <p style="text-align:left;">Court : <input type="text" name="court" /></p>
        <p style="text-align:left;">Etape : <input type="text" name="etape" /></p>
        <p style="text-align:left;">Joueur 1 : <input type="text" name="idj1" /></p>
        <p style="text-align:left;">Joueur 2 : <input type="text" name="idj2" /></p>
             
        <p style="text-align:left;width:75%;margin:auto;"><input type="submit" name="Valider" value="Valider"/></p>
         	
       	</form>
</body>
</html>