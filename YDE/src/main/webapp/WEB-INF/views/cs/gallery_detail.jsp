<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글보기</title>
<style>
#list {
	border: none;
	padding: 14px 50px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	/* 	margin: 0.5px 2px; */
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

#list {
	background-color: #1BB1EC;
	color: white;
	/* border: 2px solid #1BB1EC; */
}

#list:hover {
	background-color: white;
	color: #555;
	
}
</style>
</head>
<body>
	<%@ include file="menu_CS1.jsp"%>
	<hr>
	No.${gallery.galleryNo} &nbsp; &nbsp;  ${gallery.galleryTitle} 
	<br />
	<hr>
	<div class="col-lg-12 col-md-12">
		<img
			src="${pageContext.request.contextPath}/resources/images/${gallery.galleryImage}"
			alt="IMAGE_${gallery.galleryImage}" style="width: 100%;height: 100%">
			${gallery.galleryContent}
	<hr>
	<button id="list" onclick="location.href='${pageContext.request.contextPath}/gallery/selectList.do'">목록으로</button>
	</div>
</body>
</html>