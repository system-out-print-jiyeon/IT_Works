<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>approvalNavbar</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600&family=Lexend+Peta&family=Nanum+Pen+Script&family=Playfair+Display:ital,wght@1,600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/v4-shims.css">
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    
    
  <style>
      
 
      *
        {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            
        }

     /* IT Works 로고 */
      .navBar{
          width: 100%;
          height: 80px;
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding: 20px 2%;
          border-bottom: 1px solid gray;
          
          background-color: white;
          position:fixed;
          z-index:300;
          
      }
      
      
      .logoText{
          color: rgb(54, 117, 177);
          text-decoration: none;
          font-family: 'Amiri', serif;
          font-weight: 500;
          font-size: 50px;
        }

        /* 카테고리 */
        
        .category{
          font-size: 30px;
          margin-right: auto;
          margin-left: 30px;
          position: relative;
          
          
        }
        
        .category:hover{
            cursor: pointer;
        }

        /* 검색바 */
      .searchBox{
        height: 40px;
        border-radius: 40px;
        padding: 10px;
        margin-right: 100px;
        border: 2px solid darkgray;
        
      }

      .searchBtn{
        float: right;
        
        text-decoration: none;
        color: rgb(58, 53, 53);
      }

      .searchTxt{
          border: none;
          background: none;
          outline: none;
          float: left;
          padding-left: 10px;
          color: rgb(146, 143, 143);
          font-size: 16px;
          width: 250px;
      }

      /* 로그인 정보 */

      .personalInfo{
          margin-left: 20px;
          text-decoration: none;
          font-size: 25px;
          display: inline;
          
          

          
      }
      .infoText {
          text-decoration: none;
          color: rgb(109, 100, 100);
          
      }

      .bell{
          border: 2px solid rgb(109, 100, 100);
          padding: 10px 7px;
          width: 40px;
          height: 40px;
          border-radius: 50%;
          color: rgb(109, 100, 100);
          text-align: center;
        }

        .username{
         vertical-align: middle;
            
        }
        span{ display: table-cell;}


        /* 서브메뉴리스트 */

        .submenuList{
        width: 500px;
        height: 260px;
        border: 1px solid rgb(143, 138, 138);
        background-color: white;
        display:flex;
        flex-wrap: wrap;
        text-align: center;
        justify-content: center;
        position: fixed;
        z-index: 1000;
        margin-left: 280px;
        margin-top:80px;
        
        
        
        
        
        
        
    }
    .submenuList div{
        width: 100px;
        height: 100px;
        margin-left: 10px;
        margin-right: 10px;
        margin-top: 10px;
        border-radius: 50%;
        background-color: rgb(68, 120, 199);
        color: white;
        border: none;
        display: table;

    }
    
    .submenuList div:hover{
        
        background-color: rgb(37, 90, 189);
    }

    .listCategory{display: table-cell;  vertical-align: middle; }

    a{text-decoration: none;}

  </style>
</head>
<body>

	<%-- 알림메시지출력 --%>
	<c:if test="${ !empty alertMsg }">
		<script type="text/javascript">
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>

<!-- 탑 네비바-->
    <nav class="navBar">
        <div class="navLogo">
            <a href="main.me" class="logoText">IT Works</a>
        </div>
        <div class="category" >
        
      	 <% String url = request.getRequestURI(); %>
        
           <% if(url.contains("approval")){ %> 전자결재 <% } 
           else  {%> 오피스 홈 <% } %>
            
            &nbsp;<i class="fas fa-sort-down">&nbsp;</i>
        </div>
        
      	<% if(url.contains("approval")) { %>
        <div class="searchBox">
            <input class="searchTxt" type="text" name="" id="" placeholder="문서 검색" width="500px" height="50px">
            <a class="searchBtn" href="#"><i class="fas fa-search "></i></a>
        </div>
        <%} else { %>  <% } %>
        
        <a href=""><span class="bell"><i class="fas fa-bell"></i></span></a>
        <div class="personalInfo">
           <a href="" class="infoText"><span><i class="fas fa-user-circle fa-2x"></i></span>&nbsp;<span class="username">${ loginUser.memName }&nbsp;<i class="fas fa-sort-down"></i></span></a>
        </div>
    </nav>

    <!-- 서브메뉴바 -->
    <div class="submenuList" style="display: none;">
        
        <a href=""><div><p class="listCategory"><i class="far fa-envelope"></i><br> 메일</p></div></a>
        <a href=""><div><p class="listCategory"><i class="far fa-calendar-alt"></i><br> 캘린더</p></div></a>
        <a href=""><div><p class="listCategory"><i class="far fa-address-card"></i><br> 주소록</p></div></a>
        <a href=""><div><p class="listCategory"><i class="far fa-list-alt"></i><br>게시판</p></div></a>
    

   

        <a href=""><div><p class="listCategory"><i class="fas fa-business-time"></i><br>회의실 예약</p></div></a>
        <a href="manageList.ma"><div><p class="listCategory"><i class="fas fa-users"></i><br>인사관리</p></div></a>
        <a href="reservation.re?floor=3"><div><p class="listCategory"><i class="fas fa-business-time"></i><br>회의실 예약</p></div></a>
        <a href="manage.me"><div><p class="listCategory"><i class="fas fa-users"></i><br>인사관리</p></div></a>
        <a href=""><div><p class="listCategory"><i class="far fa-id-badge"></i><br>근태관리</p></div></a>
        <a href="approval.me"><div><p class="listCategory"><i class="fas fa-file-signature"></i><br>전자결재</p></div></a>
    
    </div>




    <script>

        $(document).ready(function(){
            $(".category").click(function(){
                var submenu = $(".submenuList");
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