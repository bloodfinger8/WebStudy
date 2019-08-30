<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
String name =null;
String id = null;

name = (String)session.getAttribute("memName");
id = (String)session.getAttribute("memId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>

</head>
<body>
<h1> **메인화면***</h1>
<%if(name == null & id == null){ %>
<a href="../member/writeForm.jsp">회원가입</a><br>
<a href="../member/loginForm.jsp">로그인</a><br>
<%}else {%>
<a href="../member/modifiyForm">회원정보수정</a><br>
<a href="../member/logout.jsp">로그아웃</a><br>
<a href="../board/boardWriteForm.jsp">글쓰기</a><br>
<%} %>
<a href="../board/boardList.jsp?pg=1">목록</a><br>
</body>
</html>