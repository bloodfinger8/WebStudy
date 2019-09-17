<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="imageboardWriteForm" method="post" enctype="multipart/form-data" action="/miniproject/imageboard/imageboardWrite.do">
	<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th>상품코드</th>
				<td><input type="text" name="imageId" id="imageId" size="50"></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="imageName" id="imageName" size="50"></td>
			</tr>
			<tr>
				<th>단가</th>
				<td><input type="text" name="imagePrice" id="imagePrice" size="50"></td>
			</tr>
			<tr>
				<th>갯수</th>
				<td><input type="text" name="imageQty" id="imageQty" size="50"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="imageContent" id="imageContent" rows="13" cols="50"></textarea></td>
			</tr>
			<tr>
				<th colspan="2">
				<input type="file" name="image1">
				</th>
			</tr>
			<tr>
				<th colspan="2" align="center">
				<input type="button" value="이미지등록" onclick="imageCheck()"> 
				<input type="reset" value="다시작성">
				</th>
			</tr>
	</table>
</form>
</body>

<script type="text/javascript">
function imageCheck(){
	if (document.imageboardWriteForm.imageId.value == "") {
		alert("상품코드 입력하시오");
	}else if (document.imageboardWriteForm.imageName.value == "") {
		alert("상품명 입력하시오");
	}else if (document.imageboardWriteForm.imagePrice.value == "") {
		alert("단가를 입력하시오");
	}else if (document.imageboardWriteForm.imageQty.value == "") {
		alert("갯수를 입력하시오");
	}else if(document.imageboardWriteForm.imageContent.value == ""){
		alert("내용을 입력하세요");
	}else if(document.imageboardWriteForm.image1.value == ""){
		alert("파일을 선택하세요");
	}else{
		document.imageboardWriteForm.submit();
	}
}
</script>
</html>