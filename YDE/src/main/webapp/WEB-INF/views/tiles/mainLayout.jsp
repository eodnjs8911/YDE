<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/jquery/jquery-ui.css">
<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jquery/jquery-3.2.1.min.js"></script>
<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jquery/jquery-ui.js"></script>
<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jquery/jquery.cookie.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script
	src='${pageContext.request.contextPath}/resources/fullcalendar/moment-with-locales.js'></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.css" />

</head>
<body>
	<header class="container-fluid col-md-8 col-md-offset-2">
		<tiles:insertAttribute name="header" />
	</header>

	<div class="container-fluid ">
		<div class="row content">
			<div class="col-lg-8 col-md-8 col-md-offset-2">
				<tiles:insertAttribute name="content" />
			</div>
			<div class="col-lg-2 col-lg-offset-0 col-md-8 col-md-offset-2 col-sm-12 sidenav text-center">
				<tiles:insertAttribute name="side" />
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center col-md-8 col-md-offset-2">
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>

