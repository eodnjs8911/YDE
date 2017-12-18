<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
				<h4 class="modal-title" id="gridSystemModalLabel">상담 신청</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">

					<form class="form-horizontal" id="calcForm">
						<div class="form-group">
							<label for="expressCategory" class="col-md-3 control-label">이사종류</label>
							<div class="col-md-3">
								<select class="form-control" id="expressCategory"
									name="expressCategory">
									<option>포장 이사</option>
									<option>일반 이사</option>
									<option>원룸 이사</option>
									<option>기업 이사</option>
								</select>
							</div>
							<label for="expressDate" class="col-md-2 control-label">이사날짜</label>
							<div class="col-md-4">
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

								<input class="form-control" type="number"
									id="expressDepartureFloor" name="expressDepartureFloor" min="1"
									max="50" value="1" step="1" />
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
							<label for="expressCustomer" class="col-md-3 control-label">고객명</label>
							<div class="col-md-3">
								<input class="form-control" type="number" id="expressCustomer"
									name="expressCustomer" />
							</div>
							<label for="expressPhone" class="col-md-2 control-label">연락처</label>
							<div class="col-md-4">

								<input class="form-control" type="number" id="expressPhone"
									name="expressPhone" />
							</div>
						</div>

						<div class="form-group">
							<label for="departureSize" class="col-md-3 control-label">예상톤수</label>
							<div class="col-md-3">
								<input class="form-control" type="number" id="express"
									name="expressDepartureFloor" />
							</div>
							<label for="expressEstimateAmount" class="col-md-2 control-label">예상금액</label>
							<div class="col-md-4">

								<input class="form-control" type="number"
									id="expressEstimateAmount" name="expressEstimateAmount" />
							</div>
						</div>

						<div class="form-group">
							<label for="expressCDate" class="col-md-3 control-label">계약일</label>
							<div class="col-md-3">
								<input class="form-control" type="number" id="expressCDate"
									name="expressCDate" />
							</div>
							<label for="" expressPayCategory"" class="col-md-2 control-label">결제수단</label>
							<div class="col-md-4">

								<input class="form-control" type="number"
									id="expressPayCategory" name="" expressPayCategory"" />
							</div>
						</div>

						<div class="form-group">
							<label for="expressDeposit" class="col-md-3 control-label">계약금</label>
							<div class="col-md-3">
								<input class="form-control" type="number" id="expressDeposit"
									name="expressDeposit" />
							</div>
							<label for="expressRemainder" class="col-md-2 control-label">잔금</label>
							<div class="col-md-4">

								<input class="form-control" type="number" id="expressRemainder"
									name="expressRemainder" />
							</div>
						</div>

						<div class="form-group">
							<label for="expressState" class="col-md-3 control-label">현재상태</label>
							<div class="col-md-3">
								<input class="form-control" type="number" id="expressState"
									name="expressState" />
							</div>
							<label for="departureFloor" class="col-md-2 control-label">잔금</label>
							<div class="col-md-4">

								<input class="form-control" type="number"
									id="expressDepartureFloor" name="expressDepartureFloor" />
							</div>
						</div>
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
