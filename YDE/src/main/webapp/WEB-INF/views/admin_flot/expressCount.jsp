<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>기초 상담 통계(구글차트)</title>
<script src="//www.google.com/jsapi"></script>
<script src="./resources/jquery/jquery-3.2.1.min.js"></script>

<!-- http://localhost/yde/go.do?go=admin_flot/expressCount -->
<script>
	var options = {
		title : '작업수',
		width : 1400,
		height : 700
	};
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});
	google.setOnLoadCallback(function() {
		//chartDraw('${pageContext.request.contextPath}/visit/selectListYear.do');
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
						
						chartData.push([ '날짜', '계산', "상담", "방문" ])
						if(data.length == 0){
							var subarr = [ "날짜", 0, 0, 0 ];
							chartData.push(subarr);
						}
						else{
							for (i = 0; i < data.length; i++) {
								var subarr = [ data[i].ymd, data[i].A01, data[i].A02, data[i].A03 ];
								chartData.push(subarr);
							}
						}	
						
						
						//챠트 그리기
						var chart = new google.visualization.ColumnChart(document.querySelector('#chart_div'));
						chart.draw(google.visualization.arrayToDataTable(chartData), options);
					
					}
				});
	}
	
	function visit(charttab) {
		var url='';
		if (charttab == 'day'){
			 
			url = '${pageContext.request.contextPath}/expressState/selectListDay.do?date='+$("#byYear").val()+"-"+$("#byMonth").val()
		}
		else if(charttab == 'month'){
			url = '${pageContext.request.contextPath}/expressState/selectListMonth.do?date='+$("#byYear").val()
		}
		else if(charttab == 'year'){
			url = '${pageContext.request.contextPath}/expressState/selectListYear.do'
		} 
		/* url = '${pageContext.request.contextPath}/expressState/selectListDay.do?date=2017-12' */
		chartDraw(url);
	}
</script>
</head>
<body>

<!-- http://localhost/yde/go.do?go=admin_flot/visitCount -->
<!-- http://localhost/yde/visit/selectListYearAdminPage.do -->

<br/>
 <form name=form>
<input type=hidden name="statistics" value="">
	<table class="basic">
		<tr>
			<!-- <th title="기준" width="60%"></th> -->
			<th align="center">
					<select name="byYear" id="byYear">
						<option value="2017">2017</option>
						<option value="2016">2016</option>
						<option value="2015">2015</option>
					</select>
				</th>
			<th align="center">
					<select name="byMonth" id="byMonth" >
						<option value="01" >1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11" >11</option>
						<option value="12">12</option>
					</select>
				</th>
			<th>&nbsp;
			<button align="right" type="button" onclick="visit('day')" style="float: center;">일별</button>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button align="right" type="button" onclick="visit('month')" style="float: center;">월별</button>&nbsp;
			<!-- <button align="right" type="button" onclick="visit('year')" style="float: center;">연도별</button> -->
			</th>
		</tr>
	</table>
	</form>
 
 
 <br/><br/><br/>
 <!-- /.col-lg-6 -->
                <div class="">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            기초상담 통계
                        </div>
                        
                         <div id="chart_div"></div>
                        <!-- /.panel-heading -->
                       
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
 
 

 
</body>
</html>