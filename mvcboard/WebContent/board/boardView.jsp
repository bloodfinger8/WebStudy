<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
pre {
	
	white-space: pre-line;
	word-break: break-all;
}
</style>
</head>
<body>
<form name="boardViewForm" method="post" action="">
<c:if test="${boardDTO != null }">
<table border="1" width="400" height="400" cellspacing="0" cellpadding="10">
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
				<input type="button" value="목록" onclick="location.href='boardList.jsp?pg=${pg}'">
				
				<input type="button" value="글수정" onclick="location.href='boardModifyForm.do?pg=${pg}&seq=${seq}'">
				<input type="button" value="글삭제" onclick="" > 
				
				</td>
			</tr>
	</table>
</c:if>

</form>
</body>
</html>