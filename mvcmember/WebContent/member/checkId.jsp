<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<c:if test="${exist }">
	<form name="" action="/mvcmember/member/checkId.do" method="get"> <!-- 재귀 -->
	${param.id }는 사용 불가능
	<br><br>
	아이디 <input type="text" name="id">
	<input type="submit" value="중복체크">
	
	</form>
</c:if>
<c:if test="${!exist }">
	${param.id}는 사용 가능
	<br><br>
	<input type="button" value="ID사용" onclick="checkIdClose('${param.id }')">
</c:if>
</body>


<script src="../js/member.js" type="text/javascript"> </script>
</html>