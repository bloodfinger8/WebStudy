<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");

MemberDTO memberDTO = new MemberDTO();
memberDTO.setName(request.getParameter("name"));
memberDTO.setId(request.getParameter("id"));
memberDTO.setPwd(request.getParameter("pwd"));
memberDTO.setGender(request.getParameter("gender"));
memberDTO.setEmail1(request.getParameter("email1"));
memberDTO.setEmail2(request.getParameter("email2"));
memberDTO.setTel1(request.getParameter("tel1"));
memberDTO.setTel2(request.getParameter("tel2"));
memberDTO.setTel3(request.getParameter("tel3"));
memberDTO.setZipcode(request.getParameter("zipcode"));
memberDTO.setAddr1(request.getParameter("addr1"));
memberDTO.setAddr2(request.getParameter("addr2"));

MemberDAO memberDAO = MemberDAO.getInstance();
int su = memberDAO.modify(memberDTO);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(su==0){%>
	회원정보 수정 실패
  <%}else{%>
	회원정보 수정이 되었습니다.
<%}%>

</body>
</html>