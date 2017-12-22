<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<style type="text/css">
#saveButton {
	border: none;
	padding: 14px 50px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	/* 	margin: 0.5px 2px; */
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

#saveButton {
	background-color: #1BB1EC;
	color: white;
	/* border: 2px solid #1BB1EC; */
}

#saveButton:hover {
	background-color: white;
	color: #555;
	
}
</style>
<script type="text/javascript">
   $(function(){
	   var loadcookie = $.cookie('beforeck');
	   loadcookie= JSON.parse(loadcookie);
	   $('[name="MI_checklist"]').val(loadcookie);
		
	   //저장버튼 클릭 
		$("#saveButton").click(function(){ 
			//입력값 
	    	var arr = [];
			//체크되어있다면 쿠키 저장
	     if($("#agree").is(":checked")){
	        for(i=0;i<frm.MI_checklist.length;i++){
				if (frm.MI_checklist[i].checked)
					arr.push(frm.MI_checklist[i].value);
	        }
			var cookie_value = JSON.stringify(arr); 
			//1번째 parameter = 쿠키명 
			// 2번째 parameter = 저장하고자 하는 쿠키값 
			$.cookie('beforeck', cookie_value);
			alert("저장되었습니다.");
	     }
	     else
	    	 alert("약관 동의에 체크하지 않았습니다.");
		}); 
	})
</script>
	
</head>
<body>
	<%@ include file="menu_MI1.jsp"%>
	<br />
	<img
		src="${pageContext.request.contextPath}/resources/images/MI1_1.png"
		width="100%">
	<div id="checklist">
	<div class="check_title">이사일 확정</div>
	<form name="frm">
	<table>
		<thead>
			<tr>
				<th>준비해야할 사항</th>
				<th style="width: 30%; text-align: center;">비고 </th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox" id="MI_checklist27"
					name="MI_checklist" value="27"> 이사업체 선정 후 계약</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist28"
					name="MI_checklist" value="28"> 이사 할 집 점검 (누수, 냉난방 등 각종 하자 체크)</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist29"
					name="MI_checklist" value="29"> 사용하지 않는 물품 정리</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<br/>
	
	<div class="check_title">이사 1주 전</div>
	<table>
		<thead>
			<tr>
				<th>준비해야할 사항</th>
				<th style="width: 30%; text-align: center;">비고 </th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox" id="MI_checklist1"
					name="MI_checklist" value="1"> 자녀 전학 수속</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist2"
					name="MI_checklist" value="2"> 가구/가전 중 버릴 물건 폐기물 스티커 구입</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist3"
					name="MI_checklist" value="3"> 전화, 은행, 인터넷, 신용카드, 우편물 등 이전 신청</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist4"
					name="MI_checklist" value="4"> 수도료, 전기료, 공과금 및 아파트 관리비 납부, 확인</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist5"
					name="MI_checklist" value="5"> 세탁소 등 이용품목 수령 및 확인</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist6"
					name="MI_checklist" value="6"> 가구/가전 이전설치 업체 이용 시 사전예약</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist7"
					name="MI_checklist" value="7"> 엘리베이터 사용 시 사전예약 (전 후 체크)</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<br/>
	
	<div class="check_title">이사 3일 전</div>
	<table>
		<thead>
			<tr>
				<th>준비해야할 사항</th>
				<th style="width: 30%; text-align: center;">비고 </th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox" id="MI_checklist8"
					name="MI_checklist" value="8"> 이사할 집 배치도 구상 및 작성</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist9"
					name="MI_checklist" value="9"> 가스차단 사전예약(이사 당일 9시)</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist10"
					name="MI_checklist" value="10"> 쓰레기 봉투 준비 (50L 1~2개)</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist11"
					name="MI_checklist" value="11"> 도시가스, 가스레인지 분리 예약</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist12"
					name="MI_checklist" value="12"> 냉장고 및 세탁기 물빼기</td>
				<td></td> 
			</tr>
		</tbody>
	</table>
	<br/>	
	
	<div class="check_title">이사 전 날</div>
	<table>
		<thead>
			<tr>
				<th>준비해야할 사항</th>
				<th style="width: 30%; text-align: center;">비고 </th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox" id="MI_checklist13"
					name="MI_checklist" value="13"> 냉장고 음식 분류하여 처리</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist14"
					name="MI_checklist" value="14"> 가전제품 A/S 연락</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist15"
					name="MI_checklist" value="15"> 은행잔금 확인 및 이체한도 증액</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist16"
					name="MI_checklist" value="16"> 이사 당일 사용물품 별도 포장</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist17"
					name="MI_checklist" value="17"> 이사업체 통화하여 일정 재확인 및 변동 준비사항 점검</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist18"
					name="MI_checklist" value="18"> 고가 귀중품 및 이사 당일 필요제품 별도 보관</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<br/>
	
	<div class="check_title">이사 당일</div>
	<table>
		<thead>
			<tr>
				<th>준비해야할 사항</th>
				<th style="width: 30%; text-align: center;">비고 </th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox" id="MI_checklist19"
					name="MI_checklist" value="19"> 출발지 : 집 청소와 비품 점검</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist20"
					name="MI_checklist" value="20"> 출발지 : 가스, 전기, 수도요금 검침 및 정산</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist21"
					name="MI_checklist" value="21"> 출발지 : 아파트 관리비 정산</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist22"
					name="MI_checklist" value="22"> 출발지 : 이삿짐 반출확인 및 열쇠 반납</td>
				<td></td> 
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist23"
					name="MI_checklist" value="23"> 도착지 : 이삿짐 확인 및 이사요금 정산</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist24"
					name="MI_checklist" value="24"> 도착지 : 가스, 전기, 수도요금 검침 및 사용량 확인</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist25"
					name="MI_checklist" value="25"> 도착지 : 전입 수속 및 전학 수속</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist26"
					name="MI_checklist" value="26"> 도착지 : 임대차 계약서 확정일자</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<div align="center">
	<br/>
	<h6><b>쿠키와 관련된 귀하의 선택</b><br/>
	<input type="checkbox" id="agree" value="agree">
	쿠키 저장에 동의하며, 이 페이지를 사용할 때 자동으로 활성화됩니다.</h6>
	<input type="button" value="쿠키저장" id="saveButton">
	</div>
	</form>
	</div>
<script>

</script>
</body>
</html>