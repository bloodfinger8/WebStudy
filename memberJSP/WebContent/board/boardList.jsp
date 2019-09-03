<%@page import="board.bean.BoardPaging"%>
<%@page import="java.util.List"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardDAO" class="board.dao.BoardDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	int pg = Integer.parseInt(request.getParameter("pg"));

	int endNum = pg * 5;
	int startNum = endNum - 4;
	List<BoardDTO> list = boardDAO.writeAll(startNum, endNum);
	//페이징처리
	BoardPaging boardPaging = new BoardPaging();
	int totalA = boardDAO.getTotalA(); //총 글수
	boardPaging.setCurrentPage(pg);
	boardPaging.setPageBlock(3);
	boardPaging.setPageSize(5);
	boardPaging.setTotalA(totalA);
	boardPaging.makePagingHTML();

	String memId = "";
	if (session.getAttribute("memId") != null) //아이디가 널값일수도 있기때문에
		memId = (String) session.getAttribute("memId"); //로그인체크용

	//조회수 - 새로고침 방지
	//쿠키
	if (session.getAttribute("memId") != null){
		Cookie cookie = new Cookie("memHit","0");
		cookie.setMaxAge(30*60);
		response.addCookie(cookie);
	}
		
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>
<link rel="stylesheet" href="../css/boardList.css">
<img src="../image/jspImg.png" width="70" height="70" 
onclick="location.href='../main/index.jsp'" style="cursor:pointer;"></img>
</head>
<body>
<%if(list != null) {%>
<form name="boardListForm" method="post" action="boardView.jsp">
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
				<td><a href="javascript:void(0)" id="subjectA" onclick="isLogin('<%=memId%>','<%=boardDTO.getSeq()%>',<%=pg%>)"><%=boardDTO.getSubject()%></a></td>
				<td><%=boardDTO.getId()%></td>
				<td><%=boardDTO.getLogtime()%></td>
				<td><%=boardDTO.getHit()%></td>
			</tr>
			<%}%>
			
			<tr>
			<td colspan="5"><input type="button" value="글쓰기" onclick="location.href='boardWriteForm.jsp'"> </td>
			</tr>
			
			<tr >
			<%-- <td colspan="5">
			<%=boardPaging.getPagingHTML()%>
			</td> --%>
			</tr>
	</table>
	<div style="float:left; padding-top:500px; width: 50px; ">
	<img src="../image/jspImg.png" width="70" height="70" 
	onclick="location.href='../main/index.jsp'" style="cursor:pointer;"></img>
	</div>
	<div style="float:left; padding-top:500px; width: 1320px;text-align:center; ">
	<%=boardPaging.getPagingHTML()%>
	</div>
	
</form>
<%} %>
</body>
<script src="../js/board.js" type="text/javascript"> </script>
</html>