<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Amiri:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style>
    div{border: px solid rgb(89, 89, 89); box-sizing: border-box;}
    .wrap{
        padding-top: 50px;
        margin: auto; 
        width: 800px;
        height: 800px;
        position: relative;
    }
    #datepick{height:5%; margin-top: 40px;}
    #floor{height: 10%; margin-top: 20px;}
    #tablewrap{height: 53%;}

    #datepick>*{margin-left: 30px; border: 0;}
    input{border: 0;}
    .btn1-light{border-radius: 50%; font-size: 10px; }
    .btn1{padding: 0px 10px 3px 10px; font-size: 13px; background-color: lightgray; border-radius: 10%}
    button:hover{cursor: pointer;}
    #floor>ul {width:100%; height:100%; list-style-type: none; margin: auto; padding:0; text-align:center;}
    #floor>ul>li{width:10%; height:100%; line-height: 70px; display: inline-block;}
    #floor>ul>li a{text-decoration: none; color:black;}

    .tablewrap>table {width: 100%; height: 100%;}
    #tablewrap>table th{height: 35px; font-size: 14px; font-weight: 700; background-color: rgb(240, 240, 240); text-align: center;}
    .tablewrap>table tbody>tr{text-align: center; font-size: 13px; height: 30px;}
    #tablewrap>table tr :hover{cursor: pointer; background-color: rgb(240, 240, 240);}
</style>
<body>

	
	
	
	<%-- 알림메시지출력 --%>
	<c:if test="${ !empty alertMsg }">
		<script type="text/javascript">
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="request"/>
	</c:if>
	
	<script>
        function getToday(){
            // 오늘 날짜 구하기
            const offset = new Date().getTimezoneOffset() * 60000;
            const today = new Date(Date.now() - offset);
            document.getElementById("datePicker").value = today.toISOString().substring(0,10);
            document.getElementById("days").innerText = getdays(new Date(document.getElementById("datePicker").value).getDay());
            ajaxMethod(today.toISOString().substring(0,10));
        }
        $(function(){
            getToday();
            // 구한 요일 span태그에 넣기
            document.getElementById("days").textContent = getdays(new Date(document.getElementById("datePicker").value).getDay());
            // 예약창(팝업) 띄우기
            $("#tablewrap>table tbody>tr>td").click(function(){
            	// 열의 인덱스값 가져오기 (0부터)
            	var rindex = $(this).index();
     			// 행의 인덱스값 가져오기 (0부터)
     			var cindex = $(this).parent().index();
            	// 0. 예약되어있는지 ajax로 확인 -> 되어있으면 조회창, 안되어있으면 등록창
            	var checkData = {
            			floor:"${floor}", 					
        				room:$(".tablewrap thead>tr").children().eq(rindex).text(),
        				memNo: "${loginUser.memNo}",
        				deptCode: "${loginUser.deptCode}",
        				date: $("#datePicker").val(),
        				day: $("#days").text(),
        				time: $(this).siblings("th").text().trim().substring(0,2)
				};
            	$.ajax({
            		url:"checkRV.ajax",
            		type:"post",
            		data:JSON.stringify(checkData),	// 객체를 문자열로 변환
            		dataType: "json",
            		contentType: "application/json; charset=utf-8",
            		success: function(re){
            			if(re != null){
		            	// 1. 이미 예약된 회의실인 경우 (조회창)
            				var pop = open("viewReservation.re?rno="+re.reserveNo,"childForm",
                            "width=500, height=500, location=no, menubar=no, scrollbars=no, status=no, toolbar=no, resizable=no");
            			}else{
		            	// 2. 예약되지 않은 회의실인 경우 (등록창)            				
            				var pop = open("insertReservation.re?floor=${floor}","childForm",
                            "width=500, height=500, location=no, menubar=no, scrollbars=no, status=no, toolbar=no, resizable=no");
            			}
            		},error: function(){
            			console.log("ㅅㅍ");
            		}
            	}) 
            });
        });
        function dateset(reday, remonth){
            // 날짜 두자리수 표현
            if(reday < 10){
                reday = String(("0" + reday));
            }
            if(remonth<10){
                remonth = String(("0" + remonth));
            }
            return {
                day:reday, 
                month:remonth
                };
        }
        function getdays(num){
            //요일 구하기
            var day;
            switch(num){
                case 0: day = "(일)"; break; 
                case 1: day = "(월)"; break; 
                case 2: day = "(화)"; break; 
                case 3: day = "(수)"; break; 
                case 4: day = "(목)"; break; 
                case 5: day = "(금)"; break; 
                case 6: day = "(토)"; break; 
            }
            return day;
        }    
        function minusDate(){
            // 날짜 마이너스
            var value = new Date(document.getElementById("datePicker").value);
                value = new Date(value.getFullYear(), value.getMonth(), value.getDate()-1);
            var date = dateset(value.getDate(), value.getMonth()+1);
            var str = value.getFullYear()+"-"+date.month+"-"+date.day;
            document.getElementById("datePicker").value = str;
            document.getElementById("days").innerText = getdays(new Date(document.getElementById("datePicker").value).getDay());
            ajaxMethod(str);
        }
        function plusDate(){
            // 날짜 플러스
            var value = new Date(document.getElementById("datePicker").value);
                value = new Date(value.getFullYear(), value.getMonth(), value.getDate()+1);
            var date = dateset(value.getDate(), value.getMonth()+1);
            var str = value.getFullYear()+"-"+date.month+"-"+date.day;
            document.getElementById("datePicker").value = str;
            document.getElementById("days").innerText = getdays(new Date(document.getElementById("datePicker").value).getDay());
            ajaxMethod(str);
        }
    </script>
    

    <jsp:include page="../common/approvalNavbar.jsp"/>
    <jsp:include page="sidebar.jsp" />
    <div class="wrap">
        <h4>회의실 예약</h4>
        <div id="datepick" align="center">
            <button type="button" class="btn1-light" onclick="minusDate();">
            <span class="material-icons">arrow_left</span></button>
            <span id="days" style="display: inline;"></span>
            <input type="date" id="datePicker" style="margin-left: 0px;">
            <button type="button" class="btn1-light" onclick="plusDate();"><span class="material-icons">arrow_right</span></button>
            <button type="button" class="btn1" onclick="getToday();">Today</button>
        </div>
        <div id="floor">
            <ul>
            	<c:forEach var="i" begin="3" end="8">
	                <li><a href="reservation.re?floor=${ i }">${ i }층</a></li>
            	</c:forEach>
            </ul>
        </div>
        
        <div id="tablewrap" class="tablewrap" align="center">
            <table border="1" bordercolor="lightgray">
                <thead>
                    <tr>
                        <th width="60px"></th>
                        <th width="150px" data-toggle="tooltip" title="6인, 화이트보드, 노트북">소회의실 1</th>
                        <th width="150px" data-toggle="tooltip" title="8인, 화이트보드, 노트북">소회의실 2</th>
                        <th width="150px" data-toggle="tooltip" title="15인, 화이트보드, 노트북">중회의실</th>
                        <th width="150px" data-toggle="tooltip" title="30인, 화이트보드, 노트북, 빔프로젝터">대회의실</th>
                        <th width="150px" data-toggle="tooltip" title="50인, 탁상마이크, 노트북, 빔프로젝터">중역회의실</th>
                    </tr>
                </thead>
                <tbody align="center">
	                <c:forEach var="t" begin="9" end="18">
	                    <tr>
	                    <c:choose>
		                	<c:when test="${t == 9 }">
								<th>09:00</th>
		                	</c:when>
		                	<c:otherwise>
		                        <th>${t}:00</th>
		                	</c:otherwise>
	                    </c:choose>
		                    <td></td>			<!-- 소회의실 1 -->
	                        <td></td>			<!-- 소회의실 2 -->
	                        <td></td>			<!-- 중회의실 -->
	                        <td></td>			<!-- 대회의실 -->
	                        <td></td>			<!-- 중역회의실 -->
	                    </tr>
	                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    <script type="text/javascript">
    	
    	function ajaxMethod(date){
			// 행
			var col = $("#tablewrap>table tbody>tr");
			// 열
			var row = $("#tablewrap>table tbody>tr>td");
    		$.ajax({
    			url:"ajaxselect.re",
    			data:{floor: ${floor}, date: date},
    			success:function(list){
    				row.removeAttr("style");
    				if(list != null){
    					// 행개수
						var index = $("#tablewrap>table tbody>tr").length;
							for(var i in list){
								for(var j=0; j<index; j++){
									var timetable = $("#tablewrap>table tbody").children().eq(j).children().eq(0).text().substring(0,2);
		    						//시간
		    						var stime = list[i].startPeriod.substring(13,15);
		    						var etime = list[i].endPeriod.substring(13,15);
		    						// 날짜
		    						var day = list[i].startPeriod.replaceAll('/', '-').substring(0,10);
		    						// 방
		    						var room = list[i].room;
		    						for(var k=stime; k<etime; k++){
			    						if(day == date && k == timetable){
				    						switch(room){
				    						case "소회의실 1": col.eq(j).children().eq(1).css("background","lightpink"); break;
				    						case "소회의실 2": col.eq(j).children().eq(2).css("background","lightyellow"); break;
				    						case "중회의실": col.eq(j).children().eq(3).css("background","lightblue"); break;
				    						case "대회의실": col.eq(j).children().eq(4).css("background","lightgreen"); break;
				    						case "중역회의실": col.eq(j).children().eq(5).css("background","lightgray"); break;
				    						}
			    						}
		    						}
								}
	    					}
    				}
    			},error:function(){
    					console.log("통신실패");
    			}
    		})
    	}
    </script>
</body>
</html>