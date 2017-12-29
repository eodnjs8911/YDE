<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>매출 통계(구글차트)</title>


<script>
window.onload = init;
function init()
{
	setDate(document.form);
}

function setDate(FORM, year)
{
	var current, day, currentYear, days, i, j;
	//년도 select 현재년도 기준으로 
	current = new Date();
	currentYear = current.getFullYear();
	for (i=0, j=currentYear-4; i < 5; i++, j++) 
	{
		FORM.year.options[i] = new Option(j, j);		
	}
	
	// 초기값 세팅
	year = (year) ? year : current.getFullYear();
	
	FORM.year.value = year;
	

}
</script>


</head>
<body>

	<!-- http://localhost/yde/go.do?go=admin_flot/expressSales -->
	<!-- http://localhost/yde/expressSales/selectListYearSalesAdminPage.do -->

	<br />

	<Form name="form">
		<SELECT id="year" name="year"
			onChange="setDate(this.form, this.value, this.form.month.value)"></SELECT>년
		
		&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button align="right" type="button" onclick="expressSales('month')"
			style="float: center;">월별(년당)</button>
		&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button align="right" type="button" onclick="expressSales('year')"
			style="float: center;">년도별(전체)</button>
		&nbsp;
		<!-- <button align="right" type="button" onclick="visit('year')" style="float: center;">연도별</button> -->

	</Form>


	<br />
	<br />
	<br />
	<!-- /.col-lg-6 -->
	<div class="">
		<div class="panel panel-default">
			<div class="panel-heading">매출 통계</div>

			<div id="chart_div"></div>
			<!-- /.panel-heading -->

			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>



	<script src="//www.google.com/jsapi"></script>


	<script>
	var options = {
		title : '',
		width : 1400,
		height : 700,
		is3D:true
	};
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});
	google.setOnLoadCallback(function() {
		expressSales('year');
	});
	
	function chartDraw(url){
		//차트에 넣을 data를 ajax 요청해서 가져옴
				$.ajax({
					url : url,
					method : "post",
					type : "json",
					success : function(data) {
						//ajax결과를 chart에 맞는 data 형태로 가공
						console.log(data);
						var chartData = [];
						
						chartData.push([ '매출', '날짜' ])
						if(data.length == 0){
							var subarr = [ 0, 0];
							chartData.push(subarr);
							alert('해당 데이터가 존재하지 않습니다.');
						}
						else{
							for (i = 0; i < data.length; i++) {
								var subarr = [ data[i].ymd, data[i].express_sales ];
								chartData.push(subarr);
							}
						}	
						
						
						//챠트 그리기
						var chart = new google.visualization.LineChart(document.querySelector('#chart_div'));
						chart.draw(google.visualization.arrayToDataTable(chartData), options);
					
					}
				});
	}
	
	function expressSales(charttab) {
		var url='';
		if	(charttab == 'month'){
			url = '${pageContext.request.contextPath}/expressSales/selectListMonth.do?expressDate='+$("#year").val()
		}
		else if(charttab == 'year'){
			url = '${pageContext.request.contextPath}/expressSales/selectListYear.do'
		} 
		/* url = '${pageContext.request.contextPath}/expressState/selectListDay.do?date=2017-12' */
		chartDraw(url);
	}
</script>
</body>
</html>