<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js">
</script>

<script>
	window.onload = function() {

		var f = document.getElementById("myForm")
		f.onsubmit = function() {

			var strName = document.getElementById("claimCustomer");

			if (strName.value.length > 0) {
				return true;
			} else {
				var nameSpan = document.getElementById("nameSpan");
				nameSpan.innerHTML = "성명은 null일 수 없습니다."
				nameSpan.style.color = 'red';
			}
			return false;
		}
	}
</script>

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script
	src="http://vincentlamanna.com/BootstrapFormHelpers/assets/js/bootstrap.js"></script>
<script
	src="http://vincentlamanna.com/BootstrapFormHelpers/assets/js/bootstrap-formhelpers-phone.format.js"></script>
<script
	src="http://vincentlamanna.com/BootstrapFormHelpers/assets/js/bootstrap-formhelpers-phone.js"></script>

	<script>
		function onlyNumber(event){
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
				return;
			else
				return false;
		}
		function removeChar(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
				return;
			else
				event.target.value = event.target.value.replace(/[^0-9]/g, "");
		}
	</script>

</head>
<body>

<!-- http://localhost/yde/cs/insert.do -->

	<form class="form-horizontal" id="myForm" action="insert.do"
		method="post">
		<div>
			<img src="${pageContext.request.contextPath}/resources/images/claim.png" width=100%>
		</div>
		<br />
		<div class="form-group">
			<label for="inputName" class="col-md-2 col-xs-2 control-label">성명</label>
			<div class="col-md-5 col-xs-6">
				<input type="text" class="form-control" id="claimCustomer"
					name="claimCustomer" placeholder="성명"> <span id="nameSpan"></span>
			</div>
		</div>
		<div class="form-group">
			<label for="inputPhone" class="col-md-2 col-xs-2 control-label">연락처</label>
			<div class="col-md-8 col-xs-6">
				<input type="tel" class="form-control" id="claimPhone"
					name="claimPhone" minlength="10" maxlength="11" 
					onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'
					placeholder="(-)없이 입력해주십시오" width="1000px" required>
					<span id="keyinfo"></span>
			</div>

		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-md-2 control-label">내용</label>
			<div class="col-md-9 col-xs-12">
				<textarea class="form-control" name="claimContent" rows="15"
					required placeholder="내용"></textarea>
			</div>
		</div>
		<div style="margin-left:17%">
			<label class="checkbox-inline"><input type="checkbox" class="checkbox-inline" value="정보제공동의" required>정보제공동의</label> &nbsp;&nbsp;&nbsp;
			<label class="checkbox-inline"><input type="checkbox" class="checkbox-inline" value="개인정보제3자제공동의" required>개인정보제3자제공동의</label>
		</div>
		<br/>
		<div style="align:center; margin-left : 17%">
			<input type="submit" value="불편신고접수" align="center" required>
			<!-- submit시 db 입력되도록  -->
		</div>
		<br/>
	</form>
</body>
</html>