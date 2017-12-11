<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/ecmascript" src="/yde/resources/jquery.jqGrid.min.js"></script>
<script type="text/ecmascript" src="/yde/resources/grid.locale-kr.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="/yde/resources/ui.jqgrid.css" />
<!-- http://localhost/yde/go.do?go=claim/claim -->
<div>
	<table id="claimjqGrid"></table>
	<div id="claimjqGridPager"></div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$("#claimjqGrid").jqGrid({
			url : '/yde/claim/selectList2.do',
			
			/* http://localhost/yde/go.do?go=claim/selectListTest */
			/* 데이터 못가져옴 */
			
			
			mtype : "GET",
			styleUI : 'Bootstrap',
			datatype : "json",
			colNames: ['체크','불편신고번호','신고자','신고내용','연락처','날짜','처리상태'],
			colModel : [
				{name:'check1', formatter:'checkbox', formatoptions: { value:"yes:no" }, editable:true, edittype:'checkbox', editoptions: { value:"yes:no" }},
				{name:'claimNo'},{name:'claimCustomer'},{name:'claimContent'},
				{name:'claimPhone'},{name:'claimWDate'},{name:'claimState'}
			],
			viewrecords : true,
			height : 250,
			rowNum : 10,
			pager : "#claimjqGridPager"
			
		});
	});
</script>