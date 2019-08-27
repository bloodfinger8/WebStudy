<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");


MemberDTO memberDTO = new MemberDTO();

MemberDAO memberDAO = MemberDAO.getInstance();
memberDTO = memberDAO.callVal(id, pwd);
String email2 = memberDTO.getEmail2();

%>

<form name="writeForm" method="post" action="write.jsp">
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th width="80">이름</th>
				<td width="320"><input type="text" name="name" value="<%=memberDTO.getName()%>"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text"  name="id" value="<%=memberDTO.getId()%>"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" value="0" >남
					<input type="radio" name="gender" value="1"checked>여</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email1" size="12" value="<%=memberDTO.getEmail1()%>"> @ 
				<input type="text" list="browsers" placeholder="직접입력" name="email2"> 
					<datalist id="browsers">
						<option value="gmail.com">
						<option value="naver.com">
						<option value="hanmail.com">
					</datalist></td>
			</tr>

			<tr>
				<th>핸드폰</th>
				<td><select name="tel1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="018">018</option>
				</select> -<input type="text" name="tel2" size="4" value="<%=memberDTO.getTel2()%>"> -<input
					type="text" name="tel3" size="4" value="<%=memberDTO.getTel3()%>"></td>
			</tr>

			<tr>
				<th rowspan="3">주소</th>
				<td><input type="text" name="zipcode" id="daum_zipcode"  size="10" readonly> 
				<input type="button" value="우편번호검색" onclick="checkPost()"></td>
			</tr>

			<tr>
				<td><input type="text" name="addr1" id="daum_addr1" placeholder="주소" size="40" readonly></td>
			</tr>

			<tr>
				<td><input type="text" name="addr2" id="daum_addr2" placeholder="상세주소" size="40"></td>
			</tr>
 
			<tr>
				<th colspan="2" align="center">
				<input type="button"value="회원수정" onclick=""> 
				</th>
			</tr>
		</table>
	</form>
</body>

<script charset="UTF-8" type="text/javascript">
function getGender(){
	var kk = document.getElementsByName("gender");
	alert(kk);
}
</script>

</html>