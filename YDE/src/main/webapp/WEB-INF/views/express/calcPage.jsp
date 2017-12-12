<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/yde/resources/daumAddr.js"></script>

<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");
%>

<script>
	var expressNo = 0;
	function priceCalc() {
		var formData = $("#calcForm").serialize();
		console.log(formData);
		$.getJSON('/yde/express/priceCalc.do', formData, function(data) {
			$("#price").val(data.price)
			console.log(data.expressNo);
			expressNo = data.expressNo;
		});
	}

	function consultReg() {
		var phone = $("#phone1").val() + $("#phone2").val()
				+ $("#phone3").val()
		$("#expressPhone").val(phone)
		if (expressNo != 0) {
			$("#consultExpressNo").val(expressNo);
		} else {
			$("#consultExpressNo").attr("disabled", "disabled");
		}
		var formData = $("#consultForm").serialize();
		console.log("aa");
		$.getJSON('/yde/express/consultReg.do', formData, function(data) {
			if (data.result == "success") {
				$("#consultModal").modal('hide')
				$("#consultConfirmModalText").text("상담 신청 완료");
				$("#consultConfirmModal").modal('show')

			} else {
				$("#consultModal").modal('hide')
				$("#consultConfirmModalText").text("상담 신청 실패");
				$("#consultConfirmModal").modal('show')
			}

		});
	}
</script>


<div class="col-md-6"></div>
<div class="col-md-6">
	<form class="form-horizontal" id="calcForm">
		<div class="form-group">
			<label for="expressCategory" class="col-md-3 control-label">이사종류</label>
			<div class="col-md-9">
				<select class="form-control" id="expressCategory"
					name="expressCategory">
					<option>포장 이사</option>
					<option>일반 이사</option>
					<option>원룸 이사</option>
					<option>기업 이사</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="expressDate" class="col-md-3 control-label">이사날짜</label>
			<div class="col-md-9">
				<input type="date" class="form-control" id="expressDate"
					name="expressDate">
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
			<label for="departureSize" class="col-md-3 control-label">평형</label>
			<div class="col-md-3">
				<select class="form-control" id="expressDepartureSize"
					name="expressDepartureSize">
					<option>21</option>
					<option>28</option>
					<option>32</option>
					<option>38</option>
				</select>
			</div>
			<label for="departureFloor" class="col-md-2 control-label">층수</label>
			<div class="col-md-4">

				<input class="form-control" type="number" id="expressDepartureFloor"
					name="expressDepartureFloor" min="1" max="50" value="1" step="1" />
			</div>
		</div>

		<div class="form-group">
			<label for="expressArrive" class="col-md-3 control-label">도착지</label>
			<div class="col-md-9">
				<input class="form-control" type="text" id="expressArrive"
					name="expressArriveAddr1" style="cursor: pointer;"
					onclick="addrDialog(this)" placeholder="도착지" readonly>
			</div>
		</div>

		<div class="form-group">
			<label for="arriveSize" class="col-md-3 control-label">평형</label>
			<div class="col-md-3">
				<select class="form-control" id="arriveSize"
					name="expressArriveSize">
					<option>21</option>
					<option>28</option>
					<option>32</option>
					<option>38</option>
				</select>
			</div>
			<label for="arriveFloor" class="col-md-2 control-label">층수</label>
			<div class="col-md-4">
				<input class="form-control" type="number" id="arriveFloor"
					name="expressArriveFloor" min="1" max="50" value="1" />
			</div>
		</div>

		<div class="form-group">
			<label for="expresDeparture" class="col-md-3 control-label">특수이삿짐</label>
			<div class="col-md-9">
				<label class="checkbox-inline"> <input type="checkbox"
					id="inlineCheckbox1" value="option1"> 벽걸이TV
				</label> <label class="checkbox-inline"> <input type="checkbox"
					id="inlineCheckbox2" value="option2"> 에어컨
				</label> <label class="checkbox-inline"> <input type="checkbox"
					id="inlineCheckbox3" value="option3"> 입주청소
				</label>
			</div>

		</div>

		<div class="form-group">
			<label for="price" class="col-md-3 control-label">예상가격</label>
			<div class="col-md-6">
				<input type="text" class="form-control" id="price"
					placeholder="예상가격">
			</div>
			<div class="col-md-3">
				<input class="btn btn-default" type="button" value="계산"
					onclick="priceCalc()">
			</div>
		</div>



		<div class="form-group">
			<div class="col-md-offset-3 col-md-6">
				<input class="btn btn-default" type="button" value="상담 신청"
					data-toggle="modal" data-target="#consultModal">
			</div>
		</div>
	</form>

</div>

<div class="modal fade" role="dialog"
	aria-labelledby="gridSystemModalLabel" aria-hidden="true"
	id="consultModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="gridSystemModalLabel">상담 신청</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<form class="form-horizontal" id="consultForm">
						<div class="form-group">
							<label for="expressDate" class="col-md-3 control-label">이름</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="expressCustomer"
									name="expressCustomer">
							</div>
						</div>

						<div class="form-group">
							<label for="price" class="col-md-3 control-label">연락처</label>
							<div class="col-md-3">
								<input type="tel" class="form-control" id="phone1">
							</div>
							<div class="col-md-3">
								<input type="tel" class="form-control" id="phone2">
							</div>
							<div class="col-md-3">
								<input type="tel" class="form-control" id="phone3">
							</div>
						</div>
						<input type="hidden" id="expressPhone" name="expressPhone">
						<input type="hidden" id="consultExpressNo" name="expressNo">
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="consultReg()">상담
					신청</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" role="dialog"
	aria-labelledby="gridSystemModalLabel" aria-hidden="true"
	id="consultConfirmModal">
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
					<h3 id="consultConfirmModalText"></h3>
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
