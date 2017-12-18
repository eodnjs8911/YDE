<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" media="screen"
	href="/yde/resources/jqgrid/ui.jqgrid.css" />
	
<!-- jquery ui -->	
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<script type="text/ecmascript" src="/yde/resources/jqgrid/jquery.jqGrid.min.js"></script>
<script type="text/ecmascript" src="/yde/resources/jqgrid/grid.locale-kr.js"></script>

<!-- http://localhost/yde/go.do?go=claim/claim -->
<div>
	<form>  <!-- 171212 하다 맘 -->
	<input id="claimNo" type="text" name="번호" value="번호" />
	<input id="claimContent" type="text" name="내용" value="내용" />
	<input id="claimWDate" type="calender" name="날짜" value="날짜" />
	<input id="claimCustomer" type="text" name="이름" value="이름" />
	<input id="claimPhone" type="text" name="연락처" value="연락처" />
	<input id="claimState" type="radio" name="전체" value="전체" />
	<input id="claimState" type="radio" name="미처리" value="미처리" />
	<input id="claimState" type="radio" name="처리완료" value="처리완료" />
	<input id="" type="button" name="" value=""/>
	</form>
	<table id="claimjqGrid"></table>
	<div id="claimjqGridPager"></div>
</div>

<a href="javascript:void(0)" id="m1">Get Selected id's</a>
<a href="javascript:void(0)" id="m1s">Select(Unselect) row 13</a>

<script type="text/javascript">
jQuery("#claimjqGrid").jqGrid({
   	url:'/yde/claim/selectList2.do?claimState=1',
	datatype: "json",
   	colNames:['불편신고번호','신고자','신고내용','연락처','날짜','처리상태'],
   	colModel:[
		{name:'claimNo'},{name:'claimCustomer'},{name:'claimContent'},
		{name:'claimPhone'},{name:'claimWDate'},{name:'claimState'}
	],
   	rowNum:10,
   	rowList:[10,20,30],
   	pager: '#claimjqGridPager',
   	sortname: 'id',
	recordpos: 'left',
    viewrecords: true,
    sortorder: "desc",
	multiselect: true,
	caption: "불편신고 조회"
});
jQuery("#claimjqGrid").jqGrid('navGrid','#claimjqGridPager',{add:false,del:true,edit:true,search:true,refresh:true,position:'right'});
jQuery("#m1").click( function() {
	var s;
	s = jQuery("#claimjqGrid").jqGrid('getGridParam','selarrrow');
	alert(s);
});
jQuery("#m1s").click( function() {
	jQuery("#claimjqGrid").jqGrid('setSelection',"13");
});
</script>

<script>
function Search() {

	//선택 된 로우 초기화

	rowData = null;

	

	//그리드 클리어

	$("#claimjqGrid").jqGrid("clearGridData", true);

	//form 클리어	

	

	//데이터 호출

	$("#claimjqGrid").jqGrid('setGridParam', {

		url : $("/yde/claim/selectList2.do").val()+"/contact/getList.do", //데이터를 받아오는 주소 위치

		datatype : 'json', //그리드에 매칭될 수 있는 반환 타입

		mtype : 'post', //ajax 호출방법

		postData : $("#SerachFrm").serialize(),//검색조건 폼

		success : function(data) {alert(data);}//조건 폼값 전송

	}).trigger('reloadGrid'); //호출 완료 후 리로드

}
</script>
