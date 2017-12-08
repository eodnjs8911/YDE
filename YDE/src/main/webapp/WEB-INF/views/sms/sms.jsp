<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/ecmascript" src="/yde/resources/jquery.jqGrid.min.js"></script>
<script type="text/ecmascript" src="/yde/resources/grid.locale-kr.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="/yde/resources/ui.jqgrid.css" />

<div>
	<table id="smsjqGrid"></table>
	<div id="smsjqGridPager"></div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$("#smsjqGrid").jqGrid({
			url : '/yde/sms/selectList.do',
			mtype : "GET",
			styleUI : 'Bootstrap',
			datatype : "json",
			colModel : [ {
				label : 'smsNo',
				name : 'smsNo',
				key : true,
				width : 75
			}, {
				label : 'smsContent',
				name : 'smsContent',
				width : 150
			}, {
				label : 'smsSendAddr',
				name : 'smsSendAddr',
				width : 150
			}, {
				label : 'smsReceiveAddr',
				name : 'smsReceiveAddr',
				width : 150
			}, {
				label : 'smsSDate',
				name : 'smsSDate',
				width : 150
			}, {
				label : 'smsRsDate',
				name : 'smsRsDate',
				width : 150
			}, {
				label : 'smsState',
				name : 'smsState',
				width : 150
			}, {
				label : 'express_no',
				name : 'express_no',
				width : 150
			} ],
			viewrecords : true,
			height : 250,
			rowNum : 10,
			pager : "#smsjqGridPager"
		});
	});
</script>
