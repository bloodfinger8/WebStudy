<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${su eq '1'}">
	${su }건 회원등록 되었습니다.
	<br><br>
	<input type="button" value="로그인" onclick=location.href='/miniproject/main/index.do'>
</c:if>

<c:if test="${su ne '1'} ">
	회원등록에 실패했습니다.
</c:if>
