<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
//String name =(String)request.getSession().getAttribute("name");
String name = request.getParameter("name");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=name%>님 로그인 하였습니다!!
<!--<input type="hidden" name="id" value="<%=id%>">-->
<input type="submit" value="회원정보수정">
<input type="button" value="로그아웃">
</body>
</html>