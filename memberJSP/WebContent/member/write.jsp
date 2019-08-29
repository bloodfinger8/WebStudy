<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="memberDTO" class="member.bean.MemberDTO"/>
<jsp:setProperty property="*" name="memberDTO"/>  
<%
MemberDAO memberDAO =MemberDAO.getInstance();
int su = memberDAO.write(memberDTO);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%if(su == 1){%>
	<%=su%>건 회원등록 되었습니다.
	<br><br>
	<input type="button" value="로그인" onclick=location.href='loginForm.jsp'>
<%} else{%>
	회원등록에 실패했습니다.
<%}%>

</body>
</html>