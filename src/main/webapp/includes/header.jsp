<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css" >
</head>
<header>
<link rel="icon" href="pictures/roland-garros-logo.ico" type="image/icon type">


<div class="beta">
  <img src="pictures/roland-garros.svg"/>
  <a href="home" style="text-decoration: none;"> <h1>  Roland-Garros </h1></a>
  
</div>

<nav>
  <ul>
    <li class="deroulant"><a href="#"> Tournoi &ensp;</a>
      <ul class="sous">
        <li><a href="joueurs"> Liste des joueuses / joueurs </a></li>
        <li><a href=""> Ajouter un joueur </a></li>
        <li><a href=""> Modifier un joueur </a></li>
        <li><a href=""> Supprimer un joueur </a></li>
        <li><a href="matchs"> Liste des matchs </a></li>
        <li><a href=""> Ajouter un match </a></li>
        <li><a href=""> Modifier un match </a></li>
        <li><a href=""> Supprimer un match </a></li>
      </ul>
    </li>
    <li class="deroulant"><a href="#"> Statistiques &ensp;</a>
      <ul class="sous">
        <li><a href="#"> Nombre de matchs remport�s </a></li>
        <li><a href="#"> Duree de jeu </a></li>
        <li><a href="#"> Categorie </a></li>
      </ul>
    </li>
    <%if(request.getUserPrincipal()!=null) { %>
    	<li></li>
       	<li><a href="logout"> Logout </a></li>
    <%}else{ %>
    	<li></li>
    	<li></li>
    <%} %>
  </ul>
</nav>

</header>
<body>