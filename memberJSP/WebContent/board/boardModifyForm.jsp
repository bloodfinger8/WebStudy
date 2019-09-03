<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardDAO" class="board.dao.BoardDAO"/>

<%
int pg = Integer.parseInt(request.getParameter("pg"));
int seq = Integer.parseInt(request.getParameter("seq"));
System.out.println("pg=" +pg + "seq=" + seq);

BoardDTO boardDTO = new BoardDTO();
boardDTO = boardDAO.seletedListInfo(seq);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>
<h3>글수정</h3>
<form name="boardModifyForm" method="post" action="boardModify.jsp">
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" id="subject" size="50" value="<%=boardDTO.getSubject() %>"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content" rows="13" cols="50"><%=boardDTO.getContent()%></textarea></td>
			</tr>
			<tr>
				<th colspan="2" align="center">
				<input type="button" value="글수정" onclick="checkBoard()"> 
				<input type="reset" value="다시작성">
				</th>
			</tr>
		</table>
		<input type="hidden" name="pg" value="<%=pg%>">
		<input type="hidden" name="seq" value="<%=seq%>">
</form>
</body>
<script src="../js/board.js" type="text/javascript"> </script>
</html>