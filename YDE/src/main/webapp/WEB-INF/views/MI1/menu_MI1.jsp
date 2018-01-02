<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
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
		padding: 15px 30px;
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
		padding: 15px 50px;
	}
}

</style>
</head>
<body>
	<ul class="menunav">
		<li class="menunav"><a class="menunav"
			href='${pageContext.request.contextPath}/go.do?go=MI1/MI1_1'>이사체크리스트</a></li>
		<li class="menunav"><a class="menunav"
			href='${pageContext.request.contextPath}/go.do?go=MI1/MI1_2'>계약시유의사항</a></li>
		<li class="menunav"><a class="menunav"
			href='${pageContext.request.contextPath}/go.do?go=MI1/MI1_3'>이사하기좋은날</a></li>
		<li class="menunav"><a class="menunav"
			href='${pageContext.request.contextPath}/go.do?go=MI1/MI1_4'>이사가격산정방식</a></li>
	</ul>
</body>
</html>