<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서발급요청서</title>
</head>
<body>
	
	<form action="">
		
		<span style="font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
			<table class="documentRequest_table">
				<colgroup>
					<col style="width: 90px;">
					<col style="width: 180px;">
					<col style="width: 90px;">
					<col style="width: 120px;">
					<col style="width: 90px;">
				</colgroup>
		
				<tbody>
					<tr>
						<td class="documentRequestTitle" colspan="6">
							증명서발급 신청서
						</td>
					</tr>
					<tr>
						<td class="documentRequest_td_name"> 기안부서 </td>
						<td class="documentRequest_td_value"></td>
						<td	class="documentRequest_td_name"> 기 안 일 </td>
						<td class="documentRequest_td_value"></td>
						<td	class="documentRequest_td_name"> 기 안 자 </td>
						<td	class="documentRequest_td_value"></td>
						</td>
					</tr>
				</tbody>
			</table>
		
			<table style="width: 800px; border-collapse: collapse; border-spacing: 0px; border: 1px solid black; border-top-color: white; border-bottom-color: white;">
				<tbody>
					<tr>
						<td style="padding: 0px !important; height: 10px; vertical-align: middle; border: 1px solid black; font-size: 9px;"></td>
					</tr>
				</tbody>
			</table>
		
			<table class="documentRequest_table1">
				<colgroup>
					<col style="width: 90px;">
					<col style="width: 710px;">
				</colgroup>
		
				<tbody>
					<tr>
						<td class="documentRequest_td_name"> 제 &nbsp;&nbsp;&nbsp; 목 </td>
						<td class="documentRequest_td_value">
							<input class="ipt_editor" type="text">
						</td>
					</tr>
					<tr>
						<td style="padding: 3px; vertical-align: top; border: 0px solid black;" colspan="2">
							<br>
							<table class="documentRequest_table3">
								<colgroup>
									<col style="width: 170px;">
									<col style="width: 215px;">
									<col style="width: 170px;">
									<col style="width: 215px;">
									<col style="width: 215px;">
								</colgroup>
		
								<tbody>
									<tr>
										<td style="padding: 3px; height: 20px; vertical-align: middle; border: 1px solid black; text-align:center; font-weight: bold;" colspan="4">
											신청인 정보
										</td>
									</tr>
									<tr>
										<td class="documentRequest_td_name"> 팀/그룹 </td>
										<td class="documentRequest_td_value">
											<input class="ipt_editor" type="text">
											<br>
										</td>
										<td class="documentRequest_td_name"> 직위 </td>
										<td class="documentRequest_td_value">
											<input class="ipt_editor" type="text">
											<br>
										</td>
									</tr>
									<tr>
										<td class="documentRequest_td_name"> 사번 </td>
										<td class="documentRequest_td_value">
											<input class="ipt_editor" type="text">
											<br>
										</td>
										<td class="documentRequest_td_name"> 성명 </td>
										<td class="documentRequest_td_value">
											<input class="ipt_editor" type="text">
											<br>
										</td>
									</tr>
									<tr>
										<td class="documentRequest_td_name"> 연락처 </td>
										<td class="documentRequest_td_value">
											<input class="ipt_editor" type="text">
											<br>
										</td>
										<td class="documentRequest_td_name"> 신청일 </td>
										<td class="documentRequest_td_value">
											<input class="ipt_editor ipt_editor_date" type="text">
											<br>
										</td>
									</tr>
								</tbody>
							</table>
							<br>
		
							<table class="documentRequest_table3">
								<colgroup>
									<col style="width: 170px;">
									<col style="width: 250px;">
									<col style="width: 100px;">
									<col style="width: 150px;">
									<col style="width: 100px;">
								</colgroup>
								<tbody>
									<tr>
										<td style="padding: 3px; height: 20px; vertical-align: middle; border: 1px solid black; font-weight: bold;" colspan="4">
											신청 정보 ( 종류 : 재직/경력 증명서, 퇴직/근로 원천징수 영수증)
										</td>
									</tr>
									<tr>
										<td class="documentRequest_td_name"> 증명서종류 </td>
										<td class="documentRequest_td_name"> 용도 </td>
										<td class="documentRequest_td_name"> 수량 </td>
										<td class="documentRequest_td_name"> 제출처 </td>
									</tr>
									<tr>
										<td class="documentRequest_info">
											<input class="ipt_editor" type="text">
											<br>
										</td>
										<td class="documentRequest_info">
											<input class="ipt_editor" type="text">
											<br>
										</td>
										<td class="documentRequest_info">
											<input class="ipt_editor ipt_editor_currency" type="text">
											<br>
										</td>
										<td class="documentRequest_info">
											<input class="ipt_editor" type="text">
											<br>
										</td>
									</tr>
								</tbody>
							</table>
							<br>
							<br>
						</td>
					</tr>
				</tbody>
			</table>
		</span>
		
	</form>

</body>
</html>