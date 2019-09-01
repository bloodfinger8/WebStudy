<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardDAO" class="board.dao.BoardDAO"/>
   
<%
request.setCharacterEncoding("UTF-8");
int seq = Integer.parseInt(request.getParameter("seq"));

BoardDTO boardDTO = new BoardDTO();
boardDTO = boardDAO.seletedListInfo(seq);
//session ID 가져오기
String id = (String)session.getAttribute("memId");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
pre {
	overflow: auto;
	width: 400;
	height: 70px;
	white-space: pre-line;
	word-break: break-all;
}
</style>
</head>
<body>
<form name="boardViewForm" method="post" action="">
<table border="1" frame="hsides" rules="rows" cellspacing="0" cellpadding="10">
			<tr>
				<td colspan="3"><h3><%=boardDTO.getSubject()%></h3></td>
				
			</tr>
			<tr>
				<td>글번호 : <%=boardDTO.getSeq()%></td>
				<td>작성자 : <%=boardDTO.getId()%></td>
				<td>조회수 : <%=boardDTO.getHit()%></td>
			</tr>
			<tr>
				<td colspan="3"><pre><%=boardDTO.getContent()%></pre></td>
			</tr>
			
			<%if(boardDTO.getId().equals(id)){ %>
			<tr>
			<td colspan="3" ><input type="button" value="글수정" >
			<input type="button" value="글삭제" > </td>
			</tr>
			<%}%>
	</table>
</form>
</body>
</html>