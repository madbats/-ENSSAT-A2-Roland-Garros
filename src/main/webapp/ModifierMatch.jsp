<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modifier Match</title>
<<<<<<< Updated upstream
<%@include file="includes/header.jsp"%>
<main>

</main>
<%@include file="includes/footer.jsp"%>
=======
<%@page import="java.util.List,org.rolandGarros.model.Match"%>
<%

List<Match> listMatch = (List<Match>)request.getAttribute("listMatch");

%>


</head>
<body>
Liste des matchs :
<table border="1">

      <tr>
			<th>Identifiant</th>

            <th>Durée</th>
            
            <th>Court</th> 
            
            <th>Etape</th> 
            
            <th>Identifiant Joueur 1</th>
            
            <th>Identifiant Joueur 2</th>

      </tr>
      
<%

for (Match match:listMatch) {

      int id = match.getIdMatch();

      int durée = match.getDureeSecondes();
      
      int court = match.getCourt();
      
      String etape = match.getEtape();
      
      int idj1 = match.getIdJ1();
      
      int idj2 = match.getIdJ1();

%>

<tr>

      <td><%=id %></td>

      <td><%=durée %></td>
      
      <td><%=court %></td>
      
      <td><%=etape %></td>
      
      <td><%=idj1 %></td>
      
      <td><%=idj2 %></td>
      

</tr>

<%

}

%>

</table>
</body>
>>>>>>> Stashed changes
</html>