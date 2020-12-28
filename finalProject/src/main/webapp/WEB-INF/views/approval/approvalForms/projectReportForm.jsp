<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Common style (Don't modify) -->
<style type="text/css">
/* 1. Essential style : 반드시 적용되어야 하는 스타일입니다. 문서작성 시, Sample에서 제거불가 한 스타일 */
#divCustomWrapper { word-break: break-all;  font-family: malgun gothic, dotum, arial, tahoma; font-size: 9pt; width:800px !important; }
#divCustomWrapper * { max-width: 800px !important; }
/* (1) Section(제목, 결재선, 내용) */
#divCustomWrapper #titleSection,
#divCustomWrapper #draftSection,
#divCustomWrapper .detailSection { width:800px !important; clear:both; margin-top: 20px !important; vertical-align: middle; }
#divCustomWrapper #titleSection { text-align: center; font-size: 25px; font-weight: bold; margin-bottom: 30px !important; margin-top: 20px !important; }
#divCustomWrapper #draftSection { display: inline-block; }
#divCustomWrapper .detailSection > * { margin-bottom: 10px; }
/* (2) Table */
#divCustomWrapper table { border-collapse: collapse; table-layout:fixed; word-break:break-all; }
</style>
<style type="text/css">
/* 2. Option style : 용도에 따라 적용합니다.*/
/* (1) Table option : 2Type(subject / detail), Affacted elements(td), Range('divCustomWrapper' 하단요소) */
#divCustomWrapper td.subjectColumn { border: 1px solid black !important; font-size: 9pt !important; height:22px; padding: 3px 1px 3px 1px;/*top right bottom left*/}
#divCustomWrapper td.detailColumn { border: 1px solid black !important; font-size: 9pt !important; height:22px; padding: 3px 5px 3px 5px; vertical-align: middle;/*top right bottom left*/ }
#divCustomWrapper td.detailColumn { text-align: left; }
#divCustomWrapper td.subjectColumn { background: rgb(221, 221, 221); font-weight: bold; text-align: center; vertical-align: middle; }
/* (2) detailColumn :  3Type(center / right / high), Affacted elements(All), Range('detailColumn' 하단요소) */
/* 설명 : detailColumn 커스텀 시 사용 */
/* 사용방법 : 번호와 중앙정렬 텍스트 작성 시 'centerCol' CLASS 적용, 숫자와 금액 작성 시 'rightCol' CLASS 적용,
   editor 작성 시 'editorCol' CLASS 적용, textarea 작성 시 'areaCol' CLASS 적용 */
#divCustomWrapper td.detailColumn.centerCol { text-align: center; }
#divCustomWrapper td.detailColumn.rightCol { text-align: right; }
#divCustomWrapper td.detailColumn.editorCol { height: 300px; vertical-align: top;}
#divCustomWrapper td.detailColumn.areaCol { height: 120px; vertical-align: top; }
/* (3) Partition option : 2Type (left / right), Affacted elements(div), Range('partition'div영역 하단요소) */
/* 설명 : 좌,우로 분할되는 레이아웃 작성시 사용, 1라인에 1개 요소만 배치(줄바뀜 동반) */
/* 사용방법 : 분할할 영역에 partition CLASS를 적용 -> 분할배치하고자하는 하위요소에 'left, right' CLASS 적용 */
#divCustomWrapper div.partition .left { display: inline-block; clear: left; float: left; }
#divCustomWrapper div.partition .right { display: inline-block; clear: right; float: right; }
/* (4) In a row option : 2Type(left / right), Affacted elements(All), Range('inaRowRight or inRowLeft'div영역 하단요소) */
/* 설명 : 좌,우 끝에 정렬되는 레이아웃 작성 시 사용, 1라인에 여러개 요소 배치, Partition option과 조합(줄바뀜 없이 배치) */
/* 사용방법 : 나란히 정렬하고자 하는 요소들을, 'in a row'div 영역 내에 배치 */
#divCustomWrapper div.inaRowRight { text-align: right; }
#divCustomWrapper div.inaRowLeft { text-align: left; }
/* (5) button :  2Type(td / div), Affacted elements(All) */
/* 설명 : 행 추가, 행 삭제 버튼 작성 시 'viewModeHiddenPart'(기안 시 버튼 가려주는 클래스)와 조합해서 사용 */
/* 사용방법 : 테이블에 한줄로 사용 시 td에 'viewModeHiddenPart .td_button' CLASS 적용 -> 각 버튼에 'button' CLASS 적용 td 내 텍스트 아래에 쓰이거나 테이블 밖에서 사용 시 div에 viewModeHiddenPart .div_button CLASS 적용 -> 각 버튼에 button CLASS 적용 */
#divCustomWrapper .td_button { word-break:break-all; padding: 3px; border: none; width: 800px; height: 22px; text-align: right; vertical-align: middle; }
#divCustomWrapper .div_button { word-break:break-all; padding: 3px; border: none; margin-top:2px; margin-bottom:2px; height: 22px; vertical-align: middle;}
#divCustomWrapper a.button { background: rgb(102, 102, 102); color: rgb(255, 255, 255); padding: 2px 5px; border-radius: 3px; margin-right: 0px; margin-left: 0px; font-size: 9pt !important; }
/* (6) p :  2Type(titleP / freeP), Affacted elements(All) */
/* 설명 : 테이블 별 소제목과 테이블 아래 설명 작성 시 사용*/
p.titleP{font-weight: bold; font-size: 12px; margin: 15px 1px 5px 5px;/*top right bottom left*/}
p.freeP{font-weight: normal; font-size: 12px; margin: 1px 1px 3px 5px;/*top right bottom left*/}
</style>
<!-- Common style (Don't modify) -->
<!-- Print style (Don't modify) -->
<style type="text/css">
/* 인쇄시에만 적용되는 스타일입니다. 순서대로 1.양식 인쇄 시 중앙으로 위치 2.테이블 테두리 고정 3.버튼 가리기 */
@media print {
.viewModeHiddenPart {display: none;}
h1, h2, h3, h4, h5, dl, dt, dd, ul, li, ol, th, td, p, blockquote, form, fieldset, legend, div,body { -webkit-print-color-adjust:exact; }}
</style>
</head>
<body>

<!-- Page Wrapping (start) : Style retention -->
<div id="divCustomWrapper" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">  <!-- Embededd Style이 적용받는 범위 입니다. 상단의 스타일은 이 요소 안에서만 동작합니다. --> 
<!-- 1. Title Section (end) --><!-- 3. Detail Section (start) : 내용이 작성되는 영역입니다. -->
<table class="detailSection"><colgroup><!-- ### 테이블의 컬럼 너비는 colGroup을 통해 지정합니다. td에 지정 X ### --><col width="40"><col width="40"><col width="50"><col width="50"><col width="50"><col width="50"><col width="50"><col width="50"><col width="50"><col width="50"><col width="50"><col width="50"><col width="50"><col width="50"><col width="50"><col width="70"></colgroup>
 
	<tbody>
		<tr>
			<td colspan="16" style="border-bottom : none !important;  text-align: center; font-size: 25px !important; font-weight: bold; margin-bottom: 30px !important; margin-top: 20px !important;" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
회사명
			</td>
		</tr>
		<tr>
			<td colspan="2" style="border-bottom : none !important; border-top: none !important;  border-right: none !important;   font-weight: bold; " class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				
수&nbsp; &nbsp; &nbsp; &nbsp;신&nbsp; :
			</td>
			<td colspan="14" style="border-bottom : none !important; border-top: none !important;  border-left : none !important;" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="5" data-dsl="{{label:recipient}}" data-wrapper="" style="font-size: 9pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_item" style="font-size: 9pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">수신자</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="5" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br></p>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="border-top: none !important;  border-right: none !important; border-bottom:2px solid black !important;  font-weight: bold; " class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_l">
				
제&nbsp; &nbsp; &nbsp; &nbsp; 목 :
			</td>
			<td colspan="14" style="border-top: none !important; border-left : none !important; border-bottom:2px solid black !important;" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_l">
				<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="6" data-dsl="{{text:subject}}" data-wrapper="" style="width: 100%; font-size: 9pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="6" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br></p>
			</td>
		</tr>
		<tr>
			<td colspan="16" style=" font-weight: bold; " class="detailColumn editorCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="7" data-dsl="{{editor:appContent}}" data-wrapper="" style="width: 100%; font-size: 9pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_editor" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;">에디터(본문)}</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="7" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="border-top : 2px solid black !important; border-right : none !important; border-bottom : none !important;" class="detailColumn dext_table_border_r dext_table_border_b dext_table_border_l">
				담당자 :&nbsp;<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="8" data-dsl="{{label:draftUser}}" data-wrapper="" style="" data-value="" data-autotype=""><span class="comp_item" style="">기안자</span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="8"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>
			</td>
			<td colspan="4" style="border-top : 2px solid black !important; border-right : none !important; border-left : none !important;  border-bottom : none !important;" class="detailColumn dext_table_border_r dext_table_border_b dext_table_border_l">
				/ 전화 :&nbsp;<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="9" data-dsl="{{label:mobileNo}}" data-wrapper="" style="" data-value="" data-autotype=""><span class="comp_item" style="">핸드폰번호</span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="9"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>
			</td>
			<td colspan="4" style="border-top : 2px solid black !important; border-right : none !important; border-left : none !important;  border-bottom : none !important;" class="detailColumn dext_table_border_r dext_table_border_b dext_table_border_l">
				/ 팩스 :&nbsp;<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="10" data-dsl="{{label:fax}}" data-wrapper="" style="" data-value="" data-autotype=""><span class="comp_item" style="">팩스</span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="10"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>
			</td>
			<td colspan="4" style="border-top : 2px solid black !important; border-left : none !important;  border-bottom : none !important;" class="detailColumn dext_table_border_r dext_table_border_b dext_table_border_l">
				/ 이메일 :&nbsp;<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="11" data-dsl="{{label:draftUserEmail}}" data-wrapper="" style="" data-value="" data-autotype=""><span class="comp_item" style="">기안자이메일</span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="11"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>
			</td>
		</tr>
		<tr>
			<td colspan="4" style=" border-top : none !important; border-right : none !important; border-bottom : none !important;" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				대표번호 :&nbsp;<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="12" data-dsl="{{label:repTel}}" data-wrapper="" style="" data-value="" data-autotype=""><span class="comp_item" style="">대표번호</span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="12"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>
			</td>
			<td colspan="4" style=" border-top : none !important; border-right : none !important; border-left : none !important;  border-bottom : none !important;" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				/ 공개여부 :&nbsp;<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="13" data-dsl="{{label:openOption}}" data-wrapper="" style="" data-value="" data-autotype=""><span class="comp_item" style="">공개여부</span><span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="13"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>
			</td>
			<td colspan="8" style="border-top : none !important;  border-left : none !important;  border-bottom : none !important;" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				/ 사업자등록번호 : 000-00-00000
			</td>
		</tr>
		<tr>
			<td colspan="8" style=" border-top : none !important; border-right : none !important;" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				주소
			</td>
			<td colspan="8" style="border-top : none !important;  border-left : none !important;  " class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				/ 대표이사 : ooo
			</td>
		</tr>
	</tbody>
</table>
<!-- 3. Detail Section (end) --></div>
<!-- Page Wrapping (end) -->

</body>
</html>