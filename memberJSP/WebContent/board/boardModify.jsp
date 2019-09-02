<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardDAO" class="board.dao.BoardDAO"/>    
<%
request.setCharacterEncoding("UTF-8");
int pg= Integer.parseInt(request.getParameter("pg"));
int seq = Integer.parseInt(request.getParameter("seq"));

BoardDTO boardDTO = new BoardDTO();
boardDTO.setSubject(request.getParameter("subject"));
boardDTO.setContent(request.getParameter("content"));
boardDTO.setSeq(Integer.parseInt(request.getParameter("seq")));
System.out.println(request.getParameter("subject")); 
int su = boardDAO.modify(boardDTO); 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
<p><%=su%>글수정 완료</p>
<%-- <input type="button" value="목록" onclick="location.href='boardList.jsp?pg=<%=pg%>'"> --%>
</body>
</html>