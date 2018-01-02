<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<style type="text/css">

/* list */ 
ul li a:hover {
	background-color: #1BB1EC;
	color: white;
	text-decoration: none;
}

ul {
	list-style-type: none;
}

ul li a {
	text-decoration: none;
	color: gray;
	text-align: center;
	display: block;
	padding: 15px 30px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
}
/* tablet */
@media ( min-width : 768px) {
	ul li {
		display: inline-block;
	}
	ul {
		text-align: center;
	}
	ul li a {
		padding: 15px 35px;
	}
}
/* desktop */
@media ( min-width : 1349px) {
	ul li {
		display: inline-block;
	}
	ul {
		text-align: center;
	}
	ul li a {
		padding: 15px 60px;
	}
}

</style>
</head>
<body>
	<ul class="menunav">
		<li class="menunav"><a class="menunav"
			href='${pageContext.request.contextPath}/go.do?go=cs/notice'>공지사항</a></li>
		<li class="menunav"><a class="menunav"
			href='${pageContext.request.contextPath}/go.do?go=cs/faq'> &nbsp; FAQ &nbsp; </a></li>
		<li class="menunav"><a class="menunav"
			href='${pageContext.request.contextPath}/go.do?go=cs/epilogue'>이용후기</a></li>
		<li class="menunav"><a class="menunav"
			href='${pageContext.request.contextPath}/gallery/selectList.do'>현장갤러리</a></li>
		<li class="menunav"><a class="menunav"
			href='${pageContext.request.contextPath}/cs/insert.do'>불편신고</a></li>
	</ul>
	<%-- <div style="width: 100%; text-align: center;">
		<button class="button button2" type="button"
			onclick="location.href='${pageContext.request.contextPath}/go.do?go=cs/notice'">공지사항</button>
		<button class="button button2" type="button"
			onclick="location.href='${pageContext.request.contextPath}/go.do?go=cs/faq'">FAQ</button>
		<button class="button button2" type="button"
			onclick="location.href='${pageContext.request.contextPath}/go.do?go=cs/epilogue'">이용후기</button>
		<button class="button button2" type="button"
			onclick="location.href='${pageContext.request.contextPath}/gallery/selectList.do'">현장갤러리</button>
		<button class="button button2" type="button"
			onclick="location.href='${pageContext.request.contextPath}/cs/insert.do'">불편신고</button>
	</div> --%>
</body>
</html>