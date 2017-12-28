<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>평형 통계(구글차트)</title>


<script>
window.onload = init;
function init()
{
	setDate(document.form);
}

function setDate(FORM, year, month)
{
	var current, day, currentYear, days, i, j;
	//년도 select 현재년도 기준으로 
	current = new Date();
	currentYear = current.getFullYear();
	for (i=0, j=currentYear-4; i < 5; i++, j++) 
	{
		FORM.year.options[i] = new Option(j, j);		
	}
	//월 select
	for (i=0; i < 12; i++) {
		j = (i < 9) ? '0'+(i+1) : i+1;
		FORM.month.options[i] = new Option(j, j);
	}
	// 초기값 세팅
	year = (year) ? year : current.getFullYear();
	month = (month) ? month : current.getMonth()+1;
	FORM.year.value = year;
	FORM.month.options[month-1].selected = true;

}

</script>


</head>
<body>

	<!-- http://localhost/yde/go.do?go=admin_flot/expressSpace -->
	<!-- http://localhost/yde/expressSpace/selectListYearSpaceAdminPage.do -->

	<br />

	<Form name="form">
		<SELECT id="year" name="year"
			onChange="setDate(this.form, this.value, this.form.month.value)"></SELECT>년
		&nbsp; <SELECT id="month" name="month"
			onChange="setDate(this.form, this.form.year.value, this.value)"></SELECT>월
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button align="right" type="button" onclick="expressSpace('month')"
			style="float: center;">월 조회</button>
		&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button align="right" type="button" onclick="expressSpace('year')"
			style="float: center;">년도 조회</button>
		&nbsp;
		<!-- <button align="right" type="button" onclick="visit('year')" style="float: center;">연도별</button> -->

	</Form>


	<br />
	<br />
	<br />
	<!-- /.col-lg-6 -->
	<div class="">
		<div class="panel panel-default">
			<div class="panel-heading">평형 통계</div>

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
		expressSpace('year');
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
						
						chartData.push([ '평형', '갯수' ])
						if(data.length == 0){
							var subarr = [ '', ''];
							chartData.push(subarr);
							alert('해당 데이터가 존재하지 않습니다.');
						}
						else{
							for (i = 0; i < data.length; i++) {
								var subarr = [ data[i].range, data[i].number_of_size ];
								chartData.push(subarr);
							}
						}	
						
						
						//챠트 그리기
						var chart = new google.visualization.PieChart(document.querySelector('#chart_div'));
						chart.draw(google.visualization.arrayToDataTable(chartData), options);
					
					}
				});
	}
	
	function expressSpace(charttab) {
		var url='';
		if	(charttab == 'month'){
			url = '${pageContext.request.contextPath}/expressSpace/selectListMonth.do?expressReqDate='+$("#year").val()+"-"+$("#month").val()
		}
		else if(charttab == 'year'){
			url = '${pageContext.request.contextPath}/expressSpace/selectListYear.do?expressReqDate='+$("#year").val()
		} 
		/* url = '${pageContext.request.contextPath}/expressState/selectListDay.do?date=2017-12' */
		chartDraw(url);
	}
</script>
</body>
</html>