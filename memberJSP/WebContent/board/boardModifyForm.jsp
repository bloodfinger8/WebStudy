<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardDAO" class="board.dao.BoardDAO"/>

<%
int pg = Integer.parseInt(request.getParameter("pg"));
int seq = Integer.parseInt(request.getParameter("seq"));
System.out.println("pg =" +pg + "seq=" + seq);

BoardDTO boardDTO = new BoardDTO();
boardDTO = boardDAO.seletedListInfo(seq);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="boardModifyForm" method="post" action="boardModify.jsp">
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" size="50" value="<%=boardDTO.getSubject() %>"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="13" cols="50"><%=boardDTO.getContent()%></textarea></td>
			</tr>
			<tr>
				<th colspan="2" align="center">
				<input type="submit" value="글수정"> 
				<input type="reset" value="다시작성">
				</th>
			</tr>
		</table>
		<input type="hidden" name="pg" value="<%=pg%>">
		<input type="hidden" name="seq" value="<%=seq%>">
</form>
</body>
</html>