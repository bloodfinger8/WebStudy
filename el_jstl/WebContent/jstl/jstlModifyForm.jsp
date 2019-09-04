<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<sql:query var="rs" dataSource="jdbc/oracle">
	select * from usertable where id = '${param.id}' 
</sql:query>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
</head>
<body>
	
<form name="jstlModifiyForm" method="post" action="jstlModify.jsp">
	<c:forEach var="row" items="${rs.rowsByIndex}">
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th width="80">이름</th>
				<td width="320"><input type="text" name="name" value="${row[0]}"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text"  name="id" value="${row[1]}">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" value="${row[2]}"></td>
			</tr>
			<tr>
				<th colspan="2" align="center">
				<input type="submit" value="수정"> 
				</th>
			</tr>
		</table>
		<input type="hidden" value="${param.id}">
	</c:forEach>
	</form>
</body>
</html>