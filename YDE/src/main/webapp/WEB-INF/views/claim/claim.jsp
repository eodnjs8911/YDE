<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/ecmascript" src="/yde/resources/jquery.jqGrid.min.js"></script>
<script type="text/ecmascript" src="/yde/resources/grid.locale-kr.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="/yde/resources/ui.jqgrid.css" />

<div>
	<table id="claimjqGrid"></table>
	<div id="claimjqGridPager"></div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$("#claimjqGrid").jqGrid({
			url : '/yde/claim/selectList2.do',
			mtype : "GET",
			styleUI : 'Bootstrap',
			datatype : "json",
			colModel : [ {
				label : 'smsNo',
				name : 'claimNo',
				key : true,
				width : 75
			}, {
				label : 'smsSendAddr',
				name : 'claimCustomer',
				width : 150
			}, {
				label : 'smsReceiveAddr',
				name : 'claimContent',
				width : 150
			}, {
				label : 'smsSDate',
				name : 'claimWDate',
				width : 150
			}, {
				label : 'smsRsDate',
				name : 'claimPhone',
				width : 150
			}, {
				label : 'smsState',
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