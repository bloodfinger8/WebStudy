<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jsp에서의 객체생성(singleton) ,but jsp에서 죽었다. 사용ㄴ  -->
<jsp:useBean id="dataDTO" class="exam.bean.DataDTO" scope="session"/>
<!--데이터를 DTO에 입력-->
<jsp:setProperty property="x" name="dataDTO"/>
<jsp:setProperty property="y" name="dataDTO"/>

<%
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="sumForm" method="get" action="mul.jsp">
<jsp:getProperty property="x" name="dataDTO"/> + 
<jsp:getProperty property="y" name="dataDTO"/> = 
<%=dataDTO.getX() + dataDTO.getY()%>
<br><br>
<input type=submit value="곱구하기">
<input type="button" value="곱구하기2" onclick="location.href='mul.jsp?">
</form>
</body>
</html>