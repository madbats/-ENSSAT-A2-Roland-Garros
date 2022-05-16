<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Page Login</title>
<%@include file="includes/header.jsp"%>
<main>
<h2>Hello, please log in:</h2>
<br><br>
<form action="j_security_check" method=post>
    <p><strong>Please Enter Your User Name: </strong>
    <input type="text" name="j_username" size="25" required=true>
    <p><p><strong>Please Enter Your Password: </strong>
    <input type="password" size="15" name="j_password" required=true>
    <p><p>
    <input type="submit" value="Submit">
    <input type="reset" value="Reset">
</form>
</main>
<%@include file="includes/footer.jsp"%>
</html>