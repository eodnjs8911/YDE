<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script
	src='${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.min.js'></script>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.min.css' />
<script
	src='${pageContext.request.contextPath}/resources/fullcalendar/locale-all.js'></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/daumaddr/daumAddr.js"></script>

<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/jquery.jqGrid.min.js"></script>
<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/grid.locale-kr.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid/ui.jqgrid-bootstrap.css" />

<div>
	<div>
	<table class="table">
	<tr>
	<td style="background-color: #FFFF33">상담신청</td>
	<td style="background-color: #FFCC33">방문신청</td>
	<td style="background-color: #FF9933">방문견적</td>
	<td style="background-color: #66FF99">계약완료</td>
	<td style="background-color: #66FF00">이사완료</td>
	</tr>
	</table>
	</div>
	<div id="calendar"></div>

	<script type='text/javascript'>
		$(function() {
			var detailId = '${param.detailId}';
			if (detailId != '') {
				showDetail(detailId);
			}
		});

		$('#calendar').fullCalendar(
				{
					locale : 'ko',
					customButtons : {
						addButton : {
							text : '일정추가',
							click : function() {
								$("#expressSaveBtn").hide();
								$("#expressDelBtn").hide();
								$("#expressInsBtn").show();
								$("#dialogType").val("insert");
								$("#expressDetailForm").get(0).reset();
								$("#expressDate").val(
										moment().format("YYYY-MM-DD HH:")
												+ "00");
								$("#expressDate").get(0).step = 60 * 10;
								$('#expressDetailModal').modal('show');
							}
						}
					},
					header : {
						left : 'prev,next today',
						center : 'title',
						right : 'month,basicWeek,basicDay,list,addButton'
					},
					navLinks : true, // can click day/week names to navigate views
					editable : true,
					eventDrop : function(event, delta, revertFunc) {

						//alert(event.title + " was dropped on " + event.start.format());

						if (!confirm("변경하시겠습니까?")) {
							revertFunc();
						}

						$.getJSON('/yde/express/expressDragNDrop.do', {
							"expressNo" : event.id,
							"expressDate" : event.start.format()
						}, function(data) {

						});
					},

					eventSources : [

					// your event source
					{
						url : '/yde/express/selectCalendarList.do',
						type : 'POST',
						error : function() {
							alert('there was an error while fetching events!');
						}
					}

					// any other sources...

					],
					eventClick : function(calEvent, jsEvent, view) {
						console.log(calEvent);
						showDetail(calEvent.id);
					}
				});

		function showDetail(expressNo) {
			$.getJSON('/yde/express/expressDetail.do', {
				"expressNo" : expressNo
			}, function(data) {
				$("#expressNo").val(expressNo);
				$("#expressDetailForm").get(0).reset();
				$("#expressCategory").val(data.expressCategory);
				$("#expressDate").val(
						moment(data.expressDate, 'YYYY-MM-DD HH:mm:ss.SZZ')
								.format("YYYY-MM-DD HH:mm"));

				$("#expressState").val(data.expressState);

				$("#expresDeparture").val(data.expressDepartureAddr1);
				$("#expressDepartureSize").val(data.expressDepartureSize);
				$("#expressDepartureFloor").val(data.expressDepartureFloor);

				$("#expressArriveAddr").val(data.expressArriveAddr1);
				$("#expressArriveSize").val(data.expressArriveSize);
				$("#expressArriveFloor").val(data.expressArriveFloor);

				$("#expressDeposit").val(data.expressDeposit);
				$("#expressRemainder").val(data.expressRemainder);
				$("#expressVisitEstimate").val(data.expressVisitEstimate);
				$("#expressEstimateAmount").val(data.expressEstimateAmount);
		

				$("#expressCustomer").val(data.expressCustomer);
				$("#expressPhone").val(data.expressPhone);
				$("#expressPayCategory").val(data.expressPayCategory);

				if (data.expressVisitTime != null
						&& data.expressVisitTime.length > 0) {
					$("#expressVisitTime").val(
							moment(data.expressVisitTime,
									'YYYY-MM-DD HH:mm:ss.SZZ').format(
									"YYYY-MM-DD HH:mm"));

				}

				if (data.expressCDate != null && data.expressCDate.length > 0) {
					$("#expressCDate")
							.val(
									moment(data.expressCDate,
											'YYYY-MM-DD HH:mm:ss.SZZ').format(
											"YYYY-MM-DD"));
				}

				var str = data.expressSpeicialItem;

				if (str != null) {
					var res = str.split(",");
					console.log(res);
					$("[name='expressSpeicialItem']").val(res);
				}

				$("#expressSaveBtn").show();
				$("#expressDelBtn").show();
				$("#expressInsBtn").hide();
				$("#dialogType").val("modify");

				$('#expressDetailModal').modal('show');
			});
		}

		function detailSave() {
			var formData = $("#expressDetailForm").serialize();
			$.getJSON('/yde/express/expressDetailSave.do', formData, function(
					data) {
				if (data.result == "success") {
					$("#expressDetailModal").modal('hide')
					$("#saveConfirmModalText").text("변경 완료");
					$("#saveConfirmModal").modal('show')

				} else {
					$("#expressDetailModal").modal('hide')
					$("#saveConfirmModalText").text("변경 실패");
					$("#saveConfirmModal").modal('show')
				}
				$('#calendar').fullCalendar('refetchEvents')
			});
		}

		function detailIns() {
			var formData = $("#expressDetailForm").serialize();
			$.getJSON('/yde/express/expressDetailIns.do', formData, function(
					data) {
				if (data.result == "success") {
					$("#expressDetailModal").modal('hide')
					$("#saveConfirmModalText").text("등록 완료");
					$("#saveConfirmModal").modal('show')

				} else {
					$("#expressDetailModal").modal('hide')
					$("#saveConfirmModalText").text("등록 실패");
					$("#saveConfirmModal").modal('show')
				}
				$('#calendar').fullCalendar('refetchEvents')
			});
		}

		function detailDel() {
			var formData = $("#expressDetailForm").serialize();
			$.getJSON('/yde/express/expressDetailDel.do', formData, function(
					data) {
				if (data.result == "success") {
					$("#expressDetailModal").modal('hide')
					$("#saveConfirmModalText").text("삭제 완료");
					$("#saveConfirmModal").modal('show')

				} else {
					$("#expressDetailModal").modal('hide')
					$("#saveConfirmModalText").text("삭제 실패");
					$("#saveConfirmModal").modal('show')
				}
				$('#calendar').fullCalendar('refetchEvents')
			});
		}

		function rightClick(v) {
			if (v == 'e') {
				var fromGrid = $("#employeeGrid");
				var toGrid = $("#manageEmployeeGrid");
			} else {
				var fromGrid = $("#resourceGrid");
				var toGrid = $("#manageResourceGrid");
			}

			var rowKey = fromGrid.getGridParam("selrow");

			if (rowKey) {
				var selectedIDs = fromGrid.getGridParam("selarrrow");

				while (selectedIDs.length > 0) {
					var data = fromGrid.jqGrid('getRowData', selectedIDs[0]);
					toGrid.jqGrid('addRowData', selectedIDs[0], data);
					fromGrid.jqGrid('delRowData', selectedIDs[0]);
				}
			}
		}

		function leftClick(v) {
			if (v == 'e') {
				var fromGrid = $("#manageEmployeeGrid");
				var toGrid = $("#employeeGrid");
			} else {
				var fromGrid = $("#manageResourceGrid");
				var toGrid = $("#resourceGrid");
			}

			var rowKey = fromGrid.getGridParam("selrow");

			if (rowKey) {
				var selectedIDs = fromGrid.getGridParam("selarrrow");

				while (selectedIDs.length > 0) {
					var data = fromGrid.jqGrid('getRowData', selectedIDs[0]);
					toGrid.jqGrid('addRowData', selectedIDs[0], data);
					fromGrid.jqGrid('delRowData', selectedIDs[0]);
				}
			}
		}

		function workSave() {
			var expressNo = $("#expressNo").val();
			var rowData = $('#manageEmployeeGrid').getRowData();
			console.log(rowData);
			console.log(JSON.stringify(rowData));

			$.ajax({
				url : '/yde/employee/insertEmployeeExpress.do',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				async : false,
				data : JSON.stringify({
					'expressNo' : expressNo,
					datas : rowData
				}),
				type : 'POST',
				mimeType : 'application/json',
				error : function(xhr, status, msg) {
					console.log("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(xhr) {
					//console.log(xhr.result);
					//$("#manageWorkModal").modal('hide')

				}
			});
			var rowData2 = $('#manageResourceGrid').getRowData();
			$.ajax({
				url : '/yde/resource/insertResourceExpress.do',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				data : JSON.stringify({
					'expressNo' : expressNo,
					datas : rowData2
				}),
				type : 'POST',
				mimeType : 'application/json',
				error : function(xhr, status, msg) {
					console.log("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : function(xhr) {
					console.log(xhr.result);
					$("#manageWorkModal").modal('hide')

				}
			});
		}

		function manageWork() {
			var expressNo = "?expressNo=" + $("#expressNo").val();
			$("#employeeGrid").jqGrid({
				url : '/yde/employee/selectListByNoExpress.do' + expressNo,
				mtype : "GET",
				styleUI : 'Bootstrap',
				datatype : "json",
				height : 250,
				colModel : [ {
					label : '번호',
					name : 'employeeNo',
					width : 60,
					key : true
				}, {
					label : '이름',
					name : 'employeeName',
					width : 100
				} ],
				viewrecords : true,
				multiselect : true,
				height : 'auto',
				autowidth : true,
				responsive : true,
				rowNum : 10
			});

			$("#manageEmployeeGrid").jqGrid({
				url : '/yde/employee/selectListByExpress.do' + expressNo,
				mtype : "GET",
				styleUI : 'Bootstrap',
				datatype : "json",
				height : 250,
				colModel : [ {
					label : '번호',
					name : 'employeeNo',
					width : 60,
					key : true
				}, {
					label : '이름',
					name : 'employeeName',
					width : 100
				} ],
				viewrecords : true,
				multiselect : true,
				height : 'auto',
				autowidth : true,
				responsive : true,
				rowNum : 10
			});

			$("#resourceGrid").jqGrid({
				url : '/yde/resource/selectListByNoExpress.do' + expressNo,
				mtype : "GET",
				styleUI : 'Bootstrap',
				datatype : "json",
				height : 250,
				colModel : [ {
					label : '번호',
					name : 'resourceNo',
					width : 60,
					key : true
				}, {
					label : '이름',
					name : 'resourceName',
					width : 100
				} ],
				viewrecords : true,
				multiselect : true,
				height : 'auto',
				autowidth : true,
				responsive : true,
				rowNum : 10
			});

			$("#manageResourceGrid").jqGrid({
				url : '/yde/resource/selectListByExpress.do' + expressNo,
				mtype : "GET",
				styleUI : 'Bootstrap',
				datatype : "json",
				height : 250,
				colModel : [ {
					label : '번호',
					name : 'resourceNo',
					width : 60,
					key : true
				}, {
					label : '이름',
					name : 'resourceName',
					width : 100
				} ],
				viewrecords : true,
				multiselect : true,
				height : 'auto',
				autowidth : true,
				responsive : true,
				rowNum : 10
			});


			$("#employeeGrid").setGridParam({
				url : '/yde/employee/selectListByNoExpress.do' + expressNo,
			}).trigger('reloadGrid');
			$("#manageEmployeeGrid").setGridParam({
				url : '/yde/employee/selectListByExpress.do' + expressNo,
			}).trigger('reloadGrid');
			$("#resourceGrid").setGridParam({
				url : '/yde/resource/selectListByNoExpress.do' + expressNo,
			}).trigger('reloadGrid');
			$("#manageResourceGrid").setGridParam({
				url : '/yde/resource/selectListByExpress.do' + expressNo,
			}).trigger('reloadGrid');
			$("#manageWorkModal").modal('show')
		}
		
		function visitTimeChange(){
			console.log("asd");
		}
	</script>

	<div class="modal fade" role="dialog"
		aria-labelledby="gridSystemModalLabel" aria-hidden="true"
		id="expressDetailModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">상세정보</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">

						<form class="form-horizontal" id="expressDetailForm">
							<input type="hidden" id="dialogType"> <input
								type="hidden" id="expressNo">
							<div class="form-group">
								<label for="expressDate" class="col-md-3 control-label">이사날짜</label>
								<div class="col-md-9">
									<input type="text" class="form-control" id="expressDate"
										name="expressDate">

									<script>
										$("#expressDate").datetimepicker({
											locale : 'ko',
											format : 'YYYY-MM-DD HH:mm',
											showClose : true,
											showClear : true,
											showTodayButton : true,
											stepping : 10,
											sideBySide : true
										});
									</script>
								</div>
							</div>

							<div class="form-group">
								<label for="expressState" class="col-md-3 control-label">현재상태</label>
								<div class="col-md-3">
									<select class="form-control" id="expressState"
										name="expressState">
										<option value="A01">견적계산</option>
										<option value="A02">상담신청</option>
										<option value="A03">방문신청</option>
										<option value="A04">방문견적</option>
										<option value="A05">계약완료</option>
										<option value="A06">이사완료</option>
										<option value="A07">취소</option>
									</select>
								</div>

								<label for="expressCategory" class="col-md-2 control-label">이사종류</label>
								<div class="col-md-4">
									<select class="form-control" id="expressCategory"
										name="expressCategory">
										<option value="B01">포장 이사</option>
										<option value="B02">일반 이사</option>
										<option value="B03">원룸 이사</option>
										<option value="B04">기업 이사</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="expresDeparture" class="col-md-3 control-label">출발지</label>
								<div class="col-md-9">
									<input type="text" class="form-control" id="expresDeparture"
										style="cursor: pointer;" onclick="addrDialog(this)"
										placeholder="출발지" name="expressDepartureAddr1" readonly>
								</div>
							</div>

							<div class="form-group">
								<label for="expressDepartureAddr2"
									class="col-md-3 control-label">상세주소</label>
								<div class="col-md-9">
									<input type="text" class="form-control"
										id="expressDepartureAddr2" name="expressDepartureAddr2">
								</div>
							</div>

							<div class="form-group">
								<label for="departureSize" class="col-md-3 control-label">평형</label>
								<div class="col-md-3">
									<input class="form-control" type="number"
										id="expressDepartureSize" name="expressDepartureSize" min="1"
										max="500" value="1" />
								</div>
								<label for="departureFloor" class="col-md-2 control-label">층수</label>
								<div class="col-md-4">

									<input class="form-control" type="number"
										id="expressDepartureFloor" name="expressDepartureFloor"
										min="1" max="50" value="1" step="1" />
								</div>
							</div>

							<div class="form-group">
								<label for="expressArrive" class="col-md-3 control-label">도착지</label>
								<div class="col-md-9">
									<input class="form-control" type="text" id="expressArriveAddr"
										name="expressArriveAddr1" style="cursor: pointer;"
										onclick="addrDialog(this)" placeholder="도착지" readonly>
								</div>
							</div>

							<div class="form-group">
								<label for="expressArriveAddr2" class="col-md-3 control-label">상세주소</label>
								<div class="col-md-9">
									<input type="text" class="form-control"
										id="expressDepartureAddr2" name="expressArriveAddr2">
								</div>
							</div>

							<div class="form-group">
								<label for="arriveSize" class="col-md-3 control-label">평형</label>
								<div class="col-md-3">
									<input class="form-control" type="number"
										id="expressArriveSize" name="expressArriveSize" min="1"
										max="500" value="1" />
								</div>
								<label for="arriveFloor" class="col-md-2 control-label">층수</label>
								<div class="col-md-4">
									<input class="form-control" type="number"
										id="expressArriveFloor" name="expressArriveFloor" min="1"
										max="50" value="1" />
								</div>
							</div>

							<div class="form-group">
								<label for="expresDeparture" class="col-md-3 control-label">특수이삿짐</label>
								<div class="col-md-9">
									<label class="checkbox-inline"> <input type="checkbox"
										id="inlineCheckbox1" value="tv" name="expressSpeicialItem">
										벽걸이TV
									</label> <label class="checkbox-inline"> <input type="checkbox"
										id="inlineCheckbox2" value="aircon" name="expressSpeicialItem">
										에어컨
									</label> <label class="checkbox-inline"> <input type="checkbox"
										id="inlineCheckbox3" value="clean" name="expressSpeicialItem">
										입주청소
									</label>
								</div>

							</div>

							<div class="form-group">
								<label for="expressCustomer" class="col-md-3 control-label">고객명</label>
								<div class="col-md-3">
									<input class="form-control" type="text" id="expressCustomer"
										name="expressCustomer" />
								</div>
								<label for="expressPhone" class="col-md-2 control-label">연락처</label>
								<div class="col-md-4">

									<input class="form-control" type="tel" id="expressPhone"
										name="expressPhone" />
								</div>
							</div>

							<div class="form-group">
								<label for="expressVisitTime" class="col-md-3 control-label">방문시간</label>
								<div class="col-md-9">
									<input type="text" class="form-control" id="expressVisitTime"
										name="expressVisitTime">

									<script>
										$("#expressVisitTime").datetimepicker({
											locale : 'ko',
											format : 'YYYY-MM-DD HH:mm',
											showClose : true,
											showClear : true,
											showTodayButton : true,
											stepping : 10,
											sideBySide : true
										});
									</script>
								</div>
							</div>

							<div class="form-group">
								<label for="departureSize" class="col-md-3 control-label">예상금액</label>
								<div class="col-md-3">
									<input class="form-control" type="number"
										id="expressEstimateAmount" name="expressEstimateAmount"
										value="0" />
								</div>
								<label for="expressVisitEstimate"
									class="col-md-2 control-label">견적금액</label>
								<div class="col-md-4">

									<input class="form-control" type="number"
										id="expressVisitEstimate" name="expressVisitEstimate" value="0" />
								</div>
							</div>

							<div class="form-group">
								<label for="expressPayCategory" class="col-md-3 control-label">결제수단</label>
								<div class="col-md-3">

									<select class="form-control" id="expressPayCategory"
										name="expressPayCategory">
										<option value="C01">현금</option>
										<option value="C02">계좌이체</option>
										<option value="C03">체크카드</option>
										<option value="C04">신용카드</option>
									</select>
								</div>

								<label for="expressCDate" class="col-md-2 control-label">계약일</label>
								<div class="col-md-4">
									<input class="form-control" type="text" id="expressCDate"
										name="expressCDate" />

									<script>
										$("#expressCDate").datetimepicker({
											locale : 'ko',
											format : 'YYYY-MM-DD',
											showClose : true,
											showClear : true,
											showTodayButton : true,
											enabledHours : false,
											sideBySide : true
										});
									</script>
								</div>

							</div>

							<div class="form-group">
								<label for="expressDeposit" class="col-md-3 control-label">계약금</label>
								<div class="col-md-3">
									<input class="form-control" type="number" id="expressDeposit"
										name="expressDeposit" value="0" />
								</div>
								<label for="expressRemainder" class="col-md-2 control-label">잔금</label>
								<div class="col-md-4">

									<input class="form-control" type="number" id="expressRemainder"
										name="expressRemainder" value="0" />
								</div>
							</div>

						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-left"
						onclick="manageWork()">인원관리</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="expressSaveBtn"
						onclick="detailSave()">저장</button>
					<button type="button" class="btn btn-primary" id="expressInsBtn"
						onclick="detailIns()">등록</button>
					<button type="button" class="btn btn-primary" id="expressDelBtn"
						onclick="detailDel()">삭제</button>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<div class="modal fade" role="dialog"
		aria-labelledby="gridSystemModalLabel" aria-hidden="true"
		id="saveConfirmModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">확인</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<h3 id="saveConfirmModalText"></h3>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<div class="modal fade" role="dialog"
		aria-labelledby="gridSystemModalLabel" aria-hidden="true"
		id="manageWorkModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">인원관리</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">

						<div id="manageTabs" role="tabpanel">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a
									href="#employeeTab" aria-controls="home" role="tab"
									data-toggle="tab">인원</a></li>
								<li role="presentation"><a href="#resourceTab"
									aria-controls="profile" role="tab" data-toggle="tab">장비</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div id="employeeTab" role="tabpanel" class="tab-pane active">
									<div class="form-group">
										<div class="col-md-5">
											<table id="employeeGrid"></table>
											<div id="employeeGridPager"></div>
										</div>
										<div class="col-md-2">
											<button onclick="rightClick('e')">&gt;</button>
											<button onclick="leftClick('e')">&lt;</button>
										</div>
										<div class="col-md-5">
											<table id="manageEmployeeGrid"></table>
											<div id="manageEmployeeGridPager"></div>
										</div>
									</div>
								</div>
								<div id="resourceTab" role="tabpanel" class="tab-pane">
									<div class="form-group">
										<div class="col-md-5">
											<table id="resourceGrid"></table>
											<div id="resourceGridPager"></div>
										</div>
										<div class="col-md-2">
											<button onclick="rightClick('t')">&gt;</button>
											<button onclick="leftClick('t')">&lt;</button>
										</div>
										<div class="col-md-5">
											<table id="manageResourceGrid"></table>
											<div id="manageResourceGridPager"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-default" onclick="workSave()">확인</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</div>
