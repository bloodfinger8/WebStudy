<%@page import="java.util.ArrayList"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

MemberDAO memberDAO = MemberDAO.getInstance();
String name = memberDAO.loginCheck(id, pwd);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="modifyForm.jsp">
<%if(name==null){%>
	로그인 실패
  <%}else{%>
	<%=name%>님 로그인 하였습니다
	<br><br>
	<input type="hidden" name="id" value="<%=id%>">
	<input type="button" value="로그아웃">
	<input type="submit" value="회원정보수정">
<%}%>
</form>
</body>
</html>