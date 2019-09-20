<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:requestEncoding value="UTF-8"/>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
${param.name}님의 생일은  ${fn:substring(param.birth,2,4)}년 ${fn:substring(param.birth,5,7)}월 ${fn:substring(param.birth,8,10)}일 입니다.
나이는 ${sysYear - fn:substring(param.birth,0,4)}살 입니다!.