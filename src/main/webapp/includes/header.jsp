<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css" >
<link rel="icon" href="/Roland-Garros/pictures/roland-garros-logo.ico" type="image/icon type">
</head>
<header>



<div class="beta">

  <img src="/Roland-Garros/pictures/roland-garros.svg"/>
  <a href="/Roland-Garros/home" style="text-decoration: none;"> <h1>  Roland-Garros </h1></a>

</div>

<nav>
  <ul>
    <li class="deroulant"><a href="joueurs"> Joueurs &ensp;</a>
      <ul class="sous">
        <li><a href="joueurs"> Liste des joueuses / joueurs </a></li>
        <li><a href="jm/new"> Ajouter un joueur </a></li>
        <li><a href="jm/update"> Modifier un joueur </a></li>
        <li><a href="jm/delete"> Supprimer un joueur </a></li>
      </ul>
    </li>
    <li class="deroulant"><a href="matchs"> Matchs &ensp;</a>
      <ul class="sous">
        <li><a href="matchs"> Liste des matchs </a></li>
        <li><a href="mm/new"> Ajouter un match </a></li>
        <li><a href="mm/update"> Modifier un match </a></li>
        <li><a href="mm/delete"> Supprimer un match </a></li>
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