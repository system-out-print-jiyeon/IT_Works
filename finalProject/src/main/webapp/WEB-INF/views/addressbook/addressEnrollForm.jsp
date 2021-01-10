<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
.Addressbook{
    width: 1200px; 
    height:1100px; 
    padding-top: 100px;
    margin: auto; 
    box-sizing: border-box;
}
.address1{
    width:1200px; 
    height:1500px; 
    padding: 10px;
}
.address2{
    width: 900px; 
    height: 900px; 
    font-size: 30px; 
    margin-top: 50px;
}
.button_1{
    width: 1500px; 
    padding-left: 600px; 
    margin-top: 350px;
}
</style>
<body>
	<jsp:include page="../common/approvalNavbar.jsp" />
	<jsp:include page="address_sidebar.jsp" />


	 <div class="Addressbook">
        <div class="address1">
            <form id="enrollForm" method="post" action="enrollForm.ad" enctype="multipart/form-data">
                <h1>연락처 추가</h1><br>
                    <table class="address2">                        
                        <tr>
                            <th><label for="name">이름</label></th> 
                            <td><input type="text" id="name" size="30" name="addName"></td>
                        </tr>

                        <tr>
                            <th><label for="phone">전화번호</label></th>
                            <td><input type="tel" id="phone" size="30" name="addPhone"></td>
                        </tr>

                        <tr>
                            <th><label for="department">부서</label></th>
                            <td><input type="text" id="department" size="30" name="addDepartment"></td>
                        </tr>
                            
                        <tr>
                            <th><label for="departmentPhone">부서 전화번호</label></th> 
                            <td><input type="tel" id="departmentPhone" size="30" name="addDepartmentPhone"></td>
                        </tr>

                        <tr>
                            <th><label for="spot">직위</label></th> 
                            <td><input type="text" id="spot" size="30" name="addSpot"></td>
                        </tr>
                        <tr>
                            <th><label for="email">이메일</label></th> 
                            <td><input type="email" id="email" size="30" name="addEmail"></td>
                        </tr>
                        <tr>
                            <th><label for="company">회사명</label></th> 
                            <td><input type="text" id="company" size="30" name="addCompanyName"></td>
                        </tr>
                            
                        <tr>                       
                            <th><label for="Address">주소록 선택</label></th>
                            <td>
                                <input type="radio" id="public" name="addCategory" value="public">
                                <label for="public" href="publiclist.ad">공용 주소록</label> &nbsp;
                                <input type="radio" id="person" name="addCategory" value="person">
                                <label for="person" href="personlist.ad">개인 주소록</label>
                            </td> 
                        </tr>
                        </table>
            	</form>                    
                <div class="button_1" align="right">
                    <button type="submit" class="btn btn-info btn btn-primary btn-lg">저장</button>
                    <button type="reset" class="btn btn btn-lg">취소</button>
                </div>
        </div>
    </div>
</body>
</html>