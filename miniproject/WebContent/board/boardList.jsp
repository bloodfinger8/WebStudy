<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="../css/boardList.css">

<c:if test="${list != null }">
<form name="boardListForm" method="post" action="boardView.do">
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
	
	<div style=" padding-top:30px; width: 450px; text-align:center; ">
	<select name="selected">
	    <option value="all">제목+내용</option>
	    <option value="subject">제목</option>
	    <option value="writer">글작성자</option>
	</select>
	<input type="text" id="textContent" placeholder="검색어를 입력해주세요">
	<input type="button" value="검색" onclick="searchList()">
	</div>
</form>
</c:if>
<script src="../js/board.js" type="text/javascript"> </script>
