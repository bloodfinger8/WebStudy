<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login JSP</title>
<link rel="stylesheet" href="../css/login.css">
</head>
<body>

	<form name="loginForm" class="loginForm" method="post" action="login.jsp">
		<h1>login</h1>
		<input type="text" name="id" placeholder="ID"> 
		<input type="password" name="pwd" placeholder="password"> 
		<input type="button" value="Login" onclick="checkLogin()"> 
		<input type="button" value="Join " onclick="location.href='writeForm.jsp'">
	</form>

		<!-- <table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<th colspan="2" align="center">
				<input type="button"value="로그인" onclick="checkLogin()"> 
				<input type="button" value="회원가입" onclick="location.href='writeForm.jsp'">
				</th>
			</tr>
		</table> -->
	</form>
</body>
<script src="../js/member.js" type="text/javascript"> </script>
</html>