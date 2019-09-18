<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form name="boardReplyForm" method="post" action="/miniproject/board/boardReply.do">
		<h3>답글쓰기</h3>
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" id="subject" size="50"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content" rows="13" cols="50"></textarea></td>
			</tr>
			<tr>
				<th colspan="2" align="center">
				<input type="button" value="답글쓰기" onclick="checkBoard()"> 
				<input type="reset" value="다시작성">
				</th>
			</tr>
		</table>
		<input type="hidden" name="pseq" value="${pseq}">
		<input type="hidden" name="pg" value="${pg}">
</form>
<script src="../js/board.js" type="text/javascript"> </script>
