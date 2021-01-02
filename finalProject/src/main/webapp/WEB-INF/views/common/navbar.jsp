<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Amiri:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<style>
* {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
    box-sizing: border-box;
}

.navbar_Wrapper {
    height: 70px;
    display: flex;
    justify-content: center;
    align-items: center;

}

.navbar_1200px {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 1200px;
    height: 100%;

}

.navbar_1200px div {
    display: flex;
    justify-content: center;

}

.emptyWrapper {
    margin-left: 50px;
}

.emptyWrapper div {
    display: flex;
    align-items: center;
}

.MainLogo {
    display: flex;
    align-items: center;
}

.MainLogo>div a {
    font-size: 3rem;
    font-family: 'Amiri', serif;
    text-decoration: none;
    color: rgb(57, 146, 230);

}


.userInfoTable tr td {
    padding-left: 10px;
}
</style>
</head>
<body>


	<c:if test="${ !empty alertMsg }">
		<script>
			alertify.alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session"/>
		
	</c:if>




	<nav class="navbar_Wrapper">
        <div class="navbar_1200px">
            <div class="emptyWrapper">
            </div>
            <div class=MainLogo>
                <div><a href="">IT Works</a></div>
            </div>
            <!-- 드롭버튼 바꾸기 -->
            <div class="infoBar">
                <table class="userInfoTable">
                    <tr>
                    	<c:choose>
	                    	<c:when test="${ !empty loginUser }">
		                        <td><i class="material-icons" style="font-size:25px">person_outline</i></td>
		                        <td>${ loginUser.memName } 님</td>
		                        <td><i class="fa fa-angle-down" style="font-size:24px"></i></td>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<td></td>
	                    		<td></td>
	                    		<td></td>
	                    	</c:otherwise>
                    	</c:choose>
                    </tr>
                </table>
            </div>
        </div>
    </nav>
    <hr style="border:1px solid#878787; height: 3px !important; display: block !important; width: 100% !important;"/>
</body>
</html>