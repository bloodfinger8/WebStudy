<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
pre {
	
	white-space: pre-line;
	word-break: break-all;
}
</style>

<form name="boardViewForm" method="post" action="">
<c:if test="${boardDTO != null }">
<table border="1" width="400" height="400" cellspacing="0" cellpadding="15">
			<tr>
				<td colspan="3"><h3>${boardDTO.subject }</h3></td>
			</tr>
			<tr>
				<td width="100">글번호 : ${boardDTO.seq}</td>
				<td width="100">작성자 : ${boardDTO.id}</td>
				<td width="100">조회수 : ${boardDTO.hit}</td>
			</tr>
			<tr>
				<td colspan="3" height="200" valign="top"><pre>${boardDTO.content }</pre></td>
			</tr>
			
			
			<tr>
				<td colspan="3" >
				<input type="button" value="목록" onclick="location.href='/miniproject/board/boardList.do?pg=${pg}'">
				<input type="button" value="답글" onclick="location.href='/miniproject/board/boardReplyForm.do?pg=${pg}&pseq=${boardDTO.seq}'">
				 				
				<c:if test="${sessionScope.memId == boardDTO.id }">
					<input type="button" value="글수정" onclick="location.href='boardModifyForm.do?pg=${pg}&seq=${boardDTO.seq}'">
					<input type="button" value="글삭제" onclick="location.href='boardDelete.do?seq=${boardDTO.seq}'" >
				</c:if>
				</td>
			</tr>
	</table>
</c:if>

</form>
