<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- The link to the CSS that the grid needs -->
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/gallery.css" />
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- This is the Javascript file of jqGrid -->
<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/jquery.jqGrid.min.js"></script>
<!-- This is the localization file of the grid controlling messages, labels, etc.
    <!-- We support more than 40 localizations -->
<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/grid.locale-kr.js"></script>

<%@ include file="menu_CS1.jsp"%>
<div>
	<table id="noticejqGrid"></table>
	<div id="noticejqGridPager"></div>
</div>

<script type="text/javascript">

$(function() {
	$("#noticejqGrid").jqGrid({
		url : '/yde/cs/notice/selectList.do',
		editurl : '/yde/cs/notice/edit.do',
		datatype : "json",
		colModel : [
			{
				label : '공지번호',
				name : 'noticeNo',
				key : true,
				width : 55,
				editable : false,
				readonly : true,
				sorttype : 'integer'
				/* editrules : {
					readonly : readonly
				} */
			},
			{
				label : '공지내용',
				name : 'noticeContent',
				width : 450,
				editable : true,
			},
			{
				label : '공지날짜',
				name : 'noticeWDate',
				width : 75,
				editable : false,
				
			}
		],
		viewrecords : true,
		loadonce : true,
		width : 900,
		height : 550,
		rowNum : 5,
		pager : "#noticejqGridPager",
		sortname: "noticeNo",
		sortorder: "asc"
	});
	
	$('#noticejqGrid').jqGrid('navGrid', "#noticejqGridPager", {
			search : false, // show search button on the toolbar
			edit : false,
			add : false,
			del : true,
			cancel : true,
			addParams : {
				keys : true
			},
			refresh : true
		});

	$('#noticejqGrid').inlineNav('#noticejqGridPager',
		// the buttons to appear on the toolbar of the grid
		{
			edit : true,
			add : true,
			del : true,
			cancel : true,
			editParams : {
				keys : true,
			},
			addParams : {
				keys : true
			}
		}
	);

});
</script>