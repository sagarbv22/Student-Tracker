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

			<c:when test="${std ne null}">
				<br />
				<br />
				<br />
				<table border="1">
					<tr>
						<th>ID</th>
						<td>${std.sid }</td>
					</tr>
					<tr>
						<th>NAME</th>
						<td>${std.sname }</td>
					</tr>
					<tr>
						<th>AGE</th>
						<td>${std.sage }</td>
					</tr>
					<tr>
						<th>ADDRESS</th>
						<td>${std.saddress }</td>
					</tr>

				</table>

			</c:when>
			
			<c:otherwise><h1 style="color: red">RECORD NOT AVAILABLE FOR ID :: ${id}</h1></c:otherwise>

		</c:choose>



	</center>
</body>
</html>