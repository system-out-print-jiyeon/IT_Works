<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- datepair -->
<script type="text/javascript" src="resources/src/jquery.timepicker.js"></script>
<link rel="stylesheet" type="text/css" href="resources/src/jquery.timepicker.css" />
<link rel="stylesheet" type="text/css" href="resources/src/bootstrap-datepicker.css" /> 
<script type="text/javascript" src="resources/src/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="resources/src/Datepair.js"></script>
<!-- 한글팩 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>

<style>
	 /* The popup form - hidden by default */
	 .form-popup {
	 width: 400px;
	 border: 3px solid #f1f1f1;
	 z-index: 9;
	 margin:auto;
	 padding-left: 5px;
	 font-size: 13px;
	 }
	
	 /* Add styles to the form container */
	 .form-container {
	 max-width: 350px;
	 padding: 10px;
	 background-color: white;
	 }
	
	 /* Full-width input fields */
	 .form-container input[type=text], select, textarea{
	 width: 90%;
	 padding: 5px;
	 border: 1px solid #f1f1f1;
	 }
	
	 /* When the inputs get focus, do something */
	 .form-container input[type=text]:hover, textarea:hover {
	 border: 0.5mm solid rgb(89, 89, 89);
	 outline: none;
	 }
	 .form-container input[readonly], .form-container input[readonly]:hover{
	     background-color: #f1f1f1;
	     border: none;
	     cursor: default;
	 }    
	
	 /* Set a style for the submit/login button */
	 .form-container .btn {
	 background-color: #17a2b8;
	 color: white;
	 border-radius: 10%;
	 padding: 8px;
	 border: none;
	 cursor: pointer;
	 margin-top:10px;
	 width: 50px;
	 }
	
	 /* Add a red background color to the cancel button */
	 .form-container .cancel {
	 background-color: red;
	 }
	
	 /* Add some hover effects to buttons */
	 .form-container .btn:hover, .open-button:hover, td :hover {
	 opacity: 1;
	 cursor: pointer;
	 }
	 .form-container table th{width: 100px; height: 35px; font-size: 12px; font-weight: 700; background-color: rgb(240, 240, 240); text-align: center;}
</style>
</head>
<body>
  	<div class="form-popup" id="reservation">
      	<div class="form-container">
          	<h1>회의실 예약</h1>
          	<form name="myForm" method="post" >
              	<div>
                  	<table>
                      	<tr>
                          	<th>신청자</th>
                          	<td>
                          		<input type="text" value="${loginUser.memName}" readonly>
                     			
                          	</td>
	                      </tr>
	                      <tr>
	                          <th>부서</th>
	                          <td>
	                          	<input type="text" value="${loginUser.deptName}팀" readonly>
	                          </td>
	                      </tr>
	                      <tr>
	                          <th>시작일자 *</th>
	                          <td>
	                              <input type="text" class="date start" id="date1" required/>
	                              <input type="text" class="time start" id="time1" required/>
	                              <input type="hidden" name="startPeriod" id="startPeriod" value="">
	                          </td>
	                      </tr>
	
	                      <tr>
	                          <th>종료일자 *</th>
	                          <td>
	                              <input type="text" id="date2" readonly/>
	                              <input type="text" class="time end" id="time2" value="" required/>
	                              <input type="hidden" name="endPeriod" id="endPeriod" value="">
	                          </td>
	                      </tr>
	                      <tr>
	                          <th>회의실 *</th>
	                          <td>
	                              <select name="room" id="room" required>
	                                  <option value="소회의실 1">소회의실 1</option>
	                                  <option value="소회의실 2">소회의실 2</option>
	                                  <option value="중회의실">중회의실</option>
	                                  <option value="대회의실">대회의실</option>
	                                  <option value="중역회의실">중역회의실</option>
	                              </select>
	                          </td>
	                      </tr>
	                      <tr>
	                          <th>사용목적 * </th>
	                          <td>
	                              <textarea id="object" cols="20" rows="3" style="resize: none;" required></textarea>
	                          </td>
	                      </tr>
	                      <tr>
	                          <th>외부인참석여부</th>
	                          <td>
	                              <label class="form-check-label" style="margin-right: 30px;">
	                                  <input type="radio" id="visiterYn" value="Y"> 예
	                              </label>
	                              <label class="form-check-label">
	                                  <input type="radio" id="visiterYn" value="N"> 아니오
	                              </label>
	                          </td>
	                      </tr>
	                  </table>
              	</div>
              <!-- Modal footer -->
              <div class="modal-footer" align="right">
                  <button type="button" class="btn btn-info" onclick="goSubmit();">신청</button>
                  <button type="button" class="btn cancel" onclick="window.close();">닫기</button>
              </div>
          </form>
          </div>
      </div>

      <script>
      	function goSubmit(){
      		$.ajax({
      			url:"insert.re",
      			type:"post",
      			data:{
      				floor:"${floor}",
      				memNo:"${loginUser.memNo}",
      				deptCode:"${loginUser.deptCode}",
      				startPeriod: $("#startPeriod").val(),
      				endPeriod: $("#endPeriod").val(),
      				room: $("#room").val(),
      				object:$("#object").val(),
      				visiterYn:$("#visiterYn").val()
      			},
      			success:function(result){      				
      				if(result>0){
	      				alert("회의실 예약이 완료되었습니다.");
	      				window.close();
      				}else{
      					alert("회의실 예약 실패했습니다. 날짜와 시간을 확인해주세요.");
      				}
      			},error:function(){
      				alert("통신 실패");
      			}
      		})
      	}
        $(function(){
            // initialize input widgets first
            $('.form-container .time').timepicker({
                'showDuration': false,
                'timeFormat': 'H:i A',
                step: 60,
                minTime: '9',
                maxTime: '6:00pm',
                startTime: 'currentTime',
                dynamic: false,
                dropdown: true,
                scrollbar: true
            });
            $('.form-container .date').datepicker({
                // datepicker 속성 : https://uxsolutions.github.io/bootstrap-datepicker/?#sandbox
            	format: 'yyyy/mm/dd(D)',
                autoclose: true,
                todayHighlight:true,
                language:'kr',
                daysOfWeekDisabled: "0,6",
                autoclose: true,
                startDate: "today"
            });
            
            $('.form-container .date').change(function(){
	            $("#date2").val($("#date1").val());
			 })
      		$("#time2").change(function(){
	      		if($(this).val() <= $("#time1").val()){
      			// 종료시각이 시작시각보다 이른경우
	      			alert("종료시간이 더 빠를 수 없습니다.");
	      			$(this).val("");
	      		}
      		})
      		$('.form-container input').change(function(){
      			// hidden 인풋에 시작일자, 종료일자 넣기
      			var startDate = document.getElementById("date1").value;
      			var startTime = document.getElementById("time1").value;
      			var endTime = document.getElementById("time2").value;
      			
      			var period1 = document.getElementById("startPeriod");
      				period1.value = startDate + startTime; 
      			var period2 = document.getElementById("endPeriod");
      				period2.value = startDate + endTime;
      		})
        })
      	
      </script>
</body>
</html>