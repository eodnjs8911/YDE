<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<body>
	<div style="width: 100%; text-align: center; border-top: 1px solid #0BC3F7; 
	border-bottom: 1px solid #0BC3F7; display: inline;">
	<!-- <ul>
	<li><a>공지사항</a></li>
	<li><a>자주묻는질문</a></li>
	<li><a>이용후기</a></li>
	<li><a>현장갤러리</a></li>
	<li><a>불편신고</a></li>
	</ul> -->
 		<button class="button button2" type="button"
			onclick="location.href='#'">공지사항</button>
		<button class="button button2" type="button"
			onclick="location.href='#'">자주묻는질문</button>
		<button class="button button2" type="button"
			onclick="location.href='#'">이용후기</button>
		<button class="button button2" type="button"
			onclick="location.href='#'">현장갤러리</button>
		<button class="button button2" type="button"
			onclick="location.href='#'">불편신고</button> 
	</div>
</body>
</html>