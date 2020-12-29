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
	 width: 300px;
	 border: 3px solid #f1f1f1;
	 z-index: 9;
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
	 .form-container input[type=text]{
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
	<!-- 회의실 예약 모달 -->
  	<div class="form-popup" id="reservation">
      	<div class="form-container">
          	<h1>회의실 예약</h1>
          	<form action="★" method="post" >
              	<div>
                  	<table>
                      	<tr>
                          	<th>신청자</th>
                          	<td><input type="text" name="" value="홍길동" readonly></td>
	                      </tr>
	                      <tr>
	                          <th>부서</th>
	                          <td><input type="text" name="" value="개발팀" readonly></td>
	                      </tr>
	                      <tr>
	                          <th>시작일자 *</th>
	                          <td>
	                              <input type="text" class="date start" id="date1" />
	                              <input type="text" class="time start" id="time1" />
	                          </td>
	                      </tr>
	
	                      <tr>
	                          <th>종료일자 *</th>
	                          <td>
	                              <input type="text" class="date end" id="date2"/>
	                              <input type="text" class="time end" id="time2"/>
	                          </td>
	                      </tr>
	                      <tr>
	                          <th>회의실 *</th>
	                          <td>
	                              <select name="" id="" required>
	                                  <option value="소회의실 Ⅰ">소회의실 Ⅰ</option>
	                                  <option value="소회의실 Ⅱ">소회의실 Ⅱ</option>
	                                  <option value="중회의실">중회의실</option>
	                                  <option value="대회의실">대회의실</option>
	                                  <option value="중역회의실">중역회의실</option>
	                              </select>
	                          </td>
	                      </tr>
	                      <tr>
	                          <th>사용목적 * </th>
	                          <td>
	                              <textarea name="" id="" cols="20" rows="3" style="resize: none;"></textarea>
	                          </td>
	                      </tr>
	                      <tr>
	                          <th>외부인참석여부</th>
	                          <td>
	                              <label class="form-check-label" style="margin-right: 30px;">
	                                  <input type="radio" name="visiterYn" id="yes"> 예
	                              </label>
	                              <label class="form-check-label">
	                                  <input type="radio" name="visiterYn" id="no"> 아니오
	                              </label>
	                          </td>
	                      </tr>
	                  </table>
              	</div>
              <!-- Modal footer -->
              <div class="modal-footer" align="right">
                  <button type="submit" class="btn btn-info">변경</button>
                  <button type="button" class="btn cancel" onclick="window.close();">닫기</button>
              </div>
          </form>
          </div>
      </div>

      <script>
      	// 요청시작일자, 종료일자 선택
        $(function(){
            // initialize input widgets first
            $('.form-container .time').timepicker({
                'showDuration': false,
                'timeFormat': 'h:mm p',
                interval: 60,
                minTime: '9',
                maxTime: '6:00pm',
                defaultTime: '9',
                startTime: '9:00',
                dynamic: true,
                dropdown: true,
                scrollbar: true
            });
            $('.form-container .date').datepicker({
            	// 속성 : https://uxsolutions.github.io/bootstrap-datepicker/?#sandbox
                format: 'yyyy/mm/dd(D)',
                autoclose: true,
                todayHighlight:true,
                todayBtn:'linked',
                language:'kr',
                daysOfWeekDisabled: "0,6"
            });
        })
      </script>
</body>
</html>