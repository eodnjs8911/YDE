<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/jquery.jqGrid.min.js"></script>
<script type="text/ecmascript" src="${pageContext.request.contextPath}/resources/jqgrid/grid.locale-kr.js"></script>
 <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/jqgrid/ui.jqgrid-bootstrap.css" />

${pageContext.request.contextPath}
	<div>
		<table id="noticejqGrid"></table>
		<div id="noticejqGridPager"></div>
	</div>
<script type="text/javascript">
	$(document).ready(function() {

		$("#noticejqGrid").jqGrid({
			url : '/cs/notice/selectList.do',
			editurl : '/cs/notice/edit.do',
			mtype : "GET",
			styleUI : 'Bootstrap',
			datatype : "json",
			colModel : [ {
				label : 'noticeNo',
				name : 'noticeNo',
				key : true,
				width : 40,
				sorttype : 'integer',
				searchoptions : {
					sopt : [ "eq" ]
				}
			}, {
				label : 'noticeContent',
				name : 'noticeContent',
				width : 450,
				editable : true,
				edittype:"textarea", 
				editoptions:{rows:"4",cols:"60"},
				searchoptions : {
					sopt : [ "cn" ]
				}
			}],
			viewrecords : true,
			loadonce : true,
			onSelectRow : editRow,
			rowNum : 10,
			height : 800,
			pager : "#noticejqGridPager"
			
			$("#tabs").tabs();
		});

		$('#noticejqGrid').jqGrid('filterToolbar', {
			// JSON stringify all data from search, including search toolbar operators
			stringResult : true,
			// instuct the grid toolbar to show the search options
			searchOperators : true
		});

		$('#noticejqGrid').jqGrid('navGrid', "#noticejqGridPager", {
			search : false, // show search button on the toolbar
            edit: false, 
            add: false, 
            del: true, 
            cancel: true,
            addParams: {
                keys: true
            },
			refresh : true
		});
		var lastSelection;

		function editRow(id) {
			if (id && id !== lastSelection) {
				var grid = $("#noticejqGrid");
				grid.jqGrid('restoreRow', lastSelection);
				grid.jqGrid('editRow', id, {
					keys : true,
					focusField : 4
				});
				lastSelection = id;
			}
		}
	});
</script>