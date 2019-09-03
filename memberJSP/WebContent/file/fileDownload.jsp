<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
String fileName = request.getParameter("fileName");
String realFolder = request.getServletContext().getRealPath("/storage");
System.out.println(realFolder + "/" +fileName); //window의 경우 "\\" mac "/"

//다운로드 받을 파일생성
File file = new File(realFolder, fileName);
fileName = URLEncoder.encode(fileName, "UTF-8").replace("+", " "); //한글 깨지는것을 방지하기위해 인코딩을 거친다

response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
response.setHeader("Content-length", file.length()+"");

//IOStream
/*
getOutputStream() has already been called for this response
jsp에서는 서블릿으로 변환될때 내부적으로 out객체가 자동으로 생성하기 때문에 따라
out객체를 만들면 충돌이 일어나서 저런 메세지가 뜨는 것이다.
그래서 먼저 out를 초기화하고 생성하면 된다.
*/
out.clear();
out = pageContext.pushBody();
		
BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());

int size = (int)file.length();
byte[] b = new byte[size];
bis.read(b,0,size);
bos.write(b);
bis.close();
bos.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>