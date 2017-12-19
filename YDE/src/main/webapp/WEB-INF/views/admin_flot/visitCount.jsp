<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<script>
	var options = {
		title : '날짜별 방문자',
		width : 400,
		height : 500
	};
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});
	google.setOnLoadCallback(function() {
		//차트에 넣을 data를 ajax 요청해서 가져옴
		$.ajax({
			url : "./admingetVisitStatisticsList.do",
			method : "post",
			type : "json",
			success : function(data) {
				//ajax결과를 chart에 맞는 data 형태로 가공
				var chartData = [];
				chartData.push([ '날짜', '방문자' ])
				for (i = 0; i < data.length; i++) {
					var subarr = [ data[i].visitDate, data[i].visitIp ];
					chartData.push(subarr);
				}
				//챠트 그리기
				var chart = new google.visualization.LineChart(document.querySelector('#chart_div'));
				chart.draw(google.visualization.arrayToDataTable(chartData), options);
			}
		});
	});
</script>

</head>
<body>
 
 
 <div id="chart_div"></div>
 
 <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Bar Chart Example
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="flot-chart">
                                <div class="flot-chart-content" id="flot-bar-chart"></div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
 
 
</body>
</html>