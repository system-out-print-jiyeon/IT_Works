<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<style>
.Addressbook{
    width: 100%; 
    height:1000px; 
    padding-top: 5px;
    margin: auto; 
    box-sizing: border-box;
    margin-left:400px;
}
.address1{
    width:80%; 
    height:1000px; 
    padding: 10px;
}
.address2{
    width: 80%; 
    height: 900px; 
    font-size: 25px; 
    margin-top: 10px;
}
.button_1{
    width: 80%; 
    padding-left: 400px; 
    margin-top: 200px;
}
</style>
<body>
	<jsp:include page="../common/approvalNavbar.jsp" />
	<jsp:include page="address_sidebar.jsp" />


	 <div class="Addressbook">
        <div class="address1">
            <form id="enrollForm" action="insert.ad" method="post">
                <h1>연락처 추가</h1><br>
                    <table class="address2">
                    	
                                            
                        <tr>
                            <th><label for="name">이름</label></th> 
                            <td><input type="text" id="name" size="30" name="addName" required></td>
                        </tr>

                        <tr>
                            <th><label for="phone">전화번호</label></th>
                            <td><input type="tel" id="phone" size="30" name="addPhone" required></td>
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
                            <td><input type="email" id="email" size="30" name="addEmail" required></td>
                        </tr>
                        <tr>
                            <th><label for="company">회사명</label></th> 
                            <td><input type="text" id="company" size="30" name="addCompanyName"></td>
                        </tr>
                            
                        <tr>                       
                            <th><label for="Address">주소록 선택</label></th>
                            <td>
                                <input type="radio" id="public" name="addCategory" value="public">
                                <label for="public">공용 주소록</label> &nbsp;
                                <input type="radio" id="person" name="addCategory" value="person">
                                <label for="person">개인 주소록</label>
                            </td> 
                        </tr>
                        </table>
                <div class="button_1" align="right">
                	<input type="hidden" name="addWriter" value="${ loginUser.memNo }">
                    <button type="submit" class="btn btn-info btn btn-primary btn-lg">저장</button>
                    <button type="reset" class="btn btn btn-lg">취소</button>
                </div>
            </form>                    
        </div>
    </div>
</body>
</html>