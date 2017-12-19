<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/jquery.jqGrid.min.js"></script>
<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/grid.locale-kr.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid/ui.jqgrid-bootstrap.css" />


<div>
	<table id="smsjqGrid"></table>
	<div id="smsjqGridPager"></div>
</div>
<script type="text/javascript">
	$(document).ready(function() {

		$("#smsjqGrid").jqGrid({
			url : '/yde/sms/selectList.do',
			editurl : '/yde/sms/edit.do',
			mtype : "GET",
			styleUI : 'Bootstrap',
			datatype : "json",
			colModel : [ {
				label : '번호',
				name : 'smsNo',
				key : true,
				width : 80,
				sorttype : 'integer',
				searchoptions : {
					sopt : [ "eq" ]
				}
			}, {
				label : '문자내용',
				name : 'smsContent',
				width : 450,
				editable : true,
				edittype : "textarea",
				editoptions : {
					rows : "4",
					cols : "50"
				},
				searchoptions : {
					sopt : [ "cn" ]
				}
			}, {
				label : '보내는번호',
				name : 'smsSendAddr',
				width : 120,
				editable : true,
				searchoptions : {
					sopt : [ "cn" ]
				}
			}, {
				label : '받는번호',
				name : 'smsReceiveAddr',
				width : 120,
				editable : true,
				searchoptions : {
					sopt : [ "cn" ]
				}
			}, {
				label : '발송시간',
				name : 'smsSDate',
				width : 200,
				editable : true,
				editoptions : {
					dataInit : function(element) {
						$(element).datetimepicker({
							format : 'YYYY-MM-DD HH:mm',
							showClose : true,
							showClear : true,
							showTodayButton : true
						});
					}
				},
				sorttype : 'date',
				searchoptions : {
					dataInit : function(element) {
						$(element).datepicker({
							locale : 'ko',
							autoclose : true,
							dateFormat : 'yy-mm-dd',
							orientation : 'bottom'
						});
					},
					sopt : [ "ge", "le", "eq" ]
				}
			}, {
				label : '예약발송시간',
				name : 'smsRsDate',
				width : 200,
				editable : true,
				editoptions : {
					dataInit : function(element) {
						$(element).datetimepicker({
							format : 'YYYY-MM-DD HH:mm',
							showClose : true,
							showClear : true,
							showTodayButton : true
						});
					}
				},
				sorttype : 'date',
				searchoptions : {
					dataInit : function(element) {
						$(element).datetimepicker({
							format : 'YYYY-MM-DD HH:mm',
							showClose : true,
							showClear : true,
							showTodayButton : true,
							widgetPositioning : {
								horizontal : 'left',
								vertical : 'bottom'
							}
						});
					},
					sopt : [ "ge", "le", "eq" ]
				}
			}, {
				label : '상태',
				name : 'smsState',
				width : 130,
				formatter : 'select',
				editable : true,
				edittype : "select",
				editoptions : {
					value : "1:대기;2:발송예약;3:발송정지;4:발송완료"
				},
				stype : "select",
				searchoptions : {
					value : ":[All];1:대기;2:발송예약;3:발송정지;4:발송완료"
				}
			}, {
				label : '이사번호',
				name : 'expressNo',
				width : 80,
				editable : true,
				readonly : true,
				sorttype : 'integer',
				searchoptions : {
					sopt : [ "eq" ]
				}
			} ],
			viewrecords : true,
			loadonce : true,
			//onSelectRow : editRow,
			rowNum : 10,
			height : 750,
			pager : "#smsjqGridPager"
		});

		$('#smsjqGrid').jqGrid('filterToolbar', {
			// JSON stringify all data from search, including search toolbar operators
			stringResult : true,
			// instuct the grid toolbar to show the search options
			searchOperators : true
		});

		$('#smsjqGrid').jqGrid('navGrid', "#smsjqGridPager", {
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

		$('#smsjqGrid').inlineNav('#smsjqGridPager',
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

		$('#smsjqGrid').inlineNav('#smsjqGridPager',
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
				var grid = $("#smsjqGrid");
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
