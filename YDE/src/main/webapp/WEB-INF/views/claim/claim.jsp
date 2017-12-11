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
			
			
			/* 데이터 못가져옴 */
			
			
			mtype : "GET",
			styleUI : 'Bootstrap',
			datatype : "json",
			colModel : [ {
				label : '불편신고 번호',
				name : 'claimNo',
				key : true,
				width : 75
			}, {
				label : '신고자',
				name : 'claimCustomer',
				width : 150
			}, {
				label : '신고내용',
				name : 'claimContent',
				width : 150
			}, {
				label : '신고날짜',
				name : 'claimWDate',
				width : 150
			}, {
				label : '연락처',
				name : 'claimPhone',
				width : 150
			}, {
				label : '불편신고 처리상태',
				name : 'claimState',
				width : 150
			} ],
			viewrecords : true,
			height : 250,
			rowNum : 10,
			pager : "#claimjqGridPager"
		});
	});
</script>