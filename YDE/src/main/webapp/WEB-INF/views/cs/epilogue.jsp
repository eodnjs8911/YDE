<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/jquery.jqGrid.min.js"></script>
<script type="text/ecmascript"
	src="${pageContext.request.contextPath}/resources/jqgrid/grid.locale-kr.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/jqgrid/ui.jqgrid-bootstrap.css" />

<%@ include file="menu_CS1.jsp"%>
<img src="${pageContext.request.contextPath}/resources/images/epil.png" width="100%">
<div id="tabs-3">
	<table id="epiloguejqGrid"></table>
	<div id="epiloguejqGridPager"></div>
</div>


<div id="dialogTemplate">
	<form>
		<div class="form-group">
			<label for="epilogueContent">내용</label> <input type="text"
				class="form-control" id="epilogueContent" name="epilogueContent">
		</div>
		<div class="form-group">
			<label for="epilogueWriter">작성자</label> <input type="text"
				class="form-control" id="epilogueWriter" name="epilogueWriter">
		</div>
		<div class="form-group">
			<label for="epiloguePw">비밀번호</label> <input type="text"
				class="form-control" id="epiloguePw" name="epiloguePw">
		</div>
		<div class="form-group">
			<div align="right">{sData}{cData}</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	$(function() {
		$("#dialogTemplate").hide();

		$("#epiloguejqGrid").jqGrid({
			url : '/yde/cs/epilogue/selectList.do',
			editurl : '/yde/cs/epilogue/edit.do',
			datatype : "json",
			styleUI : 'Bootstrap',
			colModel : [ {
				label : '번호',
				name : 'epilogueNo',
				key : true,
				width : 60,
				editable : false,
				readonly : true,
				sorttype : 'integer'
			/* editrules : {
				readonly : readonly
			} */
			}, {
				label : '작성자',
				name : 'epilogueWriter',
				width : 120,
				editable : true,
				editrules :{
					required : true
				}
			}, {
				label : '비밀번호',
				name : 'epiloguePw',
				width : 55,
				editable : true,
				hidden : true,
				editrules :{
					required : true
				}
			}, {
				label : '내용',
				name : 'epilogueContent',
				width : 350,
				editable : true,
				editrules :{
					required : true
				}
			}, {
				label : '작성일',
				name : 'epilogueWDate',
				width : 120,
				editable : false,

			} ],
			viewrecords : true,
			loadonce : true,
			height : 'auto',
			autowidth : true,
			responsive : true,
			rowNum : 10,
			pager : "#epiloguejqGridPager",
			sortname : "epilogueNo",
			sortorder : "desc",
			navOptions : {
				reloadGridOptions : {
					fromServer : true
				}
			}
		});

		var login = "${login}";

		$('#epiloguejqGrid').jqGrid('navGrid', "#epiloguejqGridPager", {
			edit : false,
			del : false

		}, {
			template : $("#dialogTemplate").html(),
			closeAfterEdit : true,
			reloadAfterSubmit : true,
			afterComplete : function() {
				$("#epiloguejqGrid").setGridParam({
					datatype : 'json',
					page : 1
				}).trigger('reloadGrid');
			}

		}, {
			closeAfterAdd : true,
			reloadAfterSubmit : true,
			template : $("#dialogTemplate").html(),
			afterComplete : function() {
				$("#epiloguejqGrid").setGridParam({
					datatype : 'json',
					page : 1
				}).trigger('reloadGrid');
			}
		});

		$('#epiloguejqGrid').jqGrid('navButtonAdd', "#epiloguejqGridPager", {
			caption : "수정",
			buttonicon : "ui-icon-newwin",
			onClickButton : editButton,
			position : "last",
			title : "수정",
			cursor : "pointer"
		});
		$('#epiloguejqGrid').jqGrid('navButtonAdd', "#epiloguejqGridPager", {
			caption : "삭제",
			buttonicon : "ui-icon-newwin",
			onClickButton : delButton,
			position : "last",
			title : "삭제",
			cursor : "pointer"
		});

		function editButton() {
			var gr = $("#epiloguejqGrid").jqGrid('getGridParam', 'selrow');
			if (gr != null) {
				var pw = prompt("비밀번호", "");
				var data = $("#epiloguejqGrid").jqGrid('getRowData', gr);
				if (pw == data.epiloguePw) {
					$("#epiloguejqGrid").jqGrid('editGridRow', gr, {
						editCaption: "후기 수정",
						template : $("#dialogTemplate").html(),
						closeAfterEdit : true,
						reloadAfterSubmit : true,
						afterComplete : function() {
							$("#epiloguejqGrid").setGridParam({
								datatype : 'json',
								page : 1
							}).trigger('reloadGrid');
						}
					});
				} else if (pw == null) {

				} else {
					alert("비밀번호가  틀렸습니다");
				}
			} else {
				alert("후기를 선택해주세요");
			}
		}

		function delButton() {
			var gr = $("#epiloguejqGrid").jqGrid('getGridParam', 'selrow');
			if (gr != null) {
				var pw = prompt("비밀번호", "");
				var data = $("#epiloguejqGrid").jqGrid('getRowData', gr);
				if (pw == data.epiloguePw) {
					$("#epiloguejqGrid").jqGrid('delGridRow', gr, {
						editCaption: "삭제",
						msg: "삭제하시겠습니까?",
						bSubmit: "예",
						bCancel: "아니오"
					});
				} else if (pw == null) {

				} else {
					alert("비밀번호가  틀렸습니다");
				}
			} else {
				alert("후기를 선택해주세요");
			}
		}

	});
</script>