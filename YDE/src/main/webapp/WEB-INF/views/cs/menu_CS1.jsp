<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
	<div style="width: 100%; text-align: center;">
		<button class="button button2" type="button"
			onclick="location.href='${pageContext.request.contextPath}/go.do?go=cs/notice'">공지사항</button>
		<button class="button button2" type="button"
			onclick="location.href='${pageContext.request.contextPath}/go.do?go=cs/faq'">FAQ</button>
		<button class="button button2" type="button"
			onclick="location.href='${pageContext.request.contextPath}/go.do?go=cs/epilogue'">이용후기</button>
		<button class="button button2" type="button"
			onclick="location.href='${pageContext.request.contextPath}/go.do?go=cs/gallery'">현장갤러리</button>
		<button class="button button2" type="button"
			onclick="location.href='${pageContext.request.contextPath}/cs/insert.do'">불편신고</button>
	</div>
</body>
</html>