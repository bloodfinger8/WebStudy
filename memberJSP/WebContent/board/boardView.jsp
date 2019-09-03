<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardDAO" class="board.dao.BoardDAO"/>
  
<%
request.setCharacterEncoding("UTF-8");
int seq = Integer.parseInt(request.getParameter("seq"));
int pg = Integer.parseInt(request.getParameter("pg"));

String boardId=null;

BoardDTO boardDTO = new BoardDTO();

//session ID 가져오기
String id = (String)session.getAttribute("memId");

Cookie[] ar = request.getCookies();
if(ar!=null){
	for(int i =0; i<ar.length; i++){
		if(ar[i].getName().equals("memHit")){
			boardDAO.boardHit(seq);
			ar[i].setMaxAge(0);
			response.addCookie(ar[i]);
		}
	}
}
boardDTO = boardDAO.seletedListInfo(seq);
//조회수 -쿠키시간 30분 사용
/* 
String memId = (String)session.getAttribute("memId");
boolean sw = false;

Cookie[] ar = request.getCookies(); //쿠키 찾기
if(ar!=null){
	for(int i =0; i<ar.length; i++){
		if(ar[i].getName().equals(memId+seq)){
			sw=true;
		} 
	}
	if(!sw){
		boardDAO.boardHit(seq);
		
		Cookie cookie = new Cookie(memId+seq , seq+"");
		System.out.println("쿠키명 = " + (memId+seq) +", 값=" +seq+"");
		cookie.setMaxAge(60*30);
		response.addCookie(cookie); //클라이언트에게 보내기
	}
}
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
pre {
	
	white-space: pre-line;
	word-break: break-all;
}
</style>
</head>
<body>
<form name="boardViewForm" method="post" action="">
<%if(boardDTO != null){ %>
<table border="1" width="400" height="400" cellspacing="0" cellpadding="10">
			<tr>
				<td colspan="3"><h3><%=boardDTO.getSubject()%></h3></td>
				
			</tr>
			<tr>
				<td width="100">글번호 : <%=boardDTO.getSeq()%></td>
				<td width="100">작성자 : <%=boardDTO.getId()%></td>
				<td width="100">조회수 : <%=boardDTO.getHit()%></td>
			</tr>
			<tr>
				<td colspan="3" height="200" valign="top"><pre><%=boardDTO.getContent()%></pre></td>
			</tr>
			
			
			<tr>
				<td colspan="3" >
				<input type="button" value="목록" onclick="location.href='boardList.jsp?pg=<%=pg%>'">
				<%if(boardDTO.getId().equals(id)){ %>
				<input type="button" value="글수정" onclick="location.href='boardModifyForm.jsp?pg=<%=pg%>&seq=<%=seq%>'">
				<input type="button" value="글삭제" onclick="" > 
				<%}%>
				</td>
			</tr>
	</table>
	<%
	//cookie
		
		 /* Cookie[] ar = request.getCookies(); //쿠키 찾기
		 if(ar!=null){
			for(int i =0; i<ar.length; i++){
				String cookieName = ar[i].getName();
				String cookieValue = ar[i].getValue();
				 
				if(ar[i].getName().equals("boardId")){
					boardId = ar[i].getValue();
				} 
			}
			System.out.println(boardId+"/");
			if(boardId != null){
				boardDAO.boardHit(seq);//디비
			} 
			
			Cookie[] cookies = request.getCookies();//쿠키 죽이기
			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					if (cookies[i].getName().equals("boardId")) {
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
					}
				}
			}
		}  */
		
		
	%>
	
<%} %>

</form>
</body>
</html>