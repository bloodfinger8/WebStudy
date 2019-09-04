<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:query dataSource="jdbc/oracle" var="rs">
 select * from usertable 
</sql:query>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="" method="post" action="jstlModifyForm.jsp">
<table border="1">
	<c:forEach var="colName" items="${rs.columnNames}">
		<th>${colName }</th>
	</c:forEach>
	<th>비고</th>
	
	<c:forEach var="row" items="${rs.rowsByIndex}">    <!-- 행  -->
		<tr>
		<c:forEach var="col" items="${row }">  <!-- 열  -->
			<td width="100" align="center">${col }</td>
		</c:forEach>
			<td align="center" width="150">
				<input type="button" value="수정" onclick="location.href='jstlModifyForm.jsp?id=${row[1]}'">
				<input type="button" value="삭제" onclick="location.href='jstlDelete.jsp'">
			</td>
		</tr>
	</c:forEach>
</table>
</form>
</body>
</html>








