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
		<table id="epiloguejqGrid"></table>
		<div id="epiloguejqGridPager"></div>
	</div>
	<div id="tabs-4">
		<div class="wrapper">
		  <div class="box">1</div>
		  <div class="box">2</div>
		  <div class="box">3</div>
		  <div class="box">4</div>
		  <div class="box">5</div>
		  <div class="box">6</div>
		  <div class="box">7</div>
		  <div class="box">8</div>
		  <div class="box">9</div>
		  <div class="box">10</div>
		  <div class="box">11</div>
		  <div class="box">12</div>
		  <div class="box">13</div>
		  <div class="box">14</div>
		  <div class="box">15</div>
		</div>
	</div>
	<div id="tabs-5">
		<table id="noticejqGrid5"></table>
		<div id="noticejqGridPager5"></div>
	</div>
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
	
	/* $('#noticejqGrid').navGrid('#noticejqGridPager',
			// the buttons to appear on the toolbar of the grid
			{
				edit : true,
				add : true,
				del : true,
				refresh : false,
				view : false,
				position : "left",
				cloneToTop : false,
				viewrecords : true
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
	 */
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
					editable : false,
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
	
	$("#tabs").tabs();
});
</script>