<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="boardWriteForm" method="post" action="boardWrite.jsp">
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" size="50"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="13" cols="50"></textarea></td>
			</tr>
			<tr>
				<th colspan="2" align="center">
				<input type="button"value="글쓰기" onclick="checkBoardWrite()"> 
				<input type="reset" value="다시작성">
				</th>
			</tr>
		</table>
</form>
</body>
<script src="../js/board.js" type="text/javascript"> </script>
</html>