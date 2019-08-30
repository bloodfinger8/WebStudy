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

MemberDTO memberDTO = new MemberDTO();
MemberDAO memberDAO = MemberDAO.getInstance();
String name = memberDAO.loginCheck(id, pwd);
memberDTO = memberDAO.getMember(id);

String email = memberDTO.getEmail1() + "@" + memberDTO.getEmail2();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<form name="logindivForm" method="post" action="">

<%if(name==null){%>
	<%
	response.sendRedirect("loginFail.jsp");
	%>
  <%}else{%>
	<%
	//response.sendRedirect("loginOk.jsp?name=" + URLEncoder.encode(name, "UTF-8"));// 주소창에 name을 인코딩,암호화
	
	//cookie
	Cookie cookie = new Cookie("memName",name);//Cookie 생성 
	cookie.setMaxAge(30*60); //cookie 초단위 수명 , 30분
	response.addCookie(cookie);//cilent 저장
	
	Cookie cookie2 = new Cookie("memId",id);
	cookie2.setMaxAge(30*60);
	response.addCookie(cookie2);
	//session
	//HttpSession session = request.getSession();
	session.setAttribute("memName", name);
	session.setAttribute("memId", id);
	session.setAttribute("memEmail", email);
	//request.getSession().setAttribute("name", name);
	response.sendRedirect("loginOk.jsp");
	%>
<%}%>
</form>
</body>
</html>