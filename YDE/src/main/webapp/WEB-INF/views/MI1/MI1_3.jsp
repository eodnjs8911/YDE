<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/jquery/date_calendar.css">
<script>
	$(function() {

		$.ajax({
			type : "POST",
			url : '/yde/calenar/isNoGhostDay.do',
			dataType : "json",
			async : false,
			success : function(data) {
				noGhostDays = data;
			}
		});

		$('#dp').datepicker(
				{
					monthNames : [ ".01", ".02", ".03", ".04", ".05", ".06",
							".07", ".08", ".09", ".10", ".11", ".12" ],
					dateFormat : "yy-mm-dd",
					numberOfMonths : 2,
					minDate : '0',
					maxDate : '+2m',
					closeText : "닫기",
					prevText : "이전달",
					nextText : "다음달",
					currentText : "오늘",
					monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
							"7월", "8월", "9월", "10월", "11월", "12월" ],
					dayNames : [ "일", "월", "화", "수", "목", "금", "토" ],
					dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					weekHeader : "Wk",
					dateFormat : "yymmdd",
					firstDay : 0,
					isRTL : false,
					showMonthAfterYear : true,
					yearSuffix : "",
					beforeShowDay : function(date) {
						var datestring = jQuery.datepicker.formatDate('yymmdd',
								date);
						var hindex = $.inArray(datestring, noGhostDays);
						if (hindex > -1) {
							return [ true, "highlight_es", "손없는날" ];
						} else {
							return [ true, "", "" ];
						}
					},
					onSelect : function(dateText, inst){
						console.log(dateText);
						location.assign("express/calcPage.do?date="+dateText);  
					}
				})

	});
</script>

</head>
<body>
	<%@ include file="menu_MI1.jsp"%>
	<br />
	<img
		src="${pageContext.request.contextPath}/resources/images/MI1_3.png"
		width="100%">
		<div id="dp" class="col-md-10 col-md-offset-1 col-sm-12"></div>
</body>
</html>