<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/jquery.jqGrid.min.js"></script>
<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/grid.locale-kr.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid/ui.jqgrid-bootstrap.css" />


<div>
	<table id="resourcejqGrid"></table>
	<div id="resourcejqGridPager"></div>
</div>

<div id="dialogTemplate">
	<form>
		<div class="form-group">
			<label for="resourceName">이름</label> <input type="text"
				class="form-control" id="resourceName" name="resourceName">
		</div>
		<div class="form-group">
			<label for="resourceCategory">분류</label> <select class="form-control"
				id="resourceCategory" name="resourceCategory">
				<option value="1">차량</option>
				<option value="2">공구</option>
				<option value="3">소모품</option>
			</select>
		</div>
		<div class="form-group">
			<label for="resourceState">상태</label> <select class="form-control"
				id="resourceState" name="resourceState">
				<option value="1">양호</option>
				<option value="2">수리중</option>
				<option value="3">폐기품</option>
			</select>
		</div>
		<div class="form-group">
			<div align="right">{sData}{cData}</div>
		</div>
	</form>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$("#dialogTemplate").hide();

		$("#resourcejqGrid").jqGrid({
			url : '/yde/resource/selectList.do',
			editurl : '/yde/resource/edit.do',
			mtype : "GET",
			styleUI : 'Bootstrap',
			datatype : "json",
			colModel : [ {
				label : '자산번호',
				name : 'resourceNo',
				key : true,
				editable : false,
				width : 120,
				sorttype : 'integer',
				searchoptions : {
					sopt : [ "eq" ]
				}
			}, {
				label : '이름',
				name : 'resourceName',
				width : 300,
				editable : true,
				edittype : "text",
				editoptions : {
					rows : "cn"
				},

			}, {
				label : '분류',
				name : 'resourceCategory',
				width : 120,
				editable : true,
				formatter : 'select',
				edittype : "select",
				editoptions : {
					value : "1:차량;2:공구;3:소모품"
				},
				stype : "select",
				searchoptions : {
					value : ":[All];1:차량;2:공구;3:소모품"
				}
			}, {
				label : '상태',
				name : 'resourceState',
				width : 120,
				editable : true,
				formatter : 'select',
				edittype : "select",
				editoptions : {
					value : "1:양호;2:수리중;3:폐기처리"
				},
				stype : "select",
				searchoptions : {
					value : ":[All];1:양호;2:수리중;3:폐기처리"
				}
			}

			],

			viewrecords : true,
			loadonce : true,
			rowNum : 10,
			height : 'auto',
			autowidth : true,
			responsive : true,
			multiselect : true,
			pager : "#resourcejqGridPager"
		});

		$('#resourcejqGrid').jqGrid('filterToolbar', {
			// JSON stringify all data from search, including search toolbar operators
			stringResult : true,
			// instuct the grid toolbar to show the search options
			searchOperators : true
		});

		$('#resourcejqGrid').jqGrid('navGrid', "#resourcejqGridPager", {
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
				$("#resourcejqGrid").setGridParam({
					datatype : 'json',
					page : 1
				}).trigger('reloadGrid');
			}
		});

		$('#resourcejqGrid').inlineNav('#resourcejqGridPager',
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
	});
</script>