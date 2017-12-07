<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-md-6" style="background-color: blue;"></div>
<div class="col-md-6" style="background-color: orange;">
	<form class="form-horizontal">
		<div class="form-group">
			<label for="expressCategory" class="col-md-3 control-label">이사종류</label>
			<div class="col-md-9">
				<select class="form-control" id="expressCategory">
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
				<input type="date" class="form-control" id="expressDate">
			</div>
		</div>

		<div class="form-group">
			<label for="expresDeparture" class="col-md-3 control-label">출발지</label>
			<div class="col-md-9">
				<input type="password" class="form-control" id="expresDeparture"
					placeholder="Password">
			</div>
		</div>

		<div class="form-group">
			<label for="expresArrive" class="col-md-3 control-label">도착지</label>
			<div class="col-md-9">
				<input type="password" class="form-control" id="expresArrive"
					placeholder="Password">
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
			<label for="inputPassword3" class="col-md-3 control-label">예상가격</label>
			<div class="col-md-6">
				<input type="password" class="form-control" id="inputPassword3"
					placeholder="Password">
			</div>
			<div class="col-md-3">
				<input class="btn btn-default" type="button" value="계산">
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-offset-3 col-md-6">
				<input class="btn btn-default" type="button" value="상담 신청">
			</div>
		</div>
	</form>

</div>
