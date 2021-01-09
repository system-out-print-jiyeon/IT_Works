<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="preconnect" href="https://fonts.gstatic.com">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <link href="https://fonts.googleapis.com/css2?family=Amiri:wght@700&display=swap" rel="stylesheet">
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/v4-shims.css">
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<style>
       *{
          border: 1px solid red;
      }  
      .wrap{width: 100%; 
            height: 100%;
            display: flex;
          }
      
       .titleBar{text-align: center;}
      
      .titleArea{
         border-radius: 10px;
         border: 0;
         width: 250px;
         height: 45px;
         font-size: larger;
         color: white;
         background-color: rgb(84, 129, 189);
         padding-top: 10px;
      }
     
      /*선택된메뉴*/
	  .selectedTitle{
	    background-color: rgba(76, 135, 212, 0.616);
	    border-radius: 10px;	
	  }  
        
      
      
      /**** 컨텐트 ****/
      .contentArea{width: 80%; height: 1200px;margin-top: 80px; margin-left:300px;}
      
      
      
		.tool_bar1{
		    width: 100%;
		    height: 40px;
		    margin-top: 30px; 
		    position: relative;
		    padding-left:20px;
		}
		      
      
      .content1{
          width: 100%;
          height: 100%; 
          float: left;
          padding: 40px;
      }
      .nameBar{
          padding: 20px;
      }
      .nameBar h5{
          font-weight: 900;
      }
      
      .insert{
      	  float:right;
      	  padding-right:20px;
      }
      
      /* 테이블 */
      .businessTableArea{
          padding: 20px;
      }
      .tdTitle td{
          text-align: center;
          background: lightgray;
      }
      #businessTable tr td{
          text-align: center;
      }
      tbody tr td:hover{
      		cursor:pointer;
      }
      #workListTable tbody tr:hover{cursor:pointer;}
      /* 페이징 */
      .paginationBar{
          align-items: center;
      }
</style>
       
</head>
<body>

 	<jsp:include page="../common/navbar.jsp"/>
 	<jsp:include page="board_sidebar.jsp"/>
 	


            <div class="contentArea">


                <div class="content1">
                    <br>
                    <div class="nameBar"><h1>전체 게시판<small>(자유)</small></h1> </div>
                    <section class="tool_bar1">
		                 <div class="submit_btn">
	                        <input type="checkbox" id="checkall" value=""> 
	                        <label class="update" for="checkall">전체선택</label>
	                        <!-- <label class="update"><button type="submit" disabled="true" onclick='btn_click("important");'><i class="fa fa-star"></i> 중요</button></label> -->
	                        <label class="update"><button type="submit" disabled="true" onclick='btn_click("delete");' id="deletebtn"><i class="fa fa-trash"></i> 삭제</button></label>
	                        <label class="insert"><button type="submit" onclick='btn_click("insert");' id="insertbtn" class="btn btn-primary"><i class="fas fa-pencil-alt"></i> 새글쓰기</button></label>             
	                    </div>                               
		            </section>
                    <div class="businessTableArea">
                        <table id="free-boardList" class="table">
		                 <thead>
		                    <tr align="center">
		                        <th></th>
		                        <th>번호</th>
		                        <th>제목</th>
		                        <th>작성자</th>
		                        <th>작성일</th>
		                        <th>조회</th>                             
		                    </tr>
		                </thead>
		                <tbody align="center">
		                <c:forEach var="fb" items="${ list }">
		                    <tr>
		                        <th width="30px"><input type="checkbox" id="checkedAll" name="bono"></th>
		                        <td class="fbno">${fb.fBoardNo }</td>
		                        <td>${fb.fBoardTitle }</td>
		                        <td>${fb.memName }</td>
		                        <td>${fb.fCreateDate }</td>
		                        <td>${fb.fCount }</td>
		                    </tr>
		                    
		                </c:forEach>
		                </table>
                        
          <!--   <script>
            	$(function(){
            		$("#free-boardList tbody tr").click(function(){
            			location.href = "detailApproval.bt?btno=" + $(this).children(".btno").text();
            		})
            	})
            </script> -->
  
  
  
                    <div class="paginationBar">
		                <ul class="pagination justify-content-center" style="margin:20px 0">
		                
		                	<c:choose>
		                		<c:when test="${ pi.currentPage eq 1 }">
			                    	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
			                    </c:when>
			                    <c:otherwise>
			                    	<li class="page-item"><a class="page-link" href="list.fb?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
			                    </c:otherwise>
		                    </c:choose>
		                    
		                    
		                    
		                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    <li class="page-item"><a class="page-link" href="list.fb?currentPage=${ p }">${ p }</a></li>
		                    </c:forEach>
		                    <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                        	<li class="page-item"><a class="page-link" href="list.fb?currentPage=${ pi.currentPage + 1 }">Next</a></li>
		                   		</c:otherwise>
		                    </c:choose>
		                    
		                </ul>
		            </div>
                    
                
                    
                </div>

            </div>

        </div>
        
         <script>
    $(document).ready(function(){
        $("#checkall").click(function(){
            if($("#checkall").prop("checked")){ 
                $("input[name=bono]").prop("checked",true);    
                $(".submit_btn #deletebtn").css({"color":"red"}).prop("disabled",false);
            }else{
                $("input[name=bono]").prop("checked",false);
                // 전체선택 체크박스 체크 해제시 버튼 비활성화
                $(".submit_btn #deletebtn").css({"color":"gray"}).prop("disabled",true);
            }
        })
    })

    // 체크박스가 체크되면 버튼 활성화 되게 만들기 
    $('#free-boardList tbody tr input[type="checkbox"]').click(function(){
        var tmpp = $(this).prop('checked');
        var tt=$("[name='bono']:checked").length;   
        // 하나라도 체크되어있을 때 버튼 활성화 시키기 위해 length로 체크된 값의 개수를 구함
        
        if(tmpp==true || tt>0 ){
            // 버튼 활성화
            $(".submit_btn #deletebtn").css({"color":"red"}).prop("disabled",false);
        }
        else{
            // 버튼 비활성화
            $(".submit_btn #deletebtn").css({"color":"gray"}).prop("disabled",true);
            $("#checkall").prop("checked",false);
        }
    });
    </script>

    <!-- 중요/삭제 클릭시 action -->
    <script>
        function btn_click(str){                             
            	if(str=="delete"){   // 메일 삭제
				
            	if(confirm("선택한 게시글을 삭제하시겠습니까?") == true){
	                form_mail.action="#";
            	}
            }
        }  
    </script>
        
</body>
</html>