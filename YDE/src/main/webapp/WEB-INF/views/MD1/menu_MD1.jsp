<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
html {
	padding: 0px;
}
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
		padding: 15px 40px;
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
		padding: 15px 70px;
	}
}

</style>
</head>
<body>
	<ul class="menunav">
		<li class="menunav"><a class="menunav"
			href='${pageContext.request.contextPath}/go.do?go=MD1/MD1_1'>일반이사</a></li>
		<li class="menunav"><a class="menunav"
			href='${pageContext.request.contextPath}/go.do?go=MD1/MD1_2'>원룸이사</a></li>
		<li class="menunav"><a class="menunav"
			href='${pageContext.request.contextPath}/go.do?go=MD1/MD1_4'>기업이사</a></li>
		<li class="menunav"><a class="menunav"
			href='${pageContext.request.contextPath}/go.do?go=MD1/MD1_5'>포장이사</a></li>
	</ul>
<%-- 	<div style="width: 100%; text-align: center;">
		<button class="button button2" type="button"
			onclick="location.href='${pageContext.request.contextPath}/go.do?go=MD1/MD1_1'">일반이사</button>
		<button class="button button2" type="button"
			onclick="location.href='${pageContext.request.contextPath}/go.do?go=MD1/MD1_2'">원룸이사</button>
		<button class="button button2" type="button"
			onclick="location.href='${pageContext.request.contextPath}/go.do?go=MD1/MD1_4'">기업이사</button>
		<button class="button button2" type="button"
			onclick="location.href='${pageContext.request.contextPath}/go.do?go=MD1/MD1_5'">포장이사</button>
		<button class="button button2" type="button"
			onclick="location.href='${pageContext.request.contextPath}/go.do?go=MD1/MD1_3'">보관이사</button>
	</div> --%>
</body>
</html>