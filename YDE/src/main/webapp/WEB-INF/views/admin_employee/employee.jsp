<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/jquery.jqGrid.min.js"></script>
<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/grid.locale-kr.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid/ui.jqgrid-bootstrap.css" />


<div>
	<table id="employeejqGrid"></table>
	<div id="employeejqGridPager"></div>
</div>

<div id="dialogTemplate">
	<form>
		<div class="form-group">
			<label for="employeeName">이름</label> <input type="text"
				class="form-control" id="employeeName" name="employeeName">
		</div>
		<div class="form-group">
			<label for="employeePosition">직위</label>
			 <select class="form-control" id="employeePosition"
				name="employeePosition">
				<option value="1">사장</option>
				<option value="2">팀장</option>
				<option value="3">팀원</option>
			</select>
		</div>
		<div class="form-group">
			<label for="employeePhone">전화번호</label> <input type="text"
				class="form-control" id="employeePhone" name="employeePhone">
		</div>
		<div class="form-group">
			<div align="right">{sData}{cData}</div>
		</div>
	</form>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$("#dialogTemplate").hide();

		$("#employeejqGrid").jqGrid({
			url : '/yde/employee/selectList.do',
			editurl : '/yde/employee/edit.do',
			mtype : "GET",
			styleUI : 'Bootstrap',
			datatype : "json",
			colModel : [ {
				label : '사번',
				name : 'employeeNo',
				key : true,
				editable : false,
				width : 120,
				sorttype : 'integer',
				searchoptions : {
					sopt : [ "eq" ]
				}
			}, {
				label : '이름',
				name : 'employeeName',
				width : 120,
				editable : true,
				edittype : "text",
				editoptions : {
					rows : "cn"
				},

			}, {
				label : '직위',
				name : 'employeePosition',
				width : 120,
				editable : true,
				formatter : 'select',
				edittype : "select",
				editoptions : {
					value : "1:사장;2:팀장;3:사원"
				},
				stype : "select",
				searchoptions : {
					value : ":[All];1:사장;2:팀장;3:사원"
				}
			}, {
				label : '전화번호',
				name : 'employeePhone',
				width : 240,
				editable : true,
				searchoptions : {
					sopt : [ "cn" ]
				}
			} ],

			viewrecords : true,
			loadonce : true,
			//onSelectRow : editRow,
			rowNum : 10,
			height : 'auto',
			autowidth : true,
			responsive : true,
			multiselect : true,
			pager : "#employeejqGridPager"
		});


		$('#employeejqGrid').jqGrid('filterToolbar', {
			// JSON stringify all data from search, including search toolbar operators
			stringResult : true,
			// instuct the grid toolbar to show the search options
			searchOperators : true
		});

		$('#employeejqGrid').jqGrid('navGrid', "#employeejqGridPager", {
			search : false, // show search button on the toolbar
			edit : false,
			add : true,
			del : true,
			cancel : true,
			refresh : true
		}, {}, {
			closeAfterAdd : true,
			reloadAfterSubmit : true,
			template : $("#dialogTemplate").html(),
			afterComplete : function() {
				$("#employeejqGrid").setGridParam({
					datatype : 'json',
					page : 1
				}).trigger('reloadGrid');
			}
		});

		$('#employeejqGrid').inlineNav('#employeejqGridPager',
		// the buttons to appear on the toolbar of the grid
		{
			edit : true,
			add : false,
			del : true,
			cancel : true,
			addParams : {
				keys : true
			},
			editParams : {
				keys : true
			}
		});

		var lastSelection;

		function editRow(id) {
			if (id && id !== lastSelection) {
				var grid = $("#employeejqGrid");
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