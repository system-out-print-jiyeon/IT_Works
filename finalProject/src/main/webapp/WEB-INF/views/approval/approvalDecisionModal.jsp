<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal fade" id="approvalModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">결재</h5>
				</div>
				<div class="modal-body">
					<form action="">
						<div class="form-group">
							<h6>결재여부</h6>
							<br>
							<div style="text-align: center;">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="approvalMethod" id="approvalMethod_approve">
									<label for="approvalMethod_approve">승인</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="approvalMethod" id="approvalMethod_reject">
									<label for="approvalMethod_reject">반려</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">의견작성</label>
							<textarea class="form-control" id="message-text"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>