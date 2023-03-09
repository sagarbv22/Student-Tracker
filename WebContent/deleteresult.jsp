<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search</title>
</head>
<body>
	<center>
		<c:choose>

			<c:when test="${status eq 'success'}">
				<br />
				<br />
				<br />
				<h1 style='color:green; text-align:center;'> RECORD DELETED SUCCESSFULLY</h1>
			</c:when>
			<c:when test="${status eq 'notAvailable'}">
				<br />
				<br />
				<br />
				<h1 style='color:red; text-align:center;'>RECORD NOT FOUND FOR DELETION</h1>
			</c:when>
			
			<c:otherwise><h1 style='color:red; text-align:center;'>RECORD DELETION FAILED</h1></c:otherwise>

		</c:choose>



	</center>
</body>
</html>