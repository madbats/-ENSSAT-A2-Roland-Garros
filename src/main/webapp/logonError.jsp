<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Erreur Login</title>
<%@include file="includes/header.jsp"%>
<main>
<div class="overcontainer" style="margin-top: 2em;">
		<div style="display: flex; flex-flow: column;">
	<c:url var="url" value="/Roland-Garros/home"/>
    <div class="error">
				<h2>Login incorrect</h2>
				<p>Le mot de passe et/ou login fournit est incorrect</p>
	</div>
    

    </div></div>
</main>
<%@include file="includes/footer.jsp"%>
</html>