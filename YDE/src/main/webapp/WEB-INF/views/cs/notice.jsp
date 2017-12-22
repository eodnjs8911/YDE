<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/jquery.jqGrid.min.js"></script>
<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/grid.locale-kr.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid/ui.jqgrid-bootstrap.css" />

<%@ include file="menu_CS1.jsp"%>
<div>
	<table id="noticejqGrid"></table>
	<div id="noticejqGridPager"></div>
	<div></div>
</div>

<div id="dialogTemplate">
	<form>
		<div class="form-group">
			<label for="noticeTitle">제목</label> <input type="text"
				class="form-control" id="noticeTitle" name="noticeTitle">
		</div>
		<div class="form-group">
			<label for="noticeContent">내용</label>
			<textarea class="form-control" id="noticeContent"
				name="noticeContent" rows="3"></textarea>
		</div>
		<div class="form-group">
			<div>{sData}</div>
			<div>{cData}</div>
		</div>
	</form>
</div>

<script type="text/javascript">
	$(function() {
		$("#dialogTemplate").hide();
		
		$("#noticejqGrid").jqGrid({
			url : '/yde/cs/notice/selectList.do',
			editurl : '/yde/cs/notice/edit.do',
			datatype : "json",
			styleUI : 'Bootstrap',
			colModel : [ {
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
			}, {
				label : '공지사항',
				name : 'noticeTitle',
				width : 450,
				editable : true
			}, {
				label : '내용',
				name : 'noticeContent',
				width : 450,
				hidden : true,
				editable : true,
				edithidden : false
			}, {
				label : '날짜',
				name : 'noticeWDate',
				width : 120,
				editable : false
			} ],
			viewrecords : true,
			loadonce : true,
			cache : false,
			height : 'auto',
			responsive :true,
			rowNum : 10,
			pager : "#noticejqGridPager",
			sortname : "noticeNo",
			sortorder : "desc",
			subGrid : true,
			subGridRowExpanded : showNoticeContent,
			 subGridOptions : {
					reloadOnExpand :false,
					openicon: "", 
					//selectOnExpand : true 
					},
			onSelectRow : selectRow,
			navOptions: { reloadGridOptions: { fromServer: true } },
					autowidth : true
		});

		var login = "${login}";

		if (login.length > 0) {
			$('#noticejqGrid').jqGrid('navGrid', "#noticejqGridPager", {
			}, {
				template : $("#dialogTemplate").html(),
				closeAfterEdit: true,
				reloadAfterSubmit : true,
				afterComplete : function () {
					$("#noticejqGrid").setGridParam({datatype:'json', page:1}).trigger('reloadGrid');
					}
			}, {
				closeAfterAdd: true, reloadAfterSubmit: true,
				template : $("#dialogTemplate").html()
			});
		}
	});

	function showNoticeContent(parentRowID, parentRowKey) {
		$("#" + parentRowID)
				.text(
						$("#noticejqGrid").jqGrid('getRowData', parentRowKey).noticeContent);

	}

	function selectRow(rowid, status, e) {
		$("#noticejqGrid").toggleSubGridRow(rowid);
	}
</script>