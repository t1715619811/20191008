
<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	 <c:forEach var="p" items="${sessionScope.mohuselect}">  
					
						<tr>
							<td style="text-align: center;"><input type="checkbox" name="ids" id=""  value=${p.id }  /></td>
							<td>${p.id }</td>
							<td>${p.name }</td>
							<td>${p.telephone }</td>
							<td>${p.area }</td>
</tr>
<br>
</c:forEach>
	
</body>
</html>