<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>기초 상담 통계(구글차트)</title>


<script>
window.onload = init;
function init()
{
setDate(document.form);
}

function setDate(FORM, year, month)
{
var current, year, month, day, days, i, j;
current = new Date();
year = (year) ? year : current.getFullYear();
for (i=0, j=year-4; i < 5; i++, j++) FORM.year.options[i] = new Option(j, j);
month = (month) ? month : current.getMonth()+1;
for (i=0; i < 12; i++) {
j = (i < 9) ? '0'+(i+1) : i+1;
FORM.month.options[i] = new Option(j, j);
}
/* day = (day) ? day : current.getDate();
days = new Date(new Date(year, month, 1)-86400000).getDate(); */
/* FORM.ByDay.length = 0; */
/* for (i=0, j; i < days; i++) {
j = (i < 9) ? '0'+(i+1) : i+1;
FORM.ByDay.options[i] = new Option(j, j);
} */
FORM.year.value = year;
FORM.month.options[month-1].selected = true;
//FORM.ByDay.options[day-1].selected = true;
}

</script>


</head>
<body>

<!-- http://localhost/yde/go.do?go=admin_flot/expressType -->
<!-- http://localhost/yde/expressType/selectListYearTypeAdminPage.do -->

<br/>

<Form name="form">
<SELECT id="year" name="year" onChange="setDate(this.form, this.value, this.form.month.value)"></SELECT>년 &nbsp;
<SELECT id="month" name="month" onChange="setDate(this.form, this.form.year.value, this.value)"></SELECT>월 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button align="right" type="button" onclick="expressType('month')" style="float: center;">월별</button>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button align="right" type="button" onclick="expressType('year')" style="float: center;">년도별</button>&nbsp;
			<!-- <button align="right" type="button" onclick="visit('year')" style="float: center;">연도별</button> -->

	</Form>
 
 
 <br/><br/><br/>
 <!-- /.col-lg-6 -->
                <div class="">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            이사종류 통계
                        </div>
                        
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
		expressType('year');
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
						
						chartData.push([ '이사종류', '갯수' ])
						if(data.length == 0){
							var subarr = [ 0, 0];
							chartData.push(subarr);
						}
						else{
							for (i = 0; i < data.length; i++) {
								var subarr = [ data[i].EC, data[i].cnt ];
								chartData.push(subarr);
							}
						}	
						
						
						//챠트 그리기
						var chart = new google.visualization.PieChart(document.querySelector('#chart_div'));
						chart.draw(google.visualization.arrayToDataTable(chartData), options);
					
					}
				});
	}
	
	function expressType(charttab) {
		var url='';
		if	(charttab == 'month'){
			url = '${pageContext.request.contextPath}/expressType/selectListMonth.do?expressReqDate='+$("#year").val()+"-"+$("#month").val()
		}
		else if(charttab == 'year'){
			url = '${pageContext.request.contextPath}/expressType/selectListYear.do?expressReqDate='+$("#year").val()
		} 
		/* url = '${pageContext.request.contextPath}/expressState/selectListDay.do?date=2017-12' */
		chartDraw(url);
	}
</script> 
</body>
</html>