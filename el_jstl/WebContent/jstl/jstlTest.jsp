<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>**변수 설정 **</h3>
<c:set var="name">홍길동</c:set>
<c:set var="age" value="20"/>

나의 이름은 <c:out value="${name }"/> 입니다<br>
나의 나이는 ${age } 입니다<br>
내가 좋아하는 색갈은 ${color } 입니다.<br> <!-- 그냥 안뜬다 -->



<h3>**변수 삭제**</h3>
<c:remove var="name"/> <!-- 이름변수 삭제 -->
나의 이름은 <c:out value="${name }"/> 입니다.<br>
나의 나이는 ${age }살 입니다.<br>

<h3>** foreach **</h3>
<c:forEach var="i" begin="1" end="10" step="1">
	${i }
</c:forEach>
<br>
<c:forEach var="i" begin="1" end="10" step="1">
	${10-i+1 }
</c:forEach>
<br>
<c:forEach var="i" begin="1" end="10" step="1">
	<c:set var="sum" value="${i+sum }"></c:set>
</c:forEach>
<c:out value="${sum }"></c:out>

<h3>**문자열 분리</h3>
<c:forTokens var="car" items="소나무,아우디,링컨,화박" delims=",">
	${car }
</c:forTokens>

<h3>**jstlExam.jsp에서 넘어온 데이터 출력**</h3>
결과 : ${requestScope.list }
<h3>**2번째 인덱스**</h3>
<!--pageScope → requestScope → sessionScope → applicationScope 순으로 호출 찾는다  -->
결과 : ${list[2]} 


<h3>**list2 **</h3>
<c:forEach var="personDTO" items="${requestScope.list2}">
	이름 = ${personDTO.getName() } &nbsp;&emsp; 나이 = ${personDTO.getAge() } <br>
	이름 = ${personDTO.name } &nbsp;&emsp; 나이 = ${personDTO.age } <br>
</c:forEach>




</body>
</html>



