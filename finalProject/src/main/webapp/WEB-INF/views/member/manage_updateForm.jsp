<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 수정 페이지</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/v4-shims.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>

<style>
  /* rgb(52, 152, 219) --> 사이트 색상 */
 *{ 
     margin: 0;
     padding: 0;
     
     box-sizing: border-box;
 }

.wrap{width: 100%; 
      height: 100%;
      display: flex;
     
    }
 /* 작성하기 버튼 */
.writeButton{text-align: center;}

.button1{
   border-radius: 10px;
   border: 0;
   width: 250px;
   height: 45px;
   font-size: larger;
   color: white;
   background-color: rgb(84, 129, 189);
   
            }

.button1:hover{
   cursor: pointer;
   background-color: rgb(27, 97, 189);
   
            }


/* 콘텐츠 영역 */

.content{
   
    width:100%;
    margin-left: 300px;
    
    display:block;
    margin-top: 50px;

}

.content_1{height: fit-content; margin-left: 40px; width: fit-content;}

.content_2{height: fit-content; align-content: center; position: relative;}

.content_3{height: fit-content; padding-left: 50px;}

.w3-bar{height: fit-content; text-align: center;}

.content_1:hover{cursor: pointer;}

table{
    width: 95%;
    height: 80%;
    border-collapse: collapse;
    border-spacing: 0;
    background: #fafafa;
    text-align: center;
}
th{background: #e7e1e1;}

th,td{
    padding: 10px 15px;

}

tbody tr:hover{background-color: rgb(52, 152, 219); color: white;}

/* 문서양식 드롭다운 */
.formtype{
    border: 1px solid darkgray;
    width: 150px;
    height: 170px;
    background-color: white;
    text-align: center;
    font-size: 15px;
    z-index: 1000;
    display: none;
    margin-left: 50px;
    position: absolute;
    
    
}
.formtype div{
    margin-top: 10px;
    
}

.formtype div:hover{
    background-color: rgb(204, 198, 198);
}
.formtype a{
    text-decoration: none;
    color: rgb(61, 56, 56);
    
}
.search #selectList{width: 100px;}
.search #selectList,#keyword{ 
    height: 40px; 
    border: 1px solid #e7e1e1; 
    border-radius: 5px;
}
.search button{
    height: 40px;
    width: 60px; 
    background-color: rgb(52, 152, 219); 
    color: white;
    border: 1px solid #e7e1e1; 
    border-radius: 5px;
}
.search button:hover{
    background-color: #e7e1e1;
    color: rgb(52, 152, 219);}
/* div{border: 1px solid red;} */
    .enroll{width: 80%; height: 1000px; margin: auto;}
    .enroll>.con1,.con2{width: 100%;}
    .con1{height: 20%;}
    .con2{height: 30%;}
    .con2>#con2,.img{height: 100%; float: left; box-sizing: border-box;}
    #con2{width: 65%;}
    .img{width: 35%;}

    .enroll{font-size: 20px;}
    .enroll input{width: 300px; height: 30px;}

    .enroll select{width: 160px; height: 30px;}
    #idCheck,#pwdCheck{font-size: 15px;}
    .enroll textarea{resize: none; width: 100%;}
    .enroll button{margin-left: 20px;}
</style>
</head>
<body>
	<div class="wrap">
	<jsp:include page="../common/approvalNavbar.jsp"/>
        
        <jsp:include page="../common/sideBar_manage.jsp"/>

        <div class="content"><br><br><br>
            <div class="content_1">
                <h2>사원 정보 수정</h2>
            </div>
            <br><br>
            <form action="update.ma" method="POST" name="enrollForm" id="enrollForm" enctype="multipart/form-data">
            	<input type="hidden" name="memNo" value="${ m.memNo }">
                <div class="enroll">
                    <div class="con1">
                            아이디 <input type="text" name="memId" placeholder="사용할 아이디를 입력해주세요" value="${ m.memId }" readonly><br>
                            <div id="idCheck">사용가능한 아이디 입니다.</div>
                            <br>
                            비밀번호 <input type="password" name="memPwd" placeholder="사용할 비밀번호를 입력해주세요." value="${ m.memPwd }">
                            <br><br>
                            비밀번호 확인 <input type="password" name="checkPwd" placeholder="비밀번호를 다시 입력해주세요" value="${ m.memPwd }"><br>
                            <div id="pwdCheck">수정할 비밀번호를 입력해주세요</div>
                            <br><br>
                    </div>
                    <hr>
                    <div class="con2">
                        <div id="con2">
                            이름 <input type="text" name="memName" placeholder="이름을 입력해주세요." value="${ m.memName }">
                            <br><br>
                            생년월일 <input type="text" name="birth" placeholder="생년월일(YYYY-MM-DD" value="${ m.birth }">
                            <br><br>
                            성별 <select name="gender" id="gender" selected="${ m.gender }">
                                <option>--성별 선택 --</option>
                                <option value="M" <c:if test="${ m.gender == 'M' }">selected</c:if>>남(M)</option>
                                <option value="F" <c:if test="${ m.gender == 'F' }">selected</c:if>>여(F)</option>
                            </select>
                            <br><br>
                            전화번호 <input type="text" name="phone" placeholder="010)0000-0000" value="${ m.phone }">
                            <br><br>
                            이메일 <input type="email" name="email" placeholder="ex)aaa@aaaaa.com"value="${ m.email }">
                            <br>
                        </div>
                        <div class="img" align="center">
                            <div class="profile" id="profile" style="width: 70%; height: 100%; border: 1px dotted gray;">
                        	<img src="${ m.memImg }" style="height:100%; width:100%;">
                            </div>
             *프로필 이미지 <br><input type="hidden" name="memImg" value="${ m.memImg }">
                            <input type="file" name="reprofile" id="reprofile" onchange="preview(this);" accept="image/*">
                        </div>
                    </div>
                    <div class="con3">
           *소속 부서 <select name="deptCode" id="deptCode" required>
	           			<option value="">--부서 선택--</option>
	           			<option value="D1" <c:if test="${ m.deptCode == 'D1' }">selected</c:if>>개발</option>
	                    <option value="D2" <c:if test="${ m.deptCode == 'D2' }">selected</c:if>>인사</option>
	                    <option value="D3" <c:if test="${ m.deptCode == 'D3' }">selected</c:if>>경영지원</option>
	                    <option value="D4" <c:if test="${ m.deptCode == 'D4' }">selected</c:if>>기획</option>
	                    <option value="D5" <c:if test="${ m.deptCode == 'D5' }">selected</c:if>>총무</option>
           			</select>
           			<br><br>
           			
           	*직급 <select name="jobCode" id="jobCode" required>
	           			<option value="">--직급 선택--</option>
	           			<option value="J0" <c:if test="${ m.jobCode == 'J0' }">selected</c:if>>계약직</option>
	                    <option value="J1" <c:if test="${ m.jobCode == 'J1' }">selected</c:if>>사원</option>
	                    <option value="J2" <c:if test="${ m.jobCode == 'J2' }">selected</c:if>>대리</option>
	                    <option value="J3" <c:if test="${ m.jobCode == 'J3' }">selected</c:if>>과장</option>
	                    <option value="J4" <c:if test="${ m.jobCode == 'J4' }">selected</c:if>>차장</option>
	                    <option value="J5" <c:if test="${ m.jobCode == 'J5' }">selected</c:if>>부사</option>
	                    <option value="J6" <c:if test="${ m.jobCode == 'J6' }">selected</c:if>>이사</option>
	                    <option value="J7" <c:if test="${ m.jobCode == 'J7' }">selected</c:if>>대표이사</option>
           			</select>
           			<br><br>
           	*입사일 <input type="text" name="enrollDate" placeholder="입사일(YYYY-MM-DD)" value="${ m.enrollDate }" required>
           	<br><br>
                        주소 <input type="text" name="address" placeholder="거주지 주소를 입력해주세요." value="${ m.address }">
                        <br><br>
                        자격증<br> 
                        <textarea name="certification" id="certification" rows="3" placeholder="소지하고 있는 자격증 현황."">${ m.certification }</textarea>
                        <br><br>
                        경력 사항<br>
                        <textarea name="career" id="career" rows="3" placeholder="참여했던 프로젝트 및 경력사항" >${ m.career }</textarea>
                    </div>
                        <br>
                        <div align="center">
                            <button type="submit">사원 정보 수정</button>
                            <button type="reset">초기화</button>
                        </div><br><br>
                </div>
            </form>
            </div>
            <br><br><br><br>
        </div>
    </div>

	<!-- 아이디 중복 체크 -->
    <script>
    	$(function(){
    		var idInput = $("#enrollForm input[name=memId]");
    		
    		idInput.keyup(function(){
    			if(idInput.val().length >=5){
    				$.ajax({
    					url:"idCheck.ma",
    					data:{memId:idInput.val()},
    					type:"post",
    					success:function(count){
    						if(count == 1){
    							$("#idCheck").show();
    							$("#idCheck").css("color", "red").text("이미 사용중인 아이디입니다. 다른 아이디를 입력해주세요 :(");
    							$("enrollBtn").attr("disabled",true);
    						}else{
    							$("#idCheck").show();
    							$("#idCheck").css("color","green").text("사용가능한 아이디입니다. :)");
    							$("#enrollBtn").removeAttr("disabled");
    						}
    					},error:function(){
    						console.log("idCheck ajax filed");
    					}
    				})
    			}else if(idInput.val().length < 5){
    				$("#idCheck").show();
					$("#idCheck").css("color", "blue").text("<아이디 체크 5글자 이상>");
    			}else{
    				$("#idCheck").hide();
    				$("#enrollBtn").attr("disabled",true);
    			}
    		})
    	})
    </script>
    
    <!-- 비밀번호 일치 확인 -->
    <script>
    	$(function(){
    		var inputPwd = $("#enrollForm input[name=memPwd]");
    		var checkPwd = $("#enrollForm input[name=checkPwd]");
    		
    		checkPwd.keyup(function(){
    			if(checkPwd.val().length >= 5){
    				//console.log("비밀번호 입력 값 : ", inputPwd.val());
    				//console.log("비밀번호 일치 값 : ", checkPwd.val());
    				if(inputPwd.val() == checkPwd.val()){
    					$("#pwdCheck").show();
    					$("#pwdCheck").css("color","green").text("비밀번호가 일치합니다. :)");
    					$("enrollBtn").removeAttr("disabled");
    				}else{
    					$("#pwdCheck").show();
    					$("#pwdCheck").css("color","red").text("비밀번호가 일치하지 않습니다. :(");
    					$("enrollBtn").attr("disabled",true);    							
    				}
    			}else if(checkPwd.val().length < 5){
    				$("#pwdCheck").show();
					$("#pwdCheck").css("color","blue").text("<비밀번호 체크 5글자 이상>");
    			}
    		})
    	})
    </script>

  <!-- 사원 프로필 이미지 미리보기 -->
   <script>
   		function preview(inputFile){
   			console.log("파일있나",inputFile.files.length);
   			
   			if(inputFile.files.length == 1){
   				
   				var reader = new FileReader();
   				
   				reader.readAsDataURL(inputFile.files[0]);
   				
   				reader.onload = function(e){
   					//alert("확인용");
   					$("#profile").html('<img src="' + e.target.result + '" width="100%" height="100%">');
   				};
   				
   			}else{
   				
   			}
   		}
   </script>
   
   <script>

    $(document).ready(function(){
        $(".profile>a").click(function(){
            var submenu = $(this).next();
            if(submenu.css("display") == 'block'){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
            
        });
    });

  </script>

	<script>
	
	    $(document).ready(function(){
	        $(".content_1").click(function(){
	            var submenu = $(".formtype");
	            if(submenu.css("display") == 'none'){
	                submenu.show();
	            }else{
	                submenu.hide();
	            }
	            
	        });
	    });
	
	  </script>
</body>
</html>