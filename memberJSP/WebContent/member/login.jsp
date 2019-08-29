<%@page import="java.net.URLEncoder"%>
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
<title></title>
</head>
<body>
<form name="logindivForm" method="post" action="">
<img src="../image/jspImg.png" width="70" height="70" 
onclick="location.href='../main/index.jsp'" style="cursor:pointer;"></img>

<%if(name==null){%>
	<%
	response.sendRedirect("loginFail.jsp");
	%>
  <%}else{%>
	<%
	//request.getSession().setAttribute("name", name);
	//response.sendRedirect("loginOk.jsp");
	
	response.sendRedirect("loginOk.jsp?name=" + URLEncoder.encode(name, "UTF-8"));// 주소창에 name을 인코딩,암호화
	%>
<%}%>
</form>
</body>
</html>