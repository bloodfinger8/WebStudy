<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
//String name =(String)request.getSession().getAttribute("name");
//String name = request.getParameter("name");
String name=null;
String id =null;

//Cookie , 특정쿠키를 얻지 못하고 모든 쿠키를 가져온다.
/* Cookie[] ar = request.getCookies();

 if(ar!=null){
	for(int i =0; i<ar.length; i++){
		String cookieName = ar[i].getName();
		String cookieValue = ar[i].getValue();
		System.out.println(cookieName +"," + cookieValue);  
		 if(ar[i].getName().equals("memName")){
			name=ar[i].getValue();
		}
		if(ar[i].getName().equals("memId")){
			id=ar[i].getValue();
		} 
	}
} 
 */
//세션
name = (String)session.getAttribute("memName");
id = (String)session.getAttribute("memId");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<img src="../image/jspImg.png" width="70" height="70" 
onclick="location.href='../main/index.jsp'" style="cursor:pointer;"></img>
<br><br>

<%=name%>님 로그인 하였습니다!!
<input type="hidden" name="id" value="">
<br><br>
<input type="submit" value="회원정보수정">
<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
</body>
</html>