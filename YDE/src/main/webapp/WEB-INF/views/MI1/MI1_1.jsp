<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<style>

</style>
	<script type="text/javascript">
   function Check(form)

   {
        //체크박스 선택 개수확인 
        var ch = "";
      		
        for(i=0;i<form.MI_checklist.length;i++){
        if (form.MI_checklist[i].checked)
             ch += form.MI_checklist[i].value + "\n";
        }

        alert(ch);
   }

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
	<form>
	<table>
		<thead>
			<tr>
				<th>준비해야할 사항</th>
				<th style="width: 30%; text-align: center;">비고 </th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 이사업체 선정 후 계약</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 이사 할 집 점검 (누수, 냉난방 등 각종 하자 체크)</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 사용하지 않는 물품 정리</td>
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
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 자녀 전학 수속</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 가구/가전 중 버릴 물건 폐기물 스티커 구입</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 전화, 은행, 인터넷, 신용카드, 우편물 등 이전 신청</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 수도료, 전기료, 공과금 및 아파트 관리비 납부, 확인</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 세탁소 등 이용품목 수령 및 확인</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 가구/가전 이전설치 업체 이용 시 사전예약</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 엘리베이터 사용 시 사전예약 (전 후 체크)</td>
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
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 이사할 집 배치도 구상 및 작성</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 가스차단 사전예약(이사 당일 9시)</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 쓰레기 봉투 준비 (50L 1~2개)</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 도시가스, 가스레인지 분리 예약</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 냉장고 및 세탁기 물빼기</td>
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
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 냉장고 음식 분류하여 처리</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 가전제품 A/S 연락</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 은행잔금 확인 및 이체한도 증액</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 이사 당일 사용물품 별도 포장</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 이사업체 통화하여 일정 재확인 및 변동 준비사항 점검</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 고가 귀중품 및 이사 당일 필요제품 별도 보관</td>
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
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 출발지 : 집 청소와 비품 점검</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 출발지 : 가스, 전기, 수도요금 검침 및 정산</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 출발지 : 아파트 관리비 정산</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 출발지 : 이삿짐 반출확인 및 열쇠 반납</td>
				<td></td> 
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 도착지 : 이삿짐 확인 및 이사요금 정산</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 도착지 : 가스, 전기, 수도요금 검침 및 사용량 확인</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 도착지 : 전입 수속 및 전학 수속</td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="MI_checklist"
					name="MI_checklist" value="1"> 도착지 : 임대차 계약서 확정일자</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	
	<input type="button" value="쿠키저장" onclick="Check(this.form);">
	
	</form>
	</div>
</body>
</html>