<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#divCustomWrapper #titleSection,
#divCustomWrapper #draftSection,
#divCustomWrapper .detailSection {
    width: 800px !important;
    clear: both;
    margin-top: 20px !important;
    vertical-align: middle;
}

#divCustomWrapper table {
    border-collapse: collapse;
    table-layout: fixed;
    word-break: break-all;
}

#divCustomWrapper td.subjectColumn {
	border: 1px solid black !important;
	font-size: 9pt !important;
	height: 22px;
	padding: 3px 1px 3px 1px;
	/*top right bottom left*/
}

#divCustomWrapper td.detailColumn {
	border: 1px solid black !important;
	font-size: 9pt !important;
	height: 22px;
	padding: 3px 5px 3px 5px;
	/*top right bottom left*/
}

#divCustomWrapper td.subjectColumn {
	background: rgb(221, 221, 221);
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
}

#divCustomWrapper td.detailColumn.centerCol {
	text-align: center;
}

#divCustomWrapper .td_button {
	word-break: break-all;
	padding: 3px;
	border: none;
	width: 800px;
	height: 22px;
	text-align: right;
	vertical-align: middle;
}
</style>
</head>
<body>
	<div style="font-family: 돋움; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
		<span style="font-family: 돋움; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
	
			<table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic,dotum,arial,tahoma; margin-top: 1px; border-collapse: collapse;">
				<!-- Header -->
				<colgroup>
					<col width="310">
					<col width="490">
				</colgroup>
	
				<tbody>
					<tr>
						<td style="background: white; padding: 0px !important;height: 60px; text-align: center; color: black; font-size: 25px; font-weight: bold; vertical-align: middle;" colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
							법인카드 지출결의서
						</td>
					</tr>
				</tbody>
			</table>
		</span></div>
	<div style="font-family: 돋움; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><br></div>
	<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; width: 800px; height: 142px;">
		<tbody>
			<tr>
				<td height="150" style="padding-top: 1px; padding-right: 1px; padding-left: 1px; vertical-align: middle; text-align: center; border-right: 1px solid windowtext; border-bottom: 1px solid windowtext; border-left: 1px solid windowtext; border-image: initial; height: 51px; border-top: none; background-color: rgb(226, 226, 226); width: 83px;" class="dext_table_border_t">
					<strong style="font-size: 9pt;">지출사유</strong>
				</td>
				<td colspan="12" style="padding-top: 1px; padding-right: 1px; padding-left: 1px; vertical-align: top; font-size: 10pt; text-align: center; border-top: 1px solid windowtext; border-right: 1px solid windowtext; border-bottom: 1px solid windowtext; border-image: initial; border-left: none; width: 683px; height: 51px; background-repeat: no-repeat;" class="dext_table_border_l">
					<textarea class="txta_editor" style="margin: 1px; height: 95%; width: 98%;" name="outReason"></textarea>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div id="divCustomWrapper" style="font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
		<table id="dynamic_table1" class="detailSection" style="margin-top: 5px !important; height: 100px;">
			<colgroup>
				<col width="135">
				<col width="180">
				<col width="255">
				<col width="120">
				<col width="100">
			</colgroup>
			<thead>
				<tr>
					<td colspan="5" class="viewModeHiddenPart td_button dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
						<button id="plus" onclick="addRow()">추가</button>
						<button id="minus" onclick="deleteRow(-1)">삭제</button>
					</td>
				</tr>
				<tr>
					<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
						<span style="font-size: 9pt;">일 자</span>
					</td>
					<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
						<span style="font-size: 9pt;">분 류</span>
					</td>
					<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
						<span style="font-size: 9pt;">사용 내역</span>
					</td>
					<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
						<span style="font-size: 9pt;">금 액</span>
					</td>
					<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
						<span style="font-size: 9pt;">비 고</span>
					</td>
				</tr>
			</thead>
			<tbody id="insertRow">
				<tr class="copyRow1">
					<td class="detailColumn centerCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="height: 29px;">
						<input class="ipt_editor ipt_editor_date" type="text" style="width: 90%;" name="outgoingsList[0].outDate">
					</td>
					<td class="detailColumn centerCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="height: 29px;">
						<input class="ipt_editor ipt_editor_date" type="text" style="width: 90%;" name="outgoingsList[0].outCategory">
					</td>
					<td class="detailColumn centerCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="height: 29px;">
						<input class="ipt_editor" type="text" style="width: 90%;" name="outgoingsList[0].outPrice">
					</td>
					<td class="detailColumn centerCol price dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="height: 29px;">
						<input class="ipt_editor ipt_editor_currency" type="text" style="width: 90%;" name="outgoingsList[0].outHistory">
					</td>
					<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="height: 29px;">
						<input class="ipt_editor" type="text" style="width: 90%;" name="outgoingsList[0].outRemark">
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td colspan="3" class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
						합계
					</td>
					<td class="detailColumn total_price rightCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
						<p style="font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px;" name="outSumprice">
							<br>
						</p>
					</td>
					<td colspan="1" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
						<p style="font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px;">
							<br>
						</p>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<p style="font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;">
		<strong>* 영수증 별도 제출</strong>
	</p>
	
	<script>
	
		function addRow() {
	
			var table = document.getElementById('insertRow');
	
			var newRow = table.insertRow();
	
			var newCell1 = newRow.insertCell(0);
			var newCell2 = newRow.insertCell(1);
			var newCell3 = newRow.insertCell(2);
			var newCell4 = newRow.insertCell(3);
			var newCell5 = newRow.insertCell(4);
	
			newCell1.innerHTML = 
								'<td class="detailColumn centerCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="height: 29px;">' +
							 		'<input class="ipt_editor ipt_editor_date" type="text" style="width: 90%;">' +
								'</td>';
			newCell2.innerHTML = 
								'<td class="detailColumn centerCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="height: 29px;">' +
							 		'<input class="ipt_editor ipt_editor_date" type="text" style="width: 90%;">' +
								'</td>';
			newCell3.innerHTML = 
								'<td class="detailColumn centerCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="height: 29px;">' +
										'<input class="ipt_editor" type="text" style="width: 90%;">' +
								'</td>';
			newCell4.innerHTML = 
								'<td class="detailColumn centerCol price dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="height: 29px;">' +
									'<input class="ipt_editor ipt_editor_currency" type="text" style="width: 90%;">' +
								'</td>';
			newCell5.innerHTML = 
								'<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="height: 29px;">' +
									'<input class="ipt_editor" type="text" style="width: 90%;">' +
								'</td>';
	
		}
	
		function deleteRow(rownum) {
			
			var table = document.getElementById('insertRow');
	
			var newRow = table.deleteRow(rownum);
	
		}
	
	</script>
</body>
</html>