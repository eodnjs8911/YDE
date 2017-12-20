<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<script type="text/ecmascript" src="${pageContext.request.contextPath}/resources/jqgrid/jquery.jqGrid.min.js"></script>
<!-- This is the localization file of the grid controlling messages, labels, etc.
    <!-- We support more than 40 localizations -->
<script type="text/ecmascript" src="${pageContext.request.contextPath}/resources/jqgrid/grid.locale-kr.js"></script>

<div id="tabs-3">
	<table id="epiloguejqGrid"></table>
	<div id="epiloguejqGridPager"></div>
</div>

<script type="text/javascript">

$(function() {
	
$("#epiloguejqGrid").jqGrid({
		url : '/yde/cs/epilogue/selectList.do',
		editurl : '/yde/cs/epilogue/edit.do',
		datatype : "json",
		colModel : [
			{
				label : '후기번호',
				name : 'epilogueNo',
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
				label : '작성자',
				name : 'epilogueWriter',
				width : 55,
				editable : true,
			},
			{
				label : '비밀번호',
				name : 'epiloguePw',
				width : 55,
				editable : false,
				hidden:true
			},
			{
				label : '후기',
				name : 'epilogueContent',
				width : 450,
				editable : true,
			},
			{
				label : '작성일',
				name : 'epilogueWDate',
				width : 75,
				editable : false,
				
			}
		],
		viewrecords : true,
		loadonce : true,
		width : 900,
		height : 550,
		rowNum : 5,
		pager : "#epiloguejqGridPager",
		sortname: "epilogueNo",
		sortorder: "asc"
	});
	
	$('#epiloguejqGrid').jqGrid('navGrid', "#epiloguejqGridPager", {
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

		$('#epiloguejqGrid').inlineNav('#epiloguejqGridPager',
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
		});

});
</script>