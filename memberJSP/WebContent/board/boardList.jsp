<%@page import="java.util.List"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardDAO" class="board.dao.BoardDAO"/>
<%
request.setCharacterEncoding("UTF-8");

int pg = Integer.parseInt(request.getParameter("pg"));
int endNum = pg*5;
int startNum = endNum-4;

List<BoardDTO> list = boardDAO.writeAll(startNum, endNum);
int totalA = boardDAO.getTotalA(); //총 게시물 갯수
int totalP = ((totalA-1)/5) +1; // 5개로 나눈다

System.out.println("totalA : " +totalA + " totalP : " +totalP );
//System.out.println(list.size());
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/boardList.css">
<img src="../image/jspImg.png" width="70" height="70" 
onclick="location.href='../main/index.jsp'" style="cursor:pointer;"></img>
</head>
<body>
<%if(list != null) {%>
<table border="1" frame="hsides" rules="rows" cellspacing="0" cellpadding="10">
			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<%for(BoardDTO boardDTO : list){%>
			<tr>
				<td><%=boardDTO.getSeq()%></td>
				<td><a href="./boardView.jsp"><%=boardDTO.getSubject()%></a></td>
				<td><%=boardDTO.getId()%></td>
				<td><%=boardDTO.getLogtime()%></td>
				<td><%=boardDTO.getHit()%></td>
			</tr>
			<%}%>
			<tr >
			<td colspan="5">
			<%for(int j=1; j<=totalP; j++) {%>
				<a href="./boardList.jsp?pg=<%=j%>">[<%=j%>]</a>
			<%}%>
			</td>
			</tr>
	</table>
<%} else{%>
list 비어있음
<%} %>
</body>
</html>