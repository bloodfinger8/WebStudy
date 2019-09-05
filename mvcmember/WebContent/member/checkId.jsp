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
<c:if test="">

</c:if>
<%if(exist){%>
	<form name="" action="checkId.jsp" method="get"> <!-- 재귀 -->
	<%=id%>는 사용 불가능
	<br><br>
	아이디 <input type="text" name="id">
	<input type="submit" value="중복체크">
	
	</form>
	
<%}else{%>
	
	<%=id%>는 사용 가능
	<br><br>
	<input type="button" value="ID사용" onclick="checkIdClose('<%=id%>')">
<%}%>
</body>


<script src="http://localhost:8080/memberJSP/js/member.js" type="text/javascript"> </script>
</html>