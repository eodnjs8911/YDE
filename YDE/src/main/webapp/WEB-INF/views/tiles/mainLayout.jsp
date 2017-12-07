<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/ecmascript" src="/mvc/resources/jquery-3.2.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
	<header class="container-fluid col-md-8 col-md-offset-2"
		style="background-color: red;">
		<tiles:insertAttribute name="header" />
	</header>

	<div class="container-fluid ">
		<div class="row content">
			<div class="col-md-8 col-md-offset-2"
				style="background-color: yellow;">
				<tiles:insertAttribute name="content" />
			</div>
			<div class="col-md-2 sidenav text-center"
				style="background-color: blue;">
				<tiles:insertAttribute name="side" />
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center col-md-8 col-md-offset-2"
		style="background-color: green;">
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>

