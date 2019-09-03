<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardDAO" class="board.dao.BoardDAO"/>    
<%
request.setCharacterEncoding("UTF-8");
int pg= Integer.parseInt(request.getParameter("pg"));
int seq = Integer.parseInt(request.getParameter("seq"));
String subject = request.getParameter("subject");
String content = request.getParameter("content");
/* BoardDTO boardDTO = new BoardDTO();
boardDTO.setSubject(request.getParameter("subject"));
boardDTO.setContent(request.getParameter("content"));
boardDTO.setSeq(Integer.parseInt(request.getParameter("seq"))); */

Map<String,String> map = new HashMap<String,String>();
map.put("seq",seq+"");
map.put("subject",subject);
map.put("content",content);

int su = boardDAO.boardModify(map); 

/* 
collection coll = new ArrayList(); 순서, 중복
Set set = new HashSet(); -순서, 중복 X 
Map map = new HashMap();
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
</body>
<script type="text/javascript">
window.onload=function(){
	alert("글 수정 완료");
	location.href="boardList.jsp?pg=<%=pg%>";
}
</script>
</html>