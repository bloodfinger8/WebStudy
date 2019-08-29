<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="dataDTO" class="exam.bean.DataDTO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="inputForm" method="get" action="sum.jsp">
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th>X</th>
				<td><input type="text" name="x"></td>
			</tr>
			<tr>
				<th>Y</th>
				<td><input type="text" name="y"></td>
			</tr>
			<tr>
				<th colspan="2" align="center">
				<input type="submit" value="합구하기">
				</th>
			</tr>
		</table>
</form>
</body>
</html>