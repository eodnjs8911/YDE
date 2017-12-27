<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>YDE 관리페이지</title>

<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/sbadmin2/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="${pageContext.request.contextPath}/resources/sbadmin2/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/sbadmin2/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath}/resources/sbadmin2/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/jquery/jquery-ui.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/resources/sbadmin2/vendor/jquery/jquery.min.js"></script>

<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jquery/jquery-ui.js"></script>

<!-- Bootstrap Core JavaScript -->
<script
	src="${pageContext.request.contextPath}/resources/sbadmin2/vendor/bootstrap/js/bootstrap.min.js"></script>

<script
	src='${pageContext.request.contextPath}/resources/fullcalendar/moment-with-locales.js'></script>
	
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.js"></script>

 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.css" />
<script type="text/javascript">
$(function(){
	$("#clicked").click(function(){
		$.ajax({
		url : "${pageContext.request.contextPath}/express/selectCount.do",
		method : "post",
		success : function(data) {
			$("#expressCount").text(data+"건");
		}
	});
	})
	
	$("#todayCalc").click(function(){
		$.ajax({
		url : "${pageContext.request.contextPath}/express/selectListToday.do?state=A01",
		method : "post",
		success : function(data) {
			console.log(data.length)
			$("#expressTodayCalcCount").text("금일 이사 계산 "+data.length+"건");
		}
		});
	})
		
	$("#todayConsult").click(function(){
		$("#todayConsultList").html("");
		$.ajax({
		url : "${pageContext.request.contextPath}/express/selectListToday.do?state=A02",
		method : "post",
		success : function(data) {
			var max = data.length > 5 ? 5: data.length
			for(i=0;i<max;i++){
			
				var linkHref = "${pageContext.request.contextPath}/express/expressAdminPage.do?detailId="+data[i].expressNo;
				
				var consultString = "이사 날짜 : " + data[i].expressDate.substring( 0, 16) + "<br/>";
				consultString += "출발 : " +  data[i].expressDepartureAddr1 + " / " +  data[i].expressDepartureSize + "평  / "
						+  data[i].expressDepartureFloor + "층<br/>";
				consultString += "도착 : " +  data[i].expressArriveAddr1 + " / " +  data[i].expressArriveSize + "평  / "
						+  data[i].expressArriveFloor + "층<br/>";
				
				$("#todayConsultList").append('<li><a href="'+linkHref+'"><div><strong>'+data[i].expressCustomer+'</strong><span class="pull-right text-muted"><em>'+data[i].expressPhone+'</em></span></div><div>'+consultString+'</div></a></li><li class="divider"></li>')
			}
	
			$("#todayConsultList").append('<li><a class="text-center"href="${pageContext.request.contextPath}/express/expressAdminPage.do"><strong>금일 상담신청 '+data.length+' 건</strong> <iclass="fa fa-angle-right"></i></a></li>');
		}
		});
	})
	
	$("#todayVisit").click(function(){
		$("#todayVisitList").html("");
		$.ajax({
		url : "${pageContext.request.contextPath}/express/selectListToday.do?state=A03",
		method : "post",
		success : function(data) {

		
			var max = data.length > 5 ? 5: data.length
			for(i=0;i<max;i++){
				var linkHref = "${pageContext.request.contextPath}/express/expressAdminPage.do?detailId="+data[i].expressNo;
				
				var consultString = "방문  시간: " + data[i].expressVisitTime.substring( 0, 16) + "<br/>";
				consultString += "주소 : " +  data[i].expressDepartureAddr1 + " " +  data[i].expressDepartureAddr2 + " "
						+  data[i].expressDepartureFloor + "층<br/>";
				
				$("#todayVisitList").append('<li><a href="'+linkHref+'"><div><strong>'+data[i].expressCustomer+'</strong><span class="pull-right text-muted"><em>'+data[i].expressPhone+'</em></span></div><div>'+consultString+'</div></a></li><li class="divider"></li>')
			}
	
			$("#todayVisitList").append('<li><a class="text-center"href="${pageContext.request.contextPath}/express/expressAdminPage.do"><strong>금일 방문 '+data.length+' 건</strong> <iclass="fa fa-angle-right"></i></a></li>');
		}
		});
	})
	
	$("#todayExpress").click(function(){
		$("#todayExpressList").html("");
		$.ajax({
		url : "${pageContext.request.contextPath}/express/selectListToday.do?state=A05",
		method : "post",
		success : function(data) {

			var max = data.length > 5 ? 5: data.length
			for(i=0;i<max;i++){
			
				var linkHref = "${pageContext.request.contextPath}/express/expressAdminPage.do?detailId="+data[i].expressNo;
				
				var consultString = "이사 날짜 : " + data[i].expressDate.substring( 0, 16) + "<br/>";
				consultString += "출발 : " +  data[i].expressDepartureAddr1 + " / " +  data[i].expressDepartureSize + "평  / "
						+  data[i].expressDepartureFloor + "층<br/>";
				consultString += "도착 : " +  data[i].expressArriveAddr1 + " / " +  data[i].expressArriveSize + "평  / "
						+  data[i].expressArriveFloor + "층<br/>";
				
				$("#todayExpressList").append('<li><a href="'+linkHref+'"><div><strong>'+data[i].expressCustomer+'</strong><span class="pull-right text-muted"><em>'+data[i].expressPhone+'</em></span></div><div>'+consultString+'</div></a></li><li class="divider"></li>')
			}
	
			$("#todayExpressList").append('<li><a class="text-center"href="${pageContext.request.contextPath}/express/expressAdminPage.do"><strong>금일 이사 '+data.length+' 건</strong> <iclass="fa fa-angle-right"></i></a></li>');
		}
		});
	})
});
</script>

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">YDE 관리페이지</a>
			</div>
			<!-- /.navbar-header -->



			<ul class="nav navbar-top-links navbar-right">
					
								
				<li id="todayCalc" class="dropdown"><a
					class="dropdown-toggle" data-toggle="dropdown" href="#"> <i
						class="fa fa-calculator fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-messages">
					<li><a class="text-center"href="${pageContext.request.contextPath}/express/expressAdminPage.do">
					<strong id="expressTodayCalcCount"></strong>
					 <iclass="fa fa-angle-right"></i></a></li>
					</ul> <!-- /.dropdown-messages --></li>
				<!-- /.dropdown -->

				<li id="todayConsult" class="dropdown"><a
					class="dropdown-toggle" data-toggle="dropdown" href="#"> <i
						class="fa fa-comment fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-messages" id="todayConsultList">
					</ul> <!-- /.dropdown-messages --></li>
				<!-- /.dropdown -->
				
				<li id="todayVisit" class="dropdown"><a
					class="dropdown-toggle" data-toggle="dropdown" href="#"> <i
						class="fa fa-search fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-messages" id="todayVisitList">
					</ul> <!-- /.dropdown-messages --></li>
				<!-- /.dropdown -->
				
				<li id="todayExpress" class="dropdown"><a
					class="dropdown-toggle" data-toggle="dropdown" href="#"> <i
						class="fa fa-truck fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-messages" id="todayExpressList">
					</ul> <!-- /.dropdown-messages --></li>
				<!-- /.dropdown -->

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
						</li>
						<li class="divider"></li>
						<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li><a href="${pageContext.request.contextPath}"><i
								class="fa fa-files-o fa-fw"></i> 홈페이지로 돌아가기</a></li>
						<li>
						<li><a
							href="${pageContext.request.contextPath}/express/expressAdminPage.do"><i
								class="fa fa-dashboard fa-fw"></i> 일정관리</a></li>
						<li><a
							href="${pageContext.request.contextPath}/sms/smsAdminPage.do"><i
								class="fa fa-table fa-fw"></i> SMS 관리</a></li>
						<li><a
							href="${pageContext.request.contextPath}/claim/claimAdminPage.do"><i
								class="fa fa-table fa-fw"></i> 신고 관리</a></li>
						<li><a
							href="${pageContext.request.contextPath}/employee/employeeAdminPage.do"><i
								class="fa fa-table fa-fw"></i> 직원 관리</a></li>
						<li><a
							href="${pageContext.request.contextPath}/resource/resourceAdminPage.do"><i
								class="fa fa-table fa-fw"></i> 자재 관리</a></li>
						<li><a
							href="${pageContext.request.contextPath}/gallery/galleryAdminPage.do"><i
								class="fa fa-table fa-fw"></i> 갤러리 관리</a></li>
						<li><a
							href="${pageContext.request.contextPath}/visit/selectListYearAdminPage.do"><i
								class="fa fa-table fa-fw"></i> 방문자 통계</a></li>
						<li><a
							href="${pageContext.request.contextPath}/expressState/selectListMonthAdminPage.do"><i
								class="fa fa-table fa-fw"></i> 기초상담 통계</a></li>
						<li><a
							href="${pageContext.request.contextPath}/expressType/selectListYearTypeAdminPage.do"><i
								class="fa fa-table fa-fw"></i> 이사종류 통계</a></li>

						<li><a href="index.html"><i class="fa fa-dashboard fa-fw"></i>
								Dashboard</a></li>
						<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
								Charts<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="flot.html">Flot Charts</a></li>
								<li><a href="morris.html">Morris.js Charts</a></li>
							</ul> <!-- /.nav-second-level --></li>
						<li><a href="tables.html"><i class="fa fa-table fa-fw"></i>
								Tables</a></li>
						<li><a href="forms.html"><i class="fa fa-edit fa-fw"></i>
								Forms</a></li>
						<li><a href="#"><i class="fa fa-wrench fa-fw"></i> UI
								Elements<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="panels-wells.html">Panels and Wells</a></li>
								<li><a href="buttons.html">Buttons</a></li>
								<li><a href="notifications.html">Notifications</a></li>
								<li><a href="typography.html">Typography</a></li>
								<li><a href="icons.html"> Icons</a></li>
								<li><a href="grid.html">Grid</a></li>
							</ul> <!-- /.nav-second-level --></li>
						<li><a href="#"><i class="fa fa-sitemap fa-fw"></i>
								Multi-Level Dropdown<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="#">Second Level Item</a></li>
								<li><a href="#">Second Level Item</a></li>
								<li><a href="#">Third Level <span class="fa arrow"></span></a>
									<ul class="nav nav-third-level">
										<li><a href="#">Third Level Item</a></li>
										<li><a href="#">Third Level Item</a></li>
										<li><a href="#">Third Level Item</a></li>
										<li><a href="#">Third Level Item</a></li>
									</ul> <!-- /.nav-third-level --></li>
							</ul> <!-- /.nav-second-level --></li>
						<li class="active"><a href="#"><i
								class="fa fa-files-o fa-fw"></i> Sample Pages<span
								class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a class="active" href="blank.html">Blank Page</a></li>
								<li><a href="login.html">Login Page</a></li>
							</ul> <!-- /.nav-second-level --></li>
						<li style="text-align: center"><br /> 오늘 방문자수
							&nbsp;&nbsp;&nbsp; ${todayCount}<br /> 총 방문자수&nbsp;&nbsp;&nbsp;
							${totalCount}</li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<tiles:insertAttribute name="content" />
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->




	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/sbadmin2/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/sbadmin2/dist/js/sb-admin-2.js"></script>

</body>

</html>
