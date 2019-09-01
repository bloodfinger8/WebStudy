<%@page import="member.dao.MemberDAO"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:useBean id="boardDAO" class="board.dao.BoardDAO"/>

<%
request.setCharacterEncoding("UTF-8"); 

String subject = request.getParameter("subject");
String content = request.getParameter("content");

String id = (String)session.getAttribute("memId");
String name =(String)session.getAttribute("memName");
String email = (String)session.getAttribute("memEmail");

BoardDTO boardDTO = new BoardDTO();
boardDTO.setId(id);
boardDTO.setName(name);
boardDTO.setEmail(email);
boardDTO.setSubject(subject);
boardDTO.setContent(content);
//boardDTO.setRef();
//boardDTO.setLev();
//boardDTO.setStep();
//boardDTO.setPseq();
//boardDTO.setReply();
//boardDTO.setHit(); 

//DB , singleton은 jsp:usebean에서 잡아준다
int su = boardDAO.write(boardDTO);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(su != 0){%>
	글쓰기 성공
	<%}else{%>
	실패
	<%} %>
</body>
<script type="text/javascript">
window.onload=function(){
	alert("글쓰기 성공");
}
</script>

</html>