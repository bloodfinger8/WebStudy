<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//String name = "홍길동";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>**include directive **</h3>
<%@ include file="today.jsp" %>


<h3>**include jsp tag**</h3>
<jsp:include page="image.jsp"/>

<!-- 둘중에서 jsp tag를 많이 사용한다 왜냐하면 컴파일된 내용을 합치기때문에  -->
<br><br>
main.jsp name = <%=name%>

<h3>**3초 뒤에 페이지 이동** </h3>
<% response.setHeader("Refresh", "3;url=input.jsp");%>

</body>
</html>