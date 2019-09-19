<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="../css/boardList.css">

<c:if test="${list != null }">
<table border="1"  width="700" frame="hsides" rules="rows" cellspacing="0" cellpadding="15">
			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<c:forEach items="${list }" var="list">
			<tr>
				<td>
				<c:if test="${list.lev == 0}">
				${list.seq }
				</c:if>
				</td>
				<td>
				<c:if test="${list.lev != 0}">
					<c:forEach var="i" begin="1" end="${list.lev}" step="1">
					&emsp;&emsp;
					</c:forEach>
					<img src="../image/dapgle.gif">
				</c:if>
				<a href="javascript:void(0)" id="subjectA" onclick="isLogin(${list.seq},${pg })">${list.subject }</a></td>
				<td>${list.id }</td>
				<td>${list.logtime }</td>
				<td>${list.hit }</td>
			</tr>
			</c:forEach>
			
			<tr>
			<td colspan="5" align="center" id="paging">
			${boardPaging.pagingHTML }
			</td> 
			</tr>
	</table>
	</c:if>

<form name="" method="post" action="/miniproject/board/boardSearch.do">	
	<div style=" padding-top:30px; width: 700px; text-align:center; ">
	<input type="hidden" name="pg" value="1">
	<select name="searchOption" id="searchOption">
	    <option value="all">제목+내용</option>
	    <option value="subject">제목</option>
	    <option value="id">글작성자</option>
	</select>
	<input type="text"  name="keyword" value="${keyword }" placeholder="검색어를 입력해주세요">
	<input type="submit" value="검색">
	</div>
</form>

<script type="text/javascript">
function isLogin(seq, pg){
	if("${memId}"=="")
		alert("먼저 로그인하세요");
	else
		location.href="/miniproject/board/boardView.do?seq="+seq+"&pg="+pg;		
}

window.onload=function(){
	if('${searchOption}'=='subject' || '${searchOption}'=='id'||'${searchOption}'=='all')
		document.getElementById('searchOption').value = '${searchOption}';
}

function boardSearch(pg){
	location.href="/miniproject/board/boardSearch.do?pg="+pg
			+"&searchOption=${searchOption}"
			+"&keyword=${keyword}";
}
</script>
