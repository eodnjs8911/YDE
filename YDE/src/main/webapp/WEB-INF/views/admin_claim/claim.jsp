<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/jquery.jqGrid.min.js"></script>
<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/grid.locale-kr.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid/ui.jqgrid-bootstrap.css" />

<div>
	<table id="claimjqGrid"></table>
	<div id="claimjqGridPager"></div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$("#claimjqGrid").jqGrid({
			url : '/yde/claim/selectList2.do',
			editurl : '/yde/claim/edit.do',
			mtype : "GET",
			styleUI : 'Bootstrap',
			datatype : "json",
			colModel : [ {
				label : '불편신고 번호',
				name : 'claimNo',
				key : true,
				width : 75,
				sorttype : 'integer',
				searchoptions : {
					sopt : [ "eq" ]
				}
			}, {
				label : '신고자',
				name : 'claimCustomer',
				width : 100,
				sorttype : 'char',
				searchoptions : {
					sopt : [ "eq" ]
				}
			}, {
				label : '신고내용',
				name : 'claimContent',
				width : 150,
				sorttype : 'string',
				searchoptions : {
					sopt : [ "cn" ]
				}
			}, {
					label : '신고날짜(시작)',
					name : 'claimWDate',
					width : 120,
					editable : true,
					sorttype : 'date',
					searchoptions : {
						dataInit : function(element) {
							$(element).datepicker({
								autoclose : true,
								dateFormat : 'yy-mm-dd',
								orientation : 'bottom'
							});
						},
						sopt : [ "ge", "le", "eq" ]
					}
				}, {
					label : '신고날짜(끝)',
					name : 'claimWRDate',
					width : 120,
					editable : true,
					editoptions : {
						dataInit : function(element) {
							$(element).datepicker({
								autoclose : true,
								dateFormat : 'yy-mm-dd',
								orientation : 'auto bottom'
							});
						}
					},
					sorttype : 'date',
					searchoptions : {
						dataInit : function(element) {
							$(element).datepicker({
								autoclose : true,
								dateFormat : 'yy-mm-dd',
								orientation : 'bottom'
							});
						},
						sopt : [ "ge", "le", "eq" ]
					}
				}, {
				label : '연락처',
				name : 'claimPhone',
				width : 150,
				searchoptions : {
					sopt : [ "cn" ]
				}
			}, {
				label : '불편신고 처리상태',
				name : 'claimState',
				width : 150,
				formatter : 'select',
				editable : true,
				edittype : "select",
				editoptions : {
					value : "1:미처리;2:처리완료;"
				},
				stype : "select",
				searchoptions : {
					value : ":[All];1:미처리;2:처리완료;"
				}
			} ],
			viewrecords : true,
			loadonce : true,
			//onSelectRow : editRow,
			height : 750,
			rowNum : 10,
			pager : "#claimjqGridPager"
		});
		
		
		$('#claimjqGrid').jqGrid('filterToolbar', {
			// JSON stringify all data from search, including search toolbar operators
			stringResult : true,
			// instuct the grid toolbar to show the search options
			searchOperators : true
		});

		$('#claimjqGrid').jqGrid('navGrid', "#claimjqGridPager", {
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
		
		$('#claimjqGrid').inlineNav('#claimjqGridPager',
		// the buttons to appear on the toolbar of the grid
		{
			edit : true,
			add : false,
			del : true,
			cancel : true,
			editParams : {
				keys : true,
			},
			addParams : {
				keys : true
			}
		});
		var lastSelection;

		function editRow(id) {
			if (id && id !== lastSelection) {
				var grid = $("#claimjqGrid");
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