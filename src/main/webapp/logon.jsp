<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page Login</title>
<%@include file="includes/header.jsp"%>
<main>
<div class="overcontainer" style="margin-top: 2em;">
		<div style="display: flex; flex-flow: column;">

<form action="j_security_check" method=post>
    <p><strong>Please Enter Your User Name: </strong>
    <input type="text" name="j_username" size="25" required=true>
    <p><p><strong>Please Enter Your Password: </strong>
    <input type="password" size="15" name="j_password" required=true>
    <p><p>
    <input type="submit" value="Submit">
    <input type="reset" value="Reset">
</form>
</div></div>
</main>
<%@include file="includes/footer.jsp"%>
</html>