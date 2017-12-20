<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
body {
	margin-top: 30px;
	background-color: #eee;
}

.list-group.help-group {
	margin-bottom: 20px;
	padding-left: 0;
	margin: 0; . faq-list { display : block;
	top: auto;
	margin: 0 0 32px;
	border-radius: 2px;
	border: 1px solid #ddd;
	box-shadow: 0 1px 5px rgba(85, 85, 85, 0.15); . list-group-item {
	position : relative;
	display: block;
	margin: 0;
	padding: 13px 16px;
	background-color: #fff;
	border: 0;
	border-bottom: 1px solid #ddd;
	border-top-left-radius: 2px;
	border-top-right-radius: 2px;
	color: #616161;
	transition: background-color .2s; i .mdi { margin-right : 5px;
	font-size: 18px;
	position: relative;
	top: 2px;
}

&
:hover {
	background-color: #f6f6f6;
}

&
.active {
	background-color: #f6f6f6;
	font-weight: 700;
	color: rgba(0, 0, 0, .87);
}

&
:last-of-type {
	border-bottom-left-radius: 2px;
	border-bottom-right-radius: 2px;
	border-bottom: 0;
}

}
}
}
.tab-content.panels-faq {
	padding: 0;
	border: 0;
}

.panel.panel-help {
	box-shadow: 0 1px 5px rgba(85, 85, 85, 0.15);
	padding-bottom: 0;
	border-radius: 2px;
	overflow: hidden;
	background-color: #fff;
	margin: 0 0 16px; a [href^="#"], a[href^="#"] : hover, a [ href ^= "#"
	]: focus {
    outline : none;
	cursor: pointer;
	text-decoration: none;
}

.panel-heading {
	background-color: #f6f6f6;
	padding: 0 16px;
	line-height: 48px;
	border-top-right-radius: 2px;
	border-top-left-radius: 2px;
	color: rgba(0, 0, 0, .87); h2 { margin : 0;
	padding: 14px 0 14px;
	font-size: 18px;
	font-weight: 400;
	line-height: 20px;
	letter-spacing: 0;
	text-transform: none;
}

}
.panel-body {
	background-color: #fff;
	border-top: 1px solid #ddd;
	border-radius: 2px;
	border-top-right-radius: 0;
	border-top-left-radius: 0;
	margin-top: 0;
	p
	{
	margin
	:
	0
	0
	16px;
	&:
	last-of-type
	{
	margin
	:
	0;
}
}
}
}
</style>

<script>
$(function() {
    // Since there's no list-group/tab integration in Bootstrap
    $('.list-group-item').on('click',function(e){
     	  var previous = $(this).closest(".list-group").children(".active");
     	  previous.removeClass('active'); // previous list-item
     	  $(e.target).addClass('active'); // activated list-item
   	});
});
</script>


</head>
<body>

	<form id="myForm1">

		<div>
			<img src="<c:url value='/'/>resources/images/faq.png" height=188px
				width=100%>
		</div>
		<br/><br/>
		<div class="container">

			<div class="col-md-8">
				<div class="tab-content panels-faq">
					<div class="tab-pane active" id="tab1">
						<div class="panel-group" id="help-accordion-1">
							<div class="panel panel-default panel-help">
								<a href="#opret-produkt" data-toggle="collapse"
									data-parent="#help-accordion-1">
									<div class="panel-heading">
										<h4>이사 잘하는 업체는 어떻게 찾나요?</h4>
									</div>
								</a>
								<div id="opret-produkt" class="collapse in">
									<div class="panel-body">
										<p>
											이사는 서비스 업종입니다. 그렇기에, 직접 경험해본 후 그 경험을 바탕으로 업체를 선정하는 것이 가장 현명한
											방법이라 할 수 있습니다.<br />업체 선정 전에 해당 업체가 과거에 진행했던 이사 서비스 내역과 후기를
											꼼꼼히 찾아보고,<br /> 인지도는 어떠한지 추천할만한 업체인지, A/S는 어떻게 진행했는지 등을 충분히
											파악한 후에 계약하는 것이 좋겠습니다.
										</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default panel-help">
								<a href="#rediger-produkt" data-toggle="collapse"
									data-parent="#help-accordion-1">
									<div class="panel-heading">
										<h4>왜 이사업체마다 이사견적이 다른가요?</h4>
									</div>
								</a>
								<div id="rediger-produkt" class="collapse">
									<div class="panel-body">
										<p>
											이삿짐의 훼손을 방지하고 안전하게 이사를 진행하기 위해서는, 이삿짐을 여유있게 싣는 것이 좋습니다.<br />
											하지만, 이사견적을 저렴히 하려다보면 이삿짐을 빼곡히 싣게 되며 그 과정에서 이삿짐이 파손될 위험성이 높아지게
											됩니다.<br /> 그렇기 때문에, 이삿짐이 파손되지 않도록 안전하게 운반하는 것을 우선시 여기는 업체에서는
											포장 인력이나 차량을 추가해서라도 <br /> 이삿짐을 여유있게 싣고 보다 안전한 이사 서비스를 제공하고자
											하여 이사견적이 높게 책정되기도 합니다.<br /> 만약 이삿짐 중에 새로 구매한 가구나 고가의 가전제품이
											있다면 이사견적이 비싸더라도 파손에 대한 위험성을 줄여 안전한 이사를 진행하실 것을 권장하며,<br />
											이삿짐 포장·운반 작업 중에 생길 수 있는 작은 상처 등을 감안하신다면 비교적 이사견적이 저렴한 업체를 통해
											이사를 진행해도 나쁘지 않은 선택이라 할 수 있겠습니다.
										</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default panel-help">
								<a href="#ret-pris" data-toggle="collapse"
									data-parent="#help-accordion-1">
									<div class="panel-heading">
										<h4>이사를 할 시 금액은 어떻게 정해지나요?</h4>
									</div>
								</a>
								<div id="ret-pris" class="collapse">
									<div class="panel-body">
										<p>
											이사는 공산품이 아니기 때문에 가격을 바로 책정드리기는 어려움이 많습니다.<br /> 이삿날과 이삿짐의
											종류, 양, 운송거리 등에 따라 비용이 달라지기 때문입니다.<br /> 용달이사 같은경우에는 포장이 아닌
											운송만을 목적으로 하기 때문에 현장팀을 파견하여 포장 및 정리청소를 하는 포장이사와는 비용이 적게 나오게
											됩니다.<br /> 별도로 옵션품목(사다리, 에어컨, 피아노, 분해장 등)이 포함될 때 추가비용도 있어서
											각각의 상황에 따라 변동되게 되므로 견적을 받고 진행하는것이 좋겠습니다.
										</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default panel-help">
								<a href="#slet-produkt" data-toggle="collapse"
									data-parent="#help-accordion-1">
									<div class="panel-heading">
										<h4>이사비용을 저렴하게 이용하실 수 있는 방법</h4>
									</div>
								</a>
								<div id="slet-produkt" class="collapse">
									<div class="panel-body">
										<p>
											1. 필요없는 물건 정리 포장이사 비용은 이삿짐량에 의해 결정됩니다. 최소 1년이상 쓰지 않는 제품들을
											줄이게되면 투입되어야 하는 차량 및 인원이 축소되어 이사비용도 저렴해집니다.<br />
										<hr>
										2. 이사 날짜 정하기 공휴일, 주말, 손없는날 등 이사성수기때는 비용이 평상시보다 상승되기 때문에 1~2달
										정도 미리 예약하시는게 좋습니다.<br />
										<hr>
										3. 방문견적은 선택 아닌 필수 방문견적으로 정확한 가격을 산정해야 이사업체별로 비교가 가능하며, 본인에게 맞는
										이사시스템이나 저렴한 곳으로 선택하는 일이 가능합니다. 전화나 온라인으로 받은 견적으로 생각하고 계시다가 나중에
										추가비용을 요구하는 업체도 간혹 있기때문에 항상 꼼꼼하게 확인하셔야 합니다.
										</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default panel-help">
								<a href="#opret-kampagne" data-toggle="collapse"
									data-parent="#help-accordion-1">
									<div class="panel-heading">
										<h4>포장이사 계약서 작성을 확실하게 하는 방법</h4>
									</div>
								</a>
								<div id="opret-kampagne" class="collapse">
									<div class="panel-body">
										<p>
											1. 사업자번호, 대표자, 주소 확인하기<br /> 관허등록번호나 대표자, 주소 등의 인적사항들을 꼼꼼하게
											살펴보아야 합니다.<br /> 계약서 뒷면에 있는 표준약관을 확인해 이사할 때 문제가 발생했다면, 계약서대로
											진행하도록 합니다.<br /> <br /> 2. 방문견적시 담당직원 이름, 연락처 알아두기<br />
											견적을 작성했던 직원 연락처와 이름을 알아두면 이사 당일, 현장 직원과의 의견충돌시 확실히 의견을 밝힐 수
											있습니다.<br /> 계약서를 근거로 견적 담당자와 문제를 해결 할 수 있습니다.<br /> <br />
											3. 이삿날과 세부 짐의 수량 상세히 기재하기<br /> 견적일과 운반일을 자세하게 기재하면 문제가 생겼을
											때 피해보상을 제대로 요청 할 수 있습니다.<br /> 말로만 이야기 하면 나중에 문제가 생겼을 경우
											증명하게 힘들기 때문에 계약서에 모든 사항을 기재하는 것이 바람직합니다.<br /> <br /> 4. 옵션
											비용 확인<br /> 이사할 때 에어컨이나 TV벽걸이 설치 등과 사다리차나 물품가격에 따라 비용이 달라지기
											때문에 옵션 비용을 추가할 수 있습니다.<br /> 이 부분에 대해서도 계약서에 정확하게 기재하면 나중에
											옵션 비용에 대한 추가 사항없이 이사할 수 있습니다.
										</p>
									</div>
								</div>
							</div>

							<div class="panel panel-default panel-help">
								<a href="#faq6" data-toggle="collapse"
									data-parent="#help-accordion-1">
									<div class="panel-heading">
										<h4>견적을 의뢰하게 되면 꼭 계약을 해야 하나요?</h4>
									</div>
								</a>
								<div id="faq6" class="collapse">
									<div class="panel-body">
										<p>
											견적을 받아보신다고 바로 계약여부를 결정하게 하는것이 아닙니다.<br /> 저희 이사스토리가 계약을 할시
											금액을 책정하게 되는 것이므로 여러가지 따져보신 후에 차후에 계약을 진행하셔도 되겠습니다.
										</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default panel-help">
								<a href="#faq7" data-toggle="collapse"
									data-parent="#help-accordion-1">
									<div class="panel-heading">
										<h4>손 없는 날은 어떤 날인가요?</h4>
									</div>
								</a>
								<div id="faq7" class="collapse">
									<div class="panel-body">
										<p>
											손 있는 날이란 손해나 손실을 보는 날이며, 악귀나 악신이 움직이는 날을 뜻합니다.<br /> 그리하여
											악귀나 악신이 움직이지 않는 날을 바로 손 없는 날 이라고 하여 각종 택일을 손 없는 날로 정하곤 합니다.<br />
											보통 음력 9, 10일, 19, 20일, 29, 30일이 되면 귀신이 활동을 하지 않는 날이므로 손 없는 날로
											해당 됩니다.
										</p>
									</div>
								</div>
							</div>

							<div class="panel panel-default panel-help">
								<a href="#faq8" data-toggle="collapse"
									data-parent="#help-accordion-1">
									<div class="panel-heading">
										<h4>이사 당일, 준비할 게 있나요?</h4>
									</div>
								</a>
								<div id="faq8" class="collapse">
									<div class="panel-body">
										<p>
											기본적으로 보안이 중요한 서류나 도장, 속옷이나 귀중품 등은 고객님께서 별도로 포장하여 운반하는 것이
											좋습니다.<br /> 아기가 있는 가정이라면, 아기가 하루동안 먹고 입을 것들을 미리 준비하거나 이사 현장
											주변의 커피숍이나 키즈카페 등을 미리 파악 해 두는 것 또한 도움이 됩니다.<br /> 아파트에서 이사를
											진행하는 경우에는 이사 차량의 주차 공간 확보와 엘리베이터 이용을 위해 관리사무소에 사전에 내용을 전달해주어야
											합니다.<br /> 주택에서 이사를 진행한다면 이사 차량이 주차해야할 공간에 평소 주차하는 차량을 파악하여
											미리 연락을 취해 두면 대기하는 시간 없이 원활한 이사 진행이 가능합니다.<br /> 이사 당일에는
											부동산부터 주민센터나 우체국, 가스업체 등 연락할 곳이 많기 때문에 보조배터리 등을 준비하여 휴대전화 전원이
											꺼지지 않도록 해 주시고,<br /> 간단한 간식이나 주전부리를 준비하여 끼니를 거르지 않도록 하는 것이
											좋겠습니다.
										</p>
									</div>
								</div>
							</div>

							<div class="panel panel-default panel-help">
								<a href="#faq9" data-toggle="collapse"
									data-parent="#help-accordion-1">
									<div class="panel-heading">
										<h4>왜 방문견적이 필요한가요? 전화상으로 견적안내를 하지 않나요?</h4>
									</div>
								</a>
								<div id="faq9" class="collapse">
									<div class="panel-body">
										<p>
											YDExpress는 전화견적 안내를 하지 않습니다.<br /> <br /> 이사 당일, 고객님과 이사비용에
											대해 발생할 수 있는 시시비비를 사전에 방지하고자 무료견적을 기본으로 하고 있습니다.<br /> 고객님께
											전화상 자세하게 안내를 해드려도, 실제론 고객님 댁을 방문하여 직접 현장 답사를 하는 것보단 합리적인 견잭을
											낼 수 없는 것이 사실입니다.<br /> 작업조건과 고객님의 이사물품을 해당지점에서 확인하고 작업예정
											스케쥴을 정하는 일 또한 고객님께 견적을 올려드리는 것보단도 더 중요한 업무일 수 있습니다.<br />
											고객님의 소중한 재산을 안전하고 신속하게 옮기고자 하는 이사스토리만의 견적안내 원칙이오니, 불편하시더라도 이점
											널리 양해 부탁드리겠습니다.
										</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default panel-help">
								<a href="#faq10" data-toggle="collapse"
									data-parent="#help-accordion-1">
									<div class="panel-heading">
										<h4>온라인견적서 상의 견적금액과 방문견적시 금액이 차이가 있습니다.</h4>
									</div>
								</a>
								<div id="faq10" class="collapse">
									<div class="panel-body">
										<p>
											방문견적시 금액이 차이가 나는 경우는 몇가지 예가 있습니다.<br /> <br /> 1. 물량을 적게
											등록하신 경우입니다. 특히 잔짐이 과소하게 산출되는 예가 많습니다. 단독주택의 경우 창고,다락 등에 많은
											잔짐이 산적해 있는 경우<br /> 2. 가옥구조를 틀리게 표시하신 경우입니다. 주차공간이 없어 인력으로
											이송하는 거리가 길거나 사다리차 사용이 불가하여 계단으로 작업을 해야 하는 경우<br />

										</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default panel-help">
								<a href="#faq11" data-toggle="collapse"
									data-parent="#help-accordion-1">
									<div class="panel-heading">
										<h4>일반이사와 포장이사의 차이점은 무엇인가요?</h4>
									</div>
								</a>
								<div id="faq11" class="collapse">
									<div class="panel-body">
										<p>
											일반이사와 포장이사의 차이점은 다음과 같습니다.<br /> <br /> 1) 포장이사는 이삿짐의 파손이나
											분실시 보상을 받을수가 있습니다.<br /> 2) 일반이사는 고객님께서 직접 포장을 하실수가 있고 비용이
											저렴합니다.<br /> 3) 포장이사는 포장에서부터 운반, 정리, 청소까지 가능합니다.<br /> 4)
											일반이사는 짐이 별로 없고 비용보다 시간적 여유가 많을때 이용하시면 좋고<br /> 포장이사는 짐이 많다거나
											시간적 여유가 금전적 여유에 비해 부족할 경우 이용하면 좋습니다.
										</p>
									</div>
								</div>
							</div>
							<div class="panel panel-default panel-help">
								<a href="#faq12" data-toggle="collapse"
									data-parent="#help-accordion-1">
									<div class="panel-heading">
										<h4>이삿짐 분실에 대한 피해 예방법</h4>
									</div>
								</a>
								<div id="faq12" class="collapse">
									<div class="panel-body">
										<p>
											분실피해를 예방하고 또한 이로 인한 불필요한 정신적 소요를 에방하기 위해서는 우선 계약당시 계약서를 작성하고<br />
											물품 내역을 자세하게 서면으로 작성하여 이사당일 작업전 그리고 이사작업이 완료된 후 이사업체와 소비자간 확인을
											하는 것이 좋습니다.<br /> 이런 경우는 이삿짐이 일부 분실됐다고 해도 사실을 확인 할 수 있으므로 이사
											업체에 책임을 물을 수 있습니다.<br /> 또한 이사 당일 분실된 것을 확인했을 경우에는 반드시
											이사업체로부터 A/S확인서를 작성받으셔야 합니다.
										</p>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="tab-pane" id="tab2">
						<div class="panel-group" id="help-accordion-2">
							<div class="panel panel-default panel-help">
								<a href="#help-three" data-toggle="collapse"
									data-parent="#help-accordion-2">
									<div class="panel-heading">
										<h2>Lorem ipsum?</h2>
									</div>
								</a>
								<div id="help-three" class="collapse in">
									<div class="panel-body">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Doloribus nesciunt ut officiis accusantium quisquam
											minima praesentium, beatae fugit illo nobis fugiat adipisci
											quia distinctio repellat culpa saepe, optio aperiam est!</p>
										<p>
											<strong>Example: </strong>Facere, id excepturi iusto aliquid
											beatae delectus nemo enim, ad saepe nam et.
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</form>







</body>
</html>