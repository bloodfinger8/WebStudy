<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       

<b>${sessionScope.memName} 님</b>
<br>
<input type="button" value="회원정보수정" onclick="location.href='/miniproject/member/modifyForm.do'" >
<input type="button" value="로그아웃" onclick="location.href='/miniproject/member/logout.do'">
