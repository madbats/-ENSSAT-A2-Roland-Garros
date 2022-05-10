<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="styles/style.css" >
<title>Roland-Garros</title>
</head>
<body>
<h1>Roland-Garros</h1>

<nav>
  <ul>
    <li class="deroulant"><a href="#"> Tournoi &ensp;</a>
      <ul class="sous">
        <li><a href="AfficheJoueur.jsp"> Liste des joueuses / joueurs </a></li>
        <li><a href="AjouterJoueur.jsp"> Ajouter un joueur </a></li>
        <li><a href="ModifierJoueur.jsp"> Modifier un joueur </a></li>
        <li><a href="SupprimerJoueur.jsp"> Supprimer un joueur </a></li>
        <li><a href="#"> Liste des matchs </a></li>
        <li><a href="AjouterMatch.jsp"> Ajouter un match </a></li>
        <li><a href="ModifierMatch.jsp"> Modifier un match </a></li>
        <li><a href="SupprimerMatch.jsp"> Supprimer un match </a></li>
      </ul>
    </li>
    <li class="deroulant"><a href="#"> Statistiques &ensp;</a>
      <ul class="sous">
        <li><a href="#"> Nombre de matchs remportés </a></li>
        <li><a href="#"> Durée de jeu </a></li>
        <li><a href="#"> Catégorie </a></li>
      </ul>
    </li>
    <li><a href="#"> Authentification </a></li>
    <li><a href="#"> A propos </a></li>
  </ul>
</nav>

<!-- fin header -->

<div class="conteneur">
  <p> Du contenu sous le menu </p>
</div>

<!-- début footer -->
<div> Copyright </div>
<!-- fin footer -->
</body>
</html>