<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- <link rel="stylesheet" href="../css/boardList.css"> -->

<c:if test="${list != null }">
<form name="boardListForm" method="post" action="boardView.jsp">
<table border="1" frame="hsides" rules="rows" cellspacing="0" cellpadding="10">
			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<c:forEach items="${list }" var="list">
			<tr>
				<td>${list.seq }</td>
				<td><a href="javascript:void(0)" id="subjectA" onclick="isLogin('${list.id }','${list.seq }',${pg })">${list.subject }</a></td>
				<td>${list.id }</td>
				<td>${list.logtime }</td>
				<td>${list.hit }</td>
			</tr>
			</c:forEach>
			
			<!-- <tr>
			<td colspan="5"><input type="button" value="글쓰기" onclick="location.href='boardWriteForm.jsp'"> </td>
			</tr> -->
			
			<tr >
			<td colspan="5" align="center" id="paging">
			${boardPaging.pagingHTML }
			</td> 
			</tr>
	</table>
</form>
</c:if>
<script src="../js/board.js" type="text/javascript"> </script>
