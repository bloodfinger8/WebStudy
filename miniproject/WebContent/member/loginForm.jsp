<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- <link rel="stylesheet" href="../css/login.css"> -->
	<form name="loginForm" class="loginForm" method="post" action="/miniproject/member/login.do">
		 <table cellspacing="0" cellpadding="5">
			<tr>
				<td><input type="text" name="id" placeholder="ID"></td>
			</tr>
			<tr>
				<td><input type="password" name="pwd" placeholder="PASSWORD"></td>
			</tr>
			<tr>
				<th colspan="2" align="center">
				<input type="button"value="로그인" onclick="checkLogin()">
				<input type="button" value="회원가입" onclick="location.href='/miniproject/member/writeForm.do'">
				</th>
			</tr>
		</table>
	</form>
<script src="../js/member.js" type="text/javascript"> </script>
