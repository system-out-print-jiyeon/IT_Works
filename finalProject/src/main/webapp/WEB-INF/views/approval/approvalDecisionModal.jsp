<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="decision.ap" method="POST">
	<div class="modal fade" id="approvalModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">결재</h5>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<h4>결재여부</h4>
						<br>
						<div style="text-align: center;">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="appSta" id="approvalMethod_approve" value="Y" onclick="statusApprove();">
								<label class="form-check-label" for="approvalMethod_approve" style="font-size: 23px;">승인</label>
							</div>
							<div class="form-check form-check-inline" style="margin-left: 30px;">
								<input class="form-check-input" type="radio" name="appSta" id="approvalMethod_reject" value="N" onclick="statusReject();">
								<label class="form-check-label" for="approvalMethod_reject" style="font-size: 23px;">반려</label>
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" value="${ loginUser.memNo }" name="memNo">
				<input type="hidden" value="${ ad.docNo }" name="docNo">
				<input type="hidden" value="" id="approvalOrder" name="approvalOrder">
				<input type="hidden" value="" id="approvalStatus" name="approvalStatus">
				
				<script>
					function statusApprove() {
						var app = document.getElementById("approvalMethod_approve").value;
						document.getElementById("approvalStatus").value = app;
					}
					function statusReject() {
						var app = document.getElementById("approvalMethod_reject").value;
						document.getElementById("approvalStatus").value = app;
					}
				</script>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary" onclick="decision.ap">등록</button>
				</div>
			</div>
		</div>
	</div>
</form>