<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- The link to the CSS that the grid needs -->
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid/ui.jqgrid.css" />
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- This is the Javascript file of jqGrid -->
<script type="text/ecmascript" src="${pageContext.request.contextPath}/resources/jqgrid/jquery.jqGrid.min.js"></script>
<!-- This is the localization file of the grid controlling messages, labels, etc.
    <!-- We support more than 40 localizations -->
<script type="text/ecmascript" src="${pageContext.request.contextPath}/resources/jqgrid/grid.locale-kr.js"></script>
<div id="tabs">
        <ul>
			<li><a href="#tabs-1">공지사항</a></li>
			<li><a href="#tabs-2">자주묻는 질문</a></li>
			<li><a href="#tabs-3">후기</a></li>
			<li><a href="#tabs-4">현장갤러리</a></li>
			<li><a href="#tabs-5">불편신고</a></li>
		</ul>
	<div id="tabs-1">
		<table id="noticejqGrid"></table>
		<div id="noticejqGridPager"></div>
	</div>
	<div id="tabs-2">
		<table id="noticejqGrid2"></table>
		<div id="noticejqGridPager2"></div>
	</div>
	<div id="tabs-3">
		<table id="noticejqGrid3"></table>
		<div id="noticejqGridPager3"></div>
	</div>
	<div id="tabs-4">
		<table id="noticejqGrid4"></table>
		<div id="noticejqGridPager4"></div>
	</div>
	<div id="tabs-5">
		<table id="noticejqGrid5"></table>
		<div id="noticejqGridPager5"></div>
	</div>
</div>
<script type="text/javascript">

$(function() {
	
	$("#noticejqGrid").jqGrid({
		url : '/cs/notice/selectList.do',
		editurl : '/cs/notice/edit.do',
		datatype : "json",
		colModel : [
			{
				label : 'noticeNo',
				name : 'noticeNo',
				key : true,
				width : 55,
				editable : false,
				editrules : {
					required : true
				}
			},
			{
				label : 'noticeContent',
				name : 'noticeContent',
				width : 450,
				editable : true,
			},
			{
				label : 'noticeWDate',
				name : 'noticeWDate',
				width : 75,
				editable : false,
				
			}
		],
		viewrecords : true,
		width : 900,
		height : 550,
		rowNum : 10,
		pager : "#noticejqGridPager",
		sortname: "noticeNo",
		sortorder: "asc"
	});
	
	$('#noticejqGrid').navGrid('#noticejqGridPager',
			// the buttons to appear on the toolbar of the grid
			{
				edit : false,
				add : false,
				del : false,
				refresh : false,
				view : false,
				position : "left",
				cloneToTop : false
			},
			// options for the Edit Dialog
			{
				editCaption : "The Edit Dialog",
				recreateForm : true,
				//checkOnUpdate : true,
				//checkOnSubmit : true,
				beforeSubmit : function(postdata, form, oper) {
					if (confirm('Are you sure you want to update this row?')) {
						// do something
						return [ true, '' ];
					} else {
						return [ false, 'You can not submit!' ];
					}
				},
				closeAfterEdit : true,
				errorTextFormat : function(data) {
					return 'Error: ' + data.responseText
				}
			},
			// options for the Add Dialog
			{
				closeAfterAdd : true,
				recreateForm : true,
				errorTextFormat : function(data) {
					return 'Error: ' + data.responseText
				}
			},
			// options for the Delete Dailog
			{
				errorTextFormat : function(data) {
					return 'Error: ' + data.responseText
				}
			});
		

	$("#tabs").tabs();
});
</script>