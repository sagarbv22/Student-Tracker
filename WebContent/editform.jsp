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
				<form method='post' action='./controller/updateRecord'>
					<table border="1">
						<tr>
							<th>ID</th>
							<td><input type="text" name= "sid" value=${std.sid } readonly /></td>
						</tr>
						<tr>
							<th>NAME</th>
							<td><input type="text"  name= "sname" value=${std.sname } /></td>
						</tr>
						<tr>
							<th>AGE</th>
							<td><input type="text"  name= "sage" value=${std.sage } /></td>
						</tr>
						<tr>
							<th>ADDRESS</th>
							<td><input type="text"  name= "saddr" value= '${std.saddress}' /></td>
						</tr>
						<tr>
							<td></td>
							<td><input type='submit' value='update' /></td>
						</tr>
					</table>
				</form>

			</c:when>

			<c:otherwise>
				<h1 style="color: red">RECORD NOT AVAILABLE FOR ID :: ${id}</h1>
			</c:otherwise>

		</c:choose>



	</center>
</body>
</html>