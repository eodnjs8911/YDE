<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글보기</title>
</head>
<body>
	<%@ include file="menu_CS1.jsp"%>
	<hr>
	No : ${gallery.galleryNo}
	<br />
	<hr>
	<div class="col-lg-4 col-md-12">
		<img
			src="${pageContext.request.contextPath}/resources/images/${gallery.galleryImage}"
			alt="IMAGE_${gallery.galleryImage}">
			${gallery.galleryContent}
	</div>
</body>
</html>