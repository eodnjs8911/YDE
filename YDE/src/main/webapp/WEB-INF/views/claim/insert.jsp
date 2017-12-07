<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
col-md-2

<form class="form-horizontal">
	<div>
	<img src="C:\Users\User\Desktop">
	</div>
  <div class="form-group">
    <label for="inputEmail1" class="col-md-1 col-xs-6 control-label">고객명</label>
    <div class="col-sm-5">
      <input type="email" class="form-control" id="customer" placeholder="고객명">
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail2" class="col-md-1 control-label">연락처</label>
    <div class="col-md-2 col-xs-3">
      <input type="email" class="form-control" id="inputPhone1" placeholder="010">
    </div>
    <div class="col-md-2 col-xs-3">
      <input type="email" class="form-control" id="inputPhone2" placeholder="xxxx">
    </div>
    <div class="col-md-2 col-xs-3">
      <input type="email" class="form-control" id="inputPhone3" placeholder="xxxx">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputEmail3" class="col-md-1 control-label">내용</label>
    <div class="col-md-11 col-xs-12">
      <textarea class="form-control" rows="15"></textarea>
    </div>
  </div>
  <div>
<input type="checkbox" value="">정보제공동의
<input type="checkbox" value="">개인정보제3자제공동의
</div>
<div style="align:center">
<input type="submit" value="불편신고접수" align="center"> 
</div>
</form>

</body>
</html>