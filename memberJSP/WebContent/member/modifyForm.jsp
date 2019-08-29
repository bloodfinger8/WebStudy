<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");

MemberDTO memberDTO = new MemberDTO();

MemberDAO memberDAO = MemberDAO.getInstance();
memberDTO = memberDAO.getMember(id);

String gender = memberDTO.getGender();
String email2 = memberDTO.getEmail2();
String tel1 = memberDTO.getTel1();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
<form name="modifyForm" method="post" action="modify.jsp">
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th width="80">이름</th>
				<td width="320"><input type="text" name="name" value="<%=memberDTO.getName()%>"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text"  name="id" value="<%=memberDTO.getId()%>" readonly></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<th>재확인</th>
				<td><input type="password" name="repwd"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" value="0" >남
					<input type="radio" name="gender" value="1"checked>여
					<input type="hidden" name="checkgender" value="<%=gender%>">
					</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email1" size="12" value="<%=memberDTO.getEmail1()%>"> @ 
				<input type="text" list="browsers"  id="eail22" placeholder="직접입력" name="email2" > 
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
				<td><input type="text" name="zipcode" id="daum_zipcode"  size="10" value="<%=memberDTO.getZipcode()%>" readonly> 
				<input type="button" value="우편번호검색" onclick="checkPost()"></td>
			</tr>

			<tr>
				<td><input type="text" name="addr1" id="daum_addr1" placeholder="주소" size="40" value="<%=memberDTO.getAddr1()%>"readonly></td>
			</tr>

			<tr>
				<td><input type="text" name="addr2" id="daum_addr2" placeholder="상세주소" size="40" value="<%=memberDTO.getAddr2()%>"></td>
			</tr>
 
			<tr>
				<th colspan="2" align="center">
				<input type="button" value="회원수정" onclick="checkModify()"> 
				<input type="reset" value="다시작성">
				</th>
			</tr>
		</table>
	</form>
</body>

<script src="http://localhost:8080/memberJSP/js/member.js" type="text/javascript"></script>
<script type="text/javascript">
window.onload=function(){
	//라디오버튼은 배열타입으로 출력이 된다
	document.modifyForm.gender['<%=memberDTO.getGender()%>'].checked = true;
	document.modifyForm.email2.value = '<%=memberDTO.getEmail2()%>';
	//document.getElementById("email22").value = '<%=memberDTO.getEmail2()%>';
	document.modifyForm.tel1.value = '<%=memberDTO.getTel1()%>';
}</script>

</html>