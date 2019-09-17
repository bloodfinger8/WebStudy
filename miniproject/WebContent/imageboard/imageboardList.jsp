<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<form name="imageboardListForm" method="post" action="">
<table border="1" frame="hsides" rules="rows" cellspacing="0" cellpadding="10">
			<tr>
				<td>번호</td>
				<td>이미지</td>
				<td>상품명</td>
				<td>단가</td>
				<td>갯수</td>
				<td>합</td>
			</tr>
			<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.seq }</td>
				<td><img src="http://localhost:8080/miniproject/storage/${list.image1}" width="60" height="60"> </td>
				<td><a href="javascript:void(0)" id="imgeNameA" onclick="isLogin('${memId }','${list.seq }',${pg})">${list.imageName }</a></td>
				<td><fmt:formatNumber value="${list.imagePrice}" pattern="#,###,###"/></td>
				<td>${list.imageQty }개</td>
				<td><fmt:formatNumber value="${list.imagePrice * list.imageQty }" pattern="###,###,###"/>원</td>
			</tr>
			</c:forEach>
			<tr >
			<td colspan="6" align="center" id="paging">
			${boardPaging.pagingHTML}
			</td>  
			</tr>
	</table>
</form>

<script type="text/javascript">
function isLogin(memId,seq,pg){
	if(memId==""){
		alert("로그인 먼저 해주세요");
	}else{
		location.href="/miniproject/imageboard/imageboardView.do?seq="+seq+"&pg="+pg;
	}
}
</script>
