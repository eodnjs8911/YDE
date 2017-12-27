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
	No.${gallery.galleryNo} &nbsp; &nbsp;  ${gallery.galleryTitle} 
	<br />
	<hr>
	<div class="col-lg-4 col-md-12">
	<%-- 	<img
			src="${pageContext.request.contextPath}/resources/images/${gallery.galleryImage}"
			alt="IMAGE_${gallery.galleryImage}"> --%>
			${gallery.galleryContent}
	<hr>
	<a style="cursor: pointer;" 
	onclick="location.href='${pageContext.request.contextPath}/gallery/selectList.do'">목록으로</a>
	</div>
</body>
</html>