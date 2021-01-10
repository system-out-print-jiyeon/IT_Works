<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
*{ 
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
.em_wrap{
    width: 100%; 
    height: 100%;
    display: flex;
}
/*내용*/
.em_title{
	color:gray;
	font-size:30px;
}
.em_content{
    width:100%;
    margin-left:300px;
}
.em_navbar {
	width:100%;
    position: fixed;
    background:white;
    z-index:10;
}
.em_content_center{
    margin-top:100px;
}
.em_content_center{
    padding:20px;
}
.em_content_center tbody>tr, .em_content_center th{
    font-size:17px;
    color:gray;
}
.em_content_center .submit_btn{
	float:left;
}
.em_content_center .enrolldate{
    font-size:17px;
    color:gray;
	float:right;
}
.em_content_center button{
    color:rgb(80, 150, 255);
    font-size:20px;
    text-decoration:none;
    border:none;
    background:none;
    margin-right:20px;
}
input[type="submit"]{
    font-size:20px;
    width:150px;
    height:50px;
    border-radius:10px;
    border:none;
    background:rgb(133, 182, 255); 
    color:white;
}
input[type="submit"]:hover{
    cursor:pointer;
    animation-name:key6;
    animation-duration:0.5s;
    animation-fill-mode:both;
    animation-direction: alternate;
}
@keyframes key6{
    to{
        background:rgb(80, 150, 255); 
    }
}
.icon{
    color:rgb(105, 164, 253); 
    font-size:25px; 
    font-weight:900;
}
.icon-none{
    color:rgb(212, 211, 211);
    font-size:25px; 
    font-weight:900;
}

</style>
</head>
<body>	
    <div class="em_navbar">
    	<!-- 상단바 include -->
		<jsp:include page="../common/approvalNavbar.jsp"/>
    </div>
    
	<div class="em_wrap">
		<jsp:include page="../common/sideBar_email.jsp"/>
		
        <div class="em_content">

            <div class="em_content_center">
            	<span class="em_title">보낸메일</span>
            	<hr>
				<br>
            	<div id="emInp">
		        	<c:choose>
		            	<c:when test='${ em.emInp == "Y" }'>
			  	    			<button type="submit"  onclick="cancelInp();">
			            			<span class="icon"><i class="fa fa-star"></i></span>
			      				</button>
		            	</c:when>
		            	<c:otherwise>
			           			<button type="submit"  onclick="updateInp();">
			            			<span class="icon-none"><i class="fa fa-star"></i></span>
			            		</button>
	             		</c:otherwise>
		            </c:choose>  
            	</div>
            	
                <br>
                <br>
                <form name="form_mail" method="post">
                	<input type="hidden" name="emFrom" value="${ em.emFrom }">
                	<input type="hidden" name="emNo" value="${ em.emNo }">
                    <div class="submit_btn">
                        <span class="update"><button type="submit"  onclick='btn_click("forward");'><i class="fa fa-share-square"></i>전달</button></span>
                        <span class="update"><button type="submit"  onclick='btn_click("delete");'><i class="fa fa-trash"></i>삭제</button></span>  
                    </div>
                    <div class="enrolldate">
                    	<span>${ em.emEnrollDate }</span>
                    </div>
                </form>
                <table class="table">
                	<tbody>
	                    <tr>
	                        <th width="150">보낸사람</th>
	                        <td><p>${ em.emFrom }</p></td>
	                    </tr>
	                    <tr>
	                    	<th>받은사람</th>
	                    	<td><p>${ em.emTo }</p></td>
	                    </tr>
	                    <tr>
	                        <th>제목</th>
	                        <td><p>${ em.emTitle }</p></td>
	                    </tr>
                    	<c:if test="${!empty listAtt}">
		                    <tr>
		                        <th>첨부파일</th>
		                        <td>
			                        <c:forEach var="att" items="${ listAtt }">
					                    <a download="${ att.emOriginName }" href="${ att.emChangeName }">${ att.emOriginName }</a><br>
				                    </c:forEach>
			                    </td>
		                    </tr>
		            	</c:if>
			        </tbody>
			        <tfoot>
	                    <tr>
	                        <th>내용</th>
	                        <td><p style="width:100%;">${ em.emContent }</p></td>
	                    </tr>
			        </tfoot>
                </table>
            </div>
        </div>
    </div>

    <!--스크립트-->
    <script>
    	function updateInp(){
    		$.ajax({
    			url:"updateFromInp.em",
    			data:{
    				emFrom:"${em.emFrom}",
    				emNo:${em.emNo}
    			},success:function(result){
    				if(result == "success"){
    					var value = "<button type='submit'  onclick='cancelInp();'>" +
	            						 "<span class='icon'>" +
		            						 "<i class='fa fa-star'>" +
		            						 "</i>" +
	            						 "</span>" +
	      							 "</button>";
	      				$("#emInp").html(value);			 
    				}
    			},error:function(){
    				console.log("중요메일 ajax 통신 실패");
    			}
    		})
    	}
    	function cancelInp(){
    		$.ajax({
    			url:"cancelFromInp.em",
    			data:{
    				emFrom:"${em.emFrom}",
    				emNo:${em.emNo}
    			},success:function(result){
    				if(result == "success"){
    					var value = "<button type='submit'  onclick='updateInp();'>" +
										"<span class='icon-none'>" +
											"<i class='fa fa-star'>" +
											"</i>" +
									 	"</span>" +
									 "</button>";
						$("#emInp").html(value);
    				}
    			},error:function(){
    				console.log("중요메일 ajax 통신 실패")
    			}
    		})
    	}
        function btn_click(str){
			if(str=="forward"){  // 전달
                form_mail.action="fromForward.em";
            } else if(str=="delete"){   // 메일 삭제
            	form_mail.action="deleteFrom.em";
            }
        }  

    </script>
</body>
</html>