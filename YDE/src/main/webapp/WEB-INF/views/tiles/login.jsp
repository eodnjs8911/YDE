<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	function showLogin() {
		$("#loginModal").modal('show');
	};
	function login() {
		$.getJSON('/yde/admin/login.do', {
			"id" : $("#adminId").val(),
			"pw" : $("#adminPw").val()
		}, function(data) {
			if (data.result == "success") {
				$("#loginModal").modal('hide')
				$("#loginConfirmModalText").text("로그인");
				$("#loginConfirmModal").modal('show')
			} else {
				$("#loginConfirmModalText").text("로그인 실패");
				$("#loginConfirmModal").modal('show')
			}
		});
	}

	function logout() {
		$.getJSON('/yde/admin/logout.do', {}, function(data) {
			if (data.result == "success") {
				$("#loginConfirmModalText").text("로그아웃");
				$("#loginConfirmModal").modal('show')
			}
		});

	}
	function pageReload() {
		location.reload();

	}
</script>

<div class="modal fade" role="dialog"
	aria-labelledby="gridSystemModalLabel" aria-hidden="true"
	id="loginModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="gridSystemModalLabel">로그인</h4>
				<form class="form-horizontal">
					<div class="form-group">
						<label for="adminId" class="col-md-2 control-label">아이디</label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="adminId"
								name="adminId">
						</div>
					</div>
					<div class="form-group">
						<label for="adminPw" class="col-md-2 control-label">비밀번호</label>
						<div class="col-md-10">
							<input type="password" class="form-control" id="adminPw"
								name="adminPw">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-default" onclick="login()">로그인</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" role="dialog"
	aria-labelledby="gridSystemModalLabel" aria-hidden="true"
	id="loginConfirmModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="gridSystemModalLabel">로그인</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<h3 id="loginConfirmModalText"></h3>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default"
					onclick="pageReload()">확인</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->


