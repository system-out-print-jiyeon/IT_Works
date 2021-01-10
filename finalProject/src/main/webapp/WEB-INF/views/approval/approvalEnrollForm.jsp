<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>approvalEnrollForm</title>
   
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/v4-shims.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
  
  
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  



<style>
  
 *{ 
     margin: 0;
     padding: 0;
     
     box-sizing: border-box;
 }

.wrap{width: 100%; 
      height: 100%;
      display: flex;
       
      
    
    }
 


/* 문서작성폼 */
.enrollForm{
    margin-left: 300px;
     margin-top: 120px;
    
}

.titleBox{
    margin-left: 30px; 
    position: relative;
}



.infoTable{
    border-collapse: collapse;
    width: 800px;
    height: 100px;
    
}

.infoTable th{
    background-color: #e7e1e1;
}

.infoTable td{
    padding-left: 20px;
}

.approvalLine{
    margin-left: 30px;
}
.approvalTable{
    border-collapse: collapse;
    width: 800px;
    height: 200px;
}

.approvalTable th{
    background-color:  #e7e1e1;
    width: 80px;
}

.mainTitle{
    height: 150px;
}

.secondTitle{
    height: 40px;
}

.firstCell{
    height: 40px;
}

.secondCell{
    height: 80px;
}

.thirdCell{
    height: 40px;
}

/* 기안하기 버튼 */

.submitButton{
    padding: 30px;
    padding-bottom: 100px;
    text-align: center;
    
}

.submitButton button{
    width: 150px;
    height: 50px;
    background-color: #e7e1e1;
    border-radius: 10px;
    border-style: none;
}

/* 써머노트 */
.detailContents{
    margin-left: 30px;
}

/* 결재선 모달  */

.modalDiv{
        margin: 50px;
        background-color: white;
        border: 1px solid  #878787;
        width: 900px;
        height: 600px;
        box-sizing: border-box;
        z-index: 10000;
        position: absolute;
        top: 15%;
        left: 20%;
        display: none;
        
        
       
    }
    .modalDiv_1{
        
        margin-top: 20px;
        margin-bottom: 20px;
        margin-left: 30px;
        color: rgb(73, 174, 233); 
        
    }

    .modalCancel:hover{
        cursor: pointer;
    }

    .modalDiv_2{
        height: 5%;
    }

    .modalDiv_3{
        height: 75%;
    }

    .modalDiv_3_1{
        width: 25%;
        position: relative;
    }

    .modalDiv_3_1_1{
        width: 88%;
        height: 98%;
        border: 1px solid #878787;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        overflow: scroll;
    }

    .modalDiv_3_1_1 div{
        margin-left: 5px;
        margin-top: 5px;
        cursor: pointer;
        width: fit-content;
        
    }

    .modalDiv_3_1_1 div div{
        margin-left: 15px;
        
    }


    .modalDiv_3_2{
        width:15%;
        display: block;
        text-align: center;

        
        
    }

    .modalDiv_3_2 button{
        width: 100px;
        height: 40px;
        margin-top: 20px;
        margin-bottom: 20px;
        vertical-align: middle;
		cursor: pointer;
        
        
        
    }

    .modalDiv_3_3{
        width:60%;
        
    }

    .modalDiv_3_3_1{
        width: 97%;
        height: 72.5%;
        border: 1px solid #878787;
        overflow: scroll;
       
        

    }

    .modalDiv_3_3_2{
     
    }

    .modalDiv_3_3_3{
        width: 97%;
        height: 15%;
        border: 1px solid #878787;
    }

    .modalDiv_4{
        height: 10%;
        text-align: center;
    }

    .modalDiv_4 button{
        margin-top: 5px;
        margin-left: 20px;
        margin-right: 20px;
        cursor: pointer;
    }

    .table1{
        border:1px solid  #878787;
        text-align: center;
        
    }

    .table1 tr{
        height: 50px;
        
    }

    .table1 tr:hover{
        background-color:#e7e1e1 ;
        cursor: pointer;
        
    }

    .th_numbering{
        width: 30px;
        
        
    }
    
    .th_category{
        width: 70px;
        border-right-style: hidden;
    }

    .td_nameSpace{
        width: 150px;
        
    }
    
    .td_nameSpace2{
        width: 350px;
        text-align: left;
        
    }


    .td_reference{
        background-color: #e7e1e1;
        width: 130px;
        height:55px;
        text-align: center;
        border: 3px solid white;
        cursor: pointer;

    }
    
    .referenceCell span{
    
    	margin-left:15px;
    	margin-right:15px;
    	padding:5px;
    	background-color: #e7e1e1;
    
    
    }
    
    
   

    /* dim */

    .dim{
        position: fixed;
        left: 0;
        top: 0;
        z-index: 900;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        display: none;
    }
</style>

</head>

  
  
<body>


	<jsp:include page="../common/approvalNavbar.jsp"/>

<div class="wrap">
        
    <jsp:include page="../common/sideBar_approval.jsp"/>
        
        
        <form name="enrollForm" action="insert.ap" method="POST">
        <div class="enrollForm" id="enrollForm">

            <div class="titleBox">
                <h5>기본 설정</h5>
                <table class="infoTable" border="1px">
                    <tr>
                        <th>문서 종류</th>
                        <td>  <select name="docForm" id="formCategory">
                                <option value="selectOption">&nbsp;선택</option>
                                <option value="1">지출 결의서</option>
                                <option value="2">문서 발급 요청서</option>
                                <option value="3">프로젝트 업무 보고서</option>
                                <option value="4">품의서</option>
                            </select> 
                        </td>
                        <th>작성자</th>
                        <td> ${ loginUser.memName }</td>
                        <input type="hidden" name="memNo" id="memNo" value="${ loginUser.memNo }">
                    </tr>
                    <tr>
                        <th>보존 연한</th>
                        <td>
                            <select name="docRetention" id="docRetention">
                                <option value="">&nbsp;보존 연한</option>
                                <option value="1">1년</option>
                                <option value="3">3년</option>
                                <option value="5">5년</option>
                            </select> 
                        </td>
                        <th>보안 등급</th>
                        <td>
                            <select name="docGrade" id="docGrade">
                                <option value="">&nbsp;보안 등급</option>
                                <option value="S">S 등급</option>
                                <option value="A">A 등급</option>
                                <option value="B">B 등급</option>
                                <option value="C">C 등급</option>
                            </select> 
                        </td>
                    </tr>
                </table>
            </div>

            <div class="formInfo">

            </div>

            <div class="titleBox" style="display: flex; margin-left: 30px;">
                <h5>결재선</h5> <a class="modalOpen"><h6 style="margin-left: 40px; color: rgb(73, 174, 233); cursor:pointer;">결재선 설정</h6> </a>
            </div>

            <div class="approvalLine">
              <table class="approvalTable" border="1px">
                <tr>
                    <th rowspan="3" class="mainTitle">결재</th>
                    <th class="firstCell">1 경영지원팀</th>
                    <th class="firstCell">2 총무팀</th>
                    <th class="firstCell">3 개발팀</th>
                    <th class="firstCell">4 기획팀</th>
                    <th class="firstCell">5 경영지원팀</th>
                    <th class="firstCell">6 개발팀</th>
                    <th class="firstCell">7 인사팀</th>
                </tr>
                <tr>
                    <td class="secondCell"></td>
                    <td class="secondCell"></td>
                    <td class="secondCell"></td>
                    <td class="secondCell"></td>
                    <td class="secondCell"></td>
                    <td class="secondCell"></td>
                    <td class="secondCell"></td>
                    
                </tr>
                <tr style="text-align:center;">
                    <td class="thirdCell">과장 노옹철</td>
                    <td class="thirdCell">과장 심봉선</td>
                    <td class="thirdCell">과장 정중하</td>
                    <td class="thirdCell">차장 이오리</td>
                    <td class="thirdCell">차장 전지연</td>
                    <td class="thirdCell">이사 선동일</td>
                    <td class="thirdCell">대표이사 홍길동</td>
                    
                </tr>
                
                <tr>
                    <th class="secondTitle">참조</th>
                    <td class="referenceCell" colspan="7" style="text-align:center;">
                    	<span> <b>인사팀</b> 과장 박나라</span>
                    	<span><b>총무팀</b> 과장 심봉선</span>
                    	<span><b>개발팀</b> 대리 대북혼</span>
                    	<span><b>기획팀</b> 과장 김해술</span>
                    </td>
                    
                </tr>
            </table>
            </div>

            <div class="titleBox">
               <h5>제목</h5> 
            </div>
                
            <div class="inputTitle">
                <input type="text" style="width: 800px; margin-left: 30px;" name="docTitle">
            </div>

            <div class="titleBox">
               <h5>상세 입력</h5> 
            </div>

            <div class="detailContents">
										
                <textarea id="summernote" name="docContents">
             
             		
				
            
					
                             
                </textarea> 
                
               


            </div>

            <div class="attachment" style="border:dashed; width: 800px; margin: 30px;  ">
              <div style="height:80px; display: flex; ">
                <span><h5 style="margin: 30px;">별첨</h5></span>
                <!-- <span><h6 style="margin-top: 30px; margin-bottom: 30px; color: rgb(73, 174, 233); /* border-right: 1px solid#878787; */"><label for="upfile" style="cursor: pointer;">파일 첨부 </label>&nbsp;</h6></span>  -->
               <!--  <span><h6 style="margin-top: 30px; color: rgb(73, 174, 233);">&nbsp;&nbsp;관련문서 첨부</h6> </span>  -->
               <!--  <span><h6 style="margin-top: 30px; margin-bottom: 30px; margin-left: 100px; text-align: center; color: #878787;" >여기로 파일을 끌어놓으세요</h6></span> -->
                <input type="file" id="upfile" name="upfile" style="margin-top:27px;" >
                <!-- <span sytle><i class="far fa-file-alt">&nbsp;파일이름</i></span><br> -->
                <!-- <span><i class="far fa-file-alt">&nbsp;파일이름</i></span><br> -->
                <!-- <span><i class="far fa-file-alt">&nbsp;파일이름</i></span><br> -->
               </div> 
               
                <div style="margin-left:80px">
                
                
               
                
                 
                
                
                </div>

            </div>
            

            <div class="submitButton">
                <button type="submit">기안하기</button>
            </div>


        </div>
        
         </form>

        
        
        

        

    </div>
    
    
 	<form name="modalForm" action="approval.me" method="get">
    <div class="modalDiv">
        <div class="modalDiv_1">
            <span>결재선 설정</span> 
            <span class="modalCancel"><i class="fas fa-times fa-2x" style="color: #878787; float: right; margin-right: 10px; cursor: pointer; "></i></span>
        </div>
			
        <div class="modalDiv_2">
            <input type="text" placeholder="이름, 조직 검색" style="margin-left: 12px; width: 180px; height: 20px;" > &nbsp;<i class="fas fa-redo"></i>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;결재
            <select name="" id="" style="float: right;  margin-right: 30px; width: 180px; height: 25px;" >
                <option value="">자주 쓰는 결재선</option>
                <option value="">자주 쓰는 결재선1</option>
                <option value="">자주 쓰는 결재선2</option>
                <option value="">자주 쓰는 결재선3</option>
            </select>
        </div>

        <div class="modalDiv_3" style="display: flex;">

            <div class="modalDiv_3_1">
                <div class="modalDiv_3_1_1">
                    <div class="modalDiv_business"><i class="fas fa-plus-circle"></i> 경영지원팀(${ bCount })
                        
                    </div>
                        <div class="member1" style="display: none;">
                         <c:forEach var="m" items="${ bList }">
                            <div><input type="radio" name="radioBox" class="checkPerson" value="${ m.deptName}팀 ${ m.jobName} ${ m.memName}"> ${ m.jobName} ${ m.memName}</div>
                          </c:forEach>  
                        </div>
                    <div class="modalDiv_personnel"><i class="fas fa-plus-circle"></i> 인사팀(${ pCount })
                        
                    </div> 
                    		<div class="member2" style="display: none;">
                    		<c:forEach var="m" items="${ pList }">
                            <div><input type="radio" name="radioBox" class="checkPerson" value="${ m.deptName}팀 ${ m.jobName} ${ m.memName}"> ${ m.jobName} ${ m.memName}</div>
                             </c:forEach>  
                        </div>
                    <div class="modalDiv_accounting"><i class="fas fa-plus-circle"></i> 총무팀(${ aCount })
                        
                    </div>
                    		<div class="member3" style="display: none;">
                    		<c:forEach var="m" items="${ aList }">
                            <div><input type="radio" name="radioBox" class="checkPerson" value="${ m.deptName}팀 ${ m.jobName} ${ m.memName}"> ${ m.jobName} ${ m.memName}</div>
                             </c:forEach> 
                        </div>
                    <div class="modalDiv_developer"><i class="fas fa-plus-circle"></i> 개발팀(${ dCount })
                        
                    </div>
                    		<div class="member4" style="display: none;">
                    		<c:forEach var="m" items="${ dList }">
                            <div><input type="radio" name="radioBox" class="checkPerson" value="${ m.deptName}팀 ${ m.jobName} ${ m.memName}"> ${ m.jobName} ${ m.memName}</div>
                            </c:forEach> 
                        </div>
                    <div class="modalDiv_planning"><i class="fas fa-plus-circle"></i> 기획팀(${ plCount })
                        
                    </div>
                    
                    <div class="member5" style="display: none;">
                    		<c:forEach var="m" items="${ plList }">
                            <div><input type="radio" name="radioBox" class="checkPerson" value="${ m.deptName}팀 ${ m.jobName} ${ m.memName}"> ${ m.jobName} ${ m.memName}</div>
                             </c:forEach> 
                        </div>
                </div>
            </div>
            <div class="modalDiv_3_2">
                <button id="moveCheckedButton1" type="button" style="margin-top: 140px;">결재 <i class="fas fa-chevron-right" style="float: right; margin-right: 10px; margin-top: 1px;"></i></button>
               
                <button id="moveCheckedButton2" type="button">참조 <i class="fas fa-chevron-right" style="float: right; margin-right: 10px; margin-top: 1px;"></i></button>
            </div>
            <div class="modalDiv_3_3">
                <div class="modalDiv_3_3_1">
                    <table class="table1" id="appendLineTable" border="1px" style="border-collapse: collapse;">
                        
                       
                    </table>
                </div>
                <div class="modalDiv_3_3_2"  style="margin-top: 13px; margin-bottom: 13px;">
                    <p>참조</p>
                </div>
                <div class="modalDiv_3_3_3">
                    <table  >
                        <tr id="referenceLineTable">
                           
                           
                            
                        </tr>
                    </table>

                </div>
            </div>

        </div>

        <div class="modalDiv_4">
            <button style="width: 80px; height: 40px;">확인</button>
            <button style="width: 80px; height: 40px;" class="modalCancel">취소</button>
        </div>
        
    </div>
    </form>


    <div class="dim"></div>
    
    
    <script>
    
		/* 써머노트 */
		$('#summernote').summernote({
		    
			
		    tabsize: 2,
		    width:800,
		    height: 500,
		    toolbar: [
		      ['style', ['style']],
		      ['font', ['bold', 'underline', 'clear']],
		      ['color', ['color']],
		      ['para', ['ul', 'ol', 'paragraph']],
		      ['table', ['table']],
		      ['insert', ['link', 'picture', 'video']],
		      ['view', ['fullscreen', 'codeview', 'help']]
		    ]
		  });
		
	</script>

   <script>

   			/* 문서 종류 선택시 에디터적용 */
		$('#formCategory').change(function(){
	    	var formList = $("#formCategory option:selected").val();
	    	
	    	$.ajax({
				url:"docList.me", 
				data:{selectoption : formList},
				type:"post",
				success:function(data){
					
					
					
					$('.note-editable').html(data);
					
				},error:function(){
					$('.note-editable').html("");
					
				}
			});
	    });

  </script>

  <script>
  
  $(document).ready(function () {
      $('#moveCheckedButton1').click(function () {
        // 결재버튼 누르면 결재 div로 사원 넘김
        
        var arr = new Array();
        
        var checkedCount = $('input[class="checkPerson"]:checked').length;
        
        
        var size = document.getElementsByClassName("checkPerson").length;

        
        
        

        	for(var i=0; i<size; i++){
                if(document.getElementsByClassName("checkPerson")[i].checked == true){
                	console.log(document.getElementsByClassName("checkPerson")[i].value);
                	createItem();
                }
                
            }


       
        		
        		
        
       
      });

      $('#moveCheckedButton2').click(function () {
    	// 참조버튼 누르면 참조 div로 사원 넘김
    	
    	 var arr = new Array();
    	
    	 var checkedCount = $('input[class="checkPerson"]:checked').length;
    	
    	 var size = document.getElementsByClassName("checkPerson").length;

         
         
         

     	for(var i=0; i<size; i++){
             if(document.getElementsByClassName("checkPerson")[i].checked == true){
             	console.log(document.getElementsByClassName("checkPerson")[i].value);
             	createItem2();
             }
             
         }

        
      });
    });
  
  
  
  /** 결재선 순서 조정 */
  function reorder() {
      $(".table1").each(function(i, box) {
          $(box).find(".th_numbering").html(i + 1);
      });
  }
 
  /** 결재선 추가 */
  function createItem() {
      
	  
	  $(createBox())
      .appendTo("#appendLineTable")
      .hover(
          function() {
              $(this).css('backgroundColor', '#e7e1e1');
              $(this).find('#xBox').show();
          },
          function() {
              $(this).css('background', 'none');
              $(this).find('#xBox').hide();
          }
      )
  		
  		.find("#xBox").click(function() {
          var valueCheck = false;
          $(this).parent().find('tr').each(function() {
              if($(this).attr("number") != "type" && $(this).val() != '') {
                  valueCheck = true;
              }
          });

          if(valueCheck) {
              var delCheck = confirm('입력하신 내용이 있습니다.\n삭제하시겠습니까?');
          }
          if(!valueCheck || delCheck == true) {
              $(this).closest('tr').remove();
               reorder();
          }
      });
      // 숫자를 다시 붙인다.
      reorder();
  }
  
  

  /** 결재선 컬럼 작성 */
  function createBox() {
      var createLine = 	"<tr>"
                   + "<th class='th_numbering'></th>"
                   + "<th class='th_category'>결재</th>"
                   + "<td class='td_nameSpace' style='border-right-style:hidden;'>"
                   + $('input:radio[class="checkPerson"]:checked').val()
                   + "</td>"
                   + "<td colspan='2' class='td_nameSpace2'>"
                   + "<i class='fas fa-times' id='xBox' style='float:right; margin-right:10px;'></i>"
                   + "</td>"
                   + "</tr>";
      return createLine;
  }
  
  /** 참조 추가 */
  function createItem2() {
      $(createBox2())
      .appendTo("#referenceLineTable")
      .hover(
          function() {
              
              $(this).find('#xBox2').css("visibility","visible");
          },
          function() {
             
              $(this).find('#xBox2').css("visibility","hidden");
          }
      )
  		
  		.find("#xBox2").click(function() {
          var valueCheck = false;
          $(this).parent().find('td').each(function() {
              if($(this).attr("number") != "type" && $(this).val() != '') {
                  valueCheck = true;
              }
          });

          if(valueCheck) {
              var delCheck = confirm('입력하신 내용이 있습니다.\n삭제하시겠습니까?');
          }
          if(!valueCheck || delCheck == true) {
              $(this).parent().remove();
              // reorder();
          }
      });
      // 숫자를 다시 붙인다.
      //reorder();
  }

  /** 참조 박스 작성 */
  function createBox2() {
      
	  var createLine = "<td class='td_reference'  style='text-align: center;'>"
                     + " &nbsp;  &nbsp;참조<i class='fas fa-times' id='xBox2' style='float:right; margin-right:10px; margin-top:5px;'></i><br>"
                     + $('input:radio[class="checkPerson"]:checked').val()
                     + "</td>";
                   
      return createLine;
  }
  
  
  
 
  

 

  </script>


  


</body>
</html>