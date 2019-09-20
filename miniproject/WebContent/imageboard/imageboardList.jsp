<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<form name="imageboardListForm" method="get" action="/miniproject/imageboard/imageboardDelete.do">
<table border="1" frame="hsides" rules="rows" cellspacing="0" cellpadding="10">
			<tr>
				<td><input type="checkbox" id="all" onclick="checkAll()">번호</td>
				<td>이미지</td>
				<td>상품명</td>
				<td>단가</td>
				<td>갯수</td>
				<td>합</td>
			</tr>
			<c:forEach items="${list}" var="list">
			<tr>
				<td><input type="checkbox" name="check" value="${list.seq }">${list.seq }</td>
				<td><img src="http://localhost:8080/miniproject/storage/${list.image1}" width="60" height="60"> </td>
				<td><a href="javascript:void(0)" id="imgeNameA" onclick="isLogin('${memId }','${list.seq }',${pg})">${list.imageName }</a></td>
				<td><fmt:formatNumber value="${list.imagePrice}" pattern="#,###,###"/></td>
				<td>${list.imageQty }개</td>
				<td><fmt:formatNumber value="${list.imagePrice * list.imageQty }" pattern="###,###,###"/>원</td>
			</tr>
			</c:forEach>
			<tr>
			<td colspan="6">
			<input type="button" value="선택삭제" onclick="selectedDelete()">
			</td>
			</tr>
			<tr >
			<td colspan="6" align="center" id="paging">
			${imageboardPaging.pagingHTML}
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
function checkAll(){
	var check = document.getElementsByName("check");
	
	if(document.getElementById("all").checked){
		for(i=0; i<check.length; i++) {
			check[i].checked = true;
		}
	}else{
		for(i=0; i<check.length; i++) {
			check[i].checked = false;
		}
	}
}

 function selectedDelete(){
	var ck = 0;
	var check = document.getElementsByName("check");
	for(var i=0; i < check.length; i++) {
		if(check[i].checked){
			ck = ck +1;
		}
	}
	if(ck==0){
		alert('항목을 선택하세요')
	}else{
		var jbResult = confirm( '정말로 삭제하시겠습니까?' );
		if(jbResult){
			for(var i=0; i < check.length; i++) {
				if(check[i].checked){
					document.imageboardListForm.submit();
				}
			}
		}
	} 
}


</script>
