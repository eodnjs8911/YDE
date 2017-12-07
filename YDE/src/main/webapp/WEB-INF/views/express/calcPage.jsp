<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/yde/resources/daumAddr.js"></script>

<script>
	function priceCalc() {
		var formData = $("#calcForm").serialize();
		console.log(formData);
		$.getJSON('/yde/express/priceCalc.do', formData, function(data) {
			$("#price").val(data.price)
		});
	}
</script>

<div class="col-md-6" style="background-color: blue;"></div>
<div class="col-md-6" style="background-color: orange;">
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
					name="expressDepartureFloor"  min="1" max="50" value="1"/>
			</div>
		</div>

		<div class="form-group">
			<label for="expressArrive" class="col-md-3 control-label">도착지</label>
			<div class="col-md-9">
				<input class="form-control" type="text" id="expressArrive" name="expressArriveAddr1"
					style="cursor: pointer;" onclick="addrDialog(this)"
					placeholder="도착지" readonly>
			</div>
		</div>

		<div class="form-group">
			<label for="arriveSize" class="col-md-3 control-label">평형</label>
			<div class="col-md-3">
				<select class="form-control" id="arriveSize" name="expressArriveSize">
					<option>21</option>
					<option>28</option>
					<option>32</option>
					<option>38</option>
				</select>
			</div>
			<label for="arriveFloor" class="col-md-2 control-label">층수</label>
			<div class="col-md-4">
						<input class="form-control" type="number" id="arriveFloor"
					name="expressArriveFloor"  min="1" max="50" value="1"/>
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
				<input class="btn btn-default" type="button" value="상담 신청">
			</div>
		</div>
	</form>

</div>
