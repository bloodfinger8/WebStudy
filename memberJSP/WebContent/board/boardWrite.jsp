<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8"); 

String subject = request.getParameter("subject");
String content = request.getParameter("content");

BoardDTO boardDTO = new BoardDTO();
boardDTO.setId("hong");
boardDTO.setName("홍길동");
boardDTO.setEmail("hong@java.com");
boardDTO.setSubject(subject);
boardDTO.setContent(content);
//boardDTO.setRef();
//boardDTO.setLev();
//boardDTO.setStep();
//boardDTO.setPseq();
//boardDTO.setReply();
//boardDTO.setHit(); 

BoardDAO boardDAO = BoardDAO.getInstance();
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
</html>