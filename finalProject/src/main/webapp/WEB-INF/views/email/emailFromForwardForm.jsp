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


    <!-- 서머노트 (부트스트랩 필요) -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
    <script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.em_wrap{
    width: 100%; 
    height: 100%;
    display: flex;
}
/*내용*/
.em_content{
    width:100%;
    margin-left:300px;
}
.em_navbar {
	width:100%;
    position: fixed;
    background:white;
}
.em_content_center{
    margin-top:100px;
}
.em_content_center{
    padding:20px;
}
.em_content_center tbody>tr{
    font-size:17px;
    color:gray;
}
#emFrom{
	margin-left:5px; 
	background:lightGray;
}
input[type="text"], input[type="email"]{
	border:1px solid gray;
}
.add{
    font-size:15px;
    color:white;
    background:rgb(142, 187, 255); 
    border:none;
    border-radius:5px;
}
.add:hover{
    cursor:pointer;
    animation-name:key4;
    animation-duration:0.3s;
    animation-fill-mode:both;
    animation-direction:alternate;
}
@keyframes key4{
    to{
        background:rgb(80, 150, 255); 
        padding:0px 5px;
    }
}
.remove{
    font-size:15px;
    color:white;
    background:rgb(253, 153, 150); 
    border:none;
    border-radius:5px;
}
.remove:hover{
    cursor:pointer;
    animation-name:key5;
    animation-duration:0.3s;
    animation-fill-mode:both;
    animation-direction:alternate;
}
.text{
	font-size:10px;
}
@keyframes key5{
    to{
        background:rgb(255, 86, 80); 
        padding:0px 5px;
    }
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
                <form action="insertFromForward.em" method="post">
                    <table class="table">
                        <tr>
                            <th width="150">보내는 사람</th>
                            <td><input type="email" name="emFrom" id="emFrom" value="${ loginUser.email }" readonly></td>
                        </tr>
                        <tr>
                            <th>받는 사람</th>
                            <td>
                                <table id="addTable" class="table-sm table-borderless">
                                    <tr height="0">
                                        <td>
                                            <input type="email" name="emToList[0].emTo" required>
                                            <input class="add" type="button" onClick="add()" value="추가">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="emTitle" style="width:100%; margin-left:5px;" value="${ em.emTitle }" required></td>
                        </tr>
                       	<c:if test="${!empty listAtt}">
		                    <tr>
		                        <th>첨부파일</th>
		                        <td>
			                        <c:forEach var="att" items="${ listAtt }" varStatus="status">
					                    <a download="${ att.emOriginName }" href="${ att.emChangeName }">${ att.emOriginName }</a><br>
					                    <input type="hidden" name="emAttachList[${status.index}].emOriginName" value="${ att.emOriginName }">
					                    <input type="hidden" name="emAttachList[${status.index}].emChangeName" value="${ att.emChangeName }">
				                    </c:forEach>
			                    </td>
		                    </tr>
		            	</c:if>
                        <tr>
                            <th>내용</th>
                            <td>
                            	<textarea id="summernote" name="emContent" style="margin-left:5px;">
                            		------원본메일------<br>
                            		<b>From:</b> ${ em.emFrom }<br>
                            		<b>To:</b> ${ em.emTo }<br>
                            		<b>Sent:</b> ${ em.emEnrollDate }<br>
                            		<b>Title:</b> ${ em.emTitle }<br>
                            		<b>Subject:</b>
                            		<c:forEach var="att" items="${ listAtt }">
                            			&lt;
                            			${att.emOriginName}
                            			&gt;
                            		</c:forEach>
                            		<br>
                            		<br>
                            		<br>
                            		${ em.emContent }
                            		
                            	</textarea>
                            </td>
                        </tr>
                    </table>
                    <div align="center">
                        <input type="submit" value="메일 보내기">
                    </div>
                </form>
            </div>
        </div>
        
    </div>

    <!--스크립트-->
    <!-- 받는사람 추가/삭제 -->
    <script>
        var oTbl;
        var recipients;
        var i = 0;

        function add() {
                
            i++;
                
            oTbl = document.getElementById("addTable");
            var oRow = oTbl.insertRow ();
            oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex};
                
            var oCell = oRow.insertCell();
            var frmTag = "<input type='email' name='emToList["+i+"].emTo' required>";

            frmTag += " <input type=button value='삭제' class='remove' onClick='removeRow()'>";
            oCell.innerHTML = frmTag;
        }

        function removeRow() {
        oTbl.deleteRow(oTbl.clickedRowIndex);
        }
    </script>

    <!-- 썸머노트 -->
    <script>
      jQuery.noConflict(); // jquery 충돌 오류 해결
      $('#summernote').summernote({
        tabsize: 2,
        height: 400,
        disableResizeEditor: true,
        
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
</body>
</html>