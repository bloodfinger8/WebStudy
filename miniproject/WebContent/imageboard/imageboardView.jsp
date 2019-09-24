<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table border="1" frame="hsides" rules="none" cellspacing="0" cellpadding="10">
			<tr>
				<td rowspan="4">
				<a href=# onclick="bigImage()"><img src="../image/zoom.png" align="top"></a>
				<img id="phone" value="${imageboardDTO.image1}" src="http://localhost:8080/miniproject/storage/${imageboardDTO.image1}" width="150" height="150">
				</td>
				<td>상품명</td>
				<td><input type="text" value="${imageboardDTO.imageName}"></td>
			</tr>
			
			<tr>
				<td>단가</td>
				<%-- <fmt:formatNumber value="${list.imagePrice}" pattern="#,###,###"/> --%>
				<td><input type="text" value="${imageboardDTO.imagePrice}" ></td>
			</tr>
			<tr>
				<td>개수</td>
				<td><input type="text" value="${imageboardDTO.imageQty}"></td>
			</tr>
			<tr>
				<td>합계</td>
				<td><input type="text" value="${imageboardDTO.imagePrice*imageboardDTO.imageQty}원"></td>
			</tr>
			<tr>
				<td colspan="3"><textarea name="imageContent" id="imageContent" rows="13" cols="60">${imageboardDTO.imageContent}</textarea></td> 
			</tr>
			<tr>
				<td colspan="3"><input type="button" value="목록" onclick="location.href='/miniproject/imageboard/imageboardList.do?pg=${pg}'"></td> 
			</tr>
</table>

<script type="text/javascript">
function bigImage(){
	phone = document.getElementById("phone").src;
	//window.open("zoomImg.jsp?phone="+phone, "_blank","width=500 height=500 left=350,top=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes" )

	var newWindow = window.open("","","width=500 height=500");
	var img = newWindow.document.createElement("img");
	img.setAttribute('src' ,phone );
	img.setAttribute("width","500");
	img.setAttribute("height","500");
	newWindow.document.body.appendChild(img);
	

}
</script>
