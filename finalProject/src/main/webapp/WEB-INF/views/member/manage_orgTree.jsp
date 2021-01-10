<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 조직도</title>
	<!-- orgTree 
	    <link rel="stylesheet" href="../../resources/css/main.css">
		<link rel="stylesheet" href="resources/css/hierarchy-view.css">
	 -->
    
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

/* main.css */
@import url("https://fonts.googleapis.com/css?family=Poppins");
html, body {
  height: 100%;
  font-family: 'Poppins', sans-serif;
  padding: 0;
  margin: 0; }

section {
  min-height: 100%;
  display: flex;
  justify-content: center;
  flex-direction: column;
  padding: 50px 0;
  position: relative; }
  section .github-badge {
    position: absolute;
    top: 0;
    left: 0; }
  section h1 {
    text-align: center;
    margin-bottom: 70px; }
  section .hv-container {
    flex-grow: 1;
    overflow: auto;
    justify-content: center; }

.basic-style {
  background-color: #EFE6E2; }
  .basic-style > h1 {
    color: #ac2222; }

p.simple-card {
  margin: 0;
  background-color: #fff;
  color: #DE5454;
  padding: 30px;
  border-radius: 7px;
  min-width: 100px;
  text-align: center;
  box-shadow: 0 3px 6px rgba(204, 131, 103, 0.22); }

.hv-item-parent p {
  font-weight: bold;
  color: #DE5454; }

.management-hierarchy {
  background-color: #303840; }
  .management-hierarchy > h1 {
    color: #FFF; }
  .management-hierarchy .person {
    text-align: center; }
    .management-hierarchy .person > img {
      height: 110px;
      border: 5px solid #FFF;
      border-radius: 50%;
      overflow: hidden;
      background-color: #fff; }
    .management-hierarchy .person > p.name {
      background-color: #fff;
      padding: 5px 10px;
      border-radius: 5px;
      font-size: 12px;
      font-weight: normal;
      color: #3BAA9D;
      margin: 0;
      position: relative; }
      .management-hierarchy .person > p.name b {
        color: rgba(59, 170, 157, 0.5); }
      .management-hierarchy .person > p.name:before {
        content: '';
        position: absolute;
        width: 2px;
        height: 8px;
        background-color: #fff;
        left: 50%;
        top: 0;
        transform: translateY(-100%); }

/* hierarchy-view.css */
.hv-wrapper {
  display: flex; }
  .hv-wrapper .hv-item {
    display: flex;
    flex-direction: column;
    margin: auto; }
    .hv-wrapper .hv-item .hv-item-parent {
      margin-bottom: 50px;
      position: relative;
      display: flex;
      justify-content: center; }
      .hv-wrapper .hv-item .hv-item-parent:after {
        position: absolute;
        content: '';
        width: 2px;
        height: 25px;
        bottom: 0;
        left: 50%;
        background-color: rgba(255, 255, 255, 0.7);
        transform: translateY(100%); }
    .hv-wrapper .hv-item .hv-item-children {
      display: flex;
      justify-content: center; }
      .hv-wrapper .hv-item .hv-item-children .hv-item-child {
        padding: 0 15px;
        position: relative; }
        .hv-wrapper .hv-item .hv-item-children .hv-item-child:before, .hv-wrapper .hv-item .hv-item-children .hv-item-child:not(:only-child):after {
          content: '';
          position: absolute;
          background-color: rgba(255, 255, 255, 0.7);
          left: 0; }
        .hv-wrapper .hv-item .hv-item-children .hv-item-child:before {
          left: 50%;
          top: 0;
          transform: translateY(-100%);
          width: 2px;
          height: 25px; }
        .hv-wrapper .hv-item .hv-item-children .hv-item-child:after {
          top: -25px;
          transform: translateY(-100%);
          height: 2px;
          width: 100%; }
        .hv-wrapper .hv-item .hv-item-children .hv-item-child:first-child:after {
          left: 50%;
          width: 50%; }
        .hv-wrapper .hv-item .hv-item-children .hv-item-child:last-child:after {
          width: calc(50% + 1px); }
</style>
</head>
<body>
	<div class="wrap">
	<jsp:include page="../common/approvalNavbar.jsp"/>
        
        <jsp:include page="../common/sideBar_manage.jsp"/>

        <div class="content"><br><br><br>
        <!-- 
			<div class="content_1">
				<h2>조직도 -"조직도 구성 예정"</h2>
			</div>
			<br><br>
         -->
		<section class="management-hierarchy">
			<div class="hv-container">
				<div class="hv-wrapper">
	
					<div class="hv-item">
					<!-- 잘 나오나 확인 -->
	
						<div class="hv-item-parent">
							<div class="person">
								<img src="https://www.sk5.co.kr/img_src/s600/b318/b3180113.jpg" alt="CEO 홍길동">
								<p class="name">
									홍길동 <b>/ CEO</b>
								</p>
							</div>
						</div>
						<div class="hv-item-parent">
							<div class="person">
								<img src="https://img.hankyung.com/photo/201908/01.20297998.1.jpg" alt="이사 선동일">
								<p class="name">
									선동일 <b>/ 이사 </b>
								</p>
							</div>
						</div>
	
						<div class="hv-item-children">
	
							<div class="hv-item-child">
								<div class="hv-item">
	
									<div class="hv-item-parent">
										<div class="person">
											<img src="https://images.chosun.com/resizer/RXomcK0hmu9zBD4gQPP1144wp_E=/464x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/P3SGPEU4ZOWPITSVO5T5SQSZSI.jpg" alt="과장 정중하">
											<p class="name">
												정중하 <b>/ 과장 <개발></b>
											</p>
										</div>
									</div>
									
	
									<div class="hv-item-children">
	
										<div class="hv-item-child">
											<div class="person">
												<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201702%2F2017020813532326.jpg" alt="윤은해">
												<p class="name">
													윤은해 <b>/ 대리</b>
												</p>
											</div>
											<br>
											<div class="hv-item-child">
												<div class="person">
													<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201807%2F2018070515250027-6838357.jpg" alt="이중석">
													<p class="name">
														이중석 <b>/ 사원</b>
													</p>
												</div>
											</div>
										</div>
	
										<div class="hv-item-child">
											<div class="person">
												<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201601%2F20160106215050853-6185691.jpg" alt="대북혼">
												<p class="name">
													대북혼 <b>/ 대리</b>
												</p>
											</div>
											<br>

										</div>
	
									</div>
	
								</div>
							</div>
	
							<div class="hv-item-child">
								<div class="hv-item">
	
									<div class="hv-item-parent">
										<div class="person">
											<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201608%2F20160810155746864.jpg" alt="차태연">
											<p class="name">
												차태연 <b>/ 과장 <인사></b>
											</p>
										</div>
									</div>
	
									<div class="hv-item-children">
	
										<div class="hv-item-child">
											<div class="person">
												<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F202006%2F20200619172124928.jpg" alt="송종기">
												<p class="name">
													송종기 <b>/ 과장</b>
												</p>
											</div>
											<br>
											<div class="hv-item-child">
												<div class="person">
													<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2F154%2F201702141047389601.jpg" alt="전형돈">
													<p class="name">
														전형돈 <b>/ 대리</b>
													</p>
												</div>
												<br>
											<div class="hv-item-child">
												<div class="person">
													<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2F118%2F201403111211164561.jpg" alt="장쯔위">
													<p class="name">
														장쯔위 <b>/ 사원</b>
													</p>
												</div>
											</div>
											</div>
										</div>
	
										<div class="hv-item-child">
											<div class="person">
												<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201509%2F20150909171907196-4306988.jpg" alt="박나라">
												<p class="name">
													박나라 <b>/ 과장</b>
												</p>
											</div>
										</div>
	
									</div>
	
								</div>
							</div>
	
							<div class="hv-item-child">
								<div class="hv-item">
	
									<div class="hv-item-child">
										<div class="person">
											<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2F125%2F201212262021589401.jpg" alt="전지연">
											<p class="name">
												전지연 <b>/ 차장 <경원지원></b>
											</p>
										</div>
										<br>
										<div class="hv-item-child">
											<div class="person">
												<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2F190%2F201607181718224321.jpg" alt="노옹철">
												<p class="name">
													노옹철 <b>/ 과장</b>
												</p>
											</div>
											<br>
										<div class="hv-item-child">
											<div class="person">
												<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F015%2F2018%2F06%2F28%2F0003970142_001_20180628192004552.jpg&type=sc960_832" alt="이태림">
												<p class="name">
													이태림 <b>/ 대리</b>
												</p>
											</div>
											<br>
										<div class="hv-item-child">
											<div class="person">
												<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F202004%2F20200423174808385.jpg" alt="하이유">
												<p class="name">
													하이유 <b>/ 사원</b>
												</p>
											</div>
										
										</div>
										</div>
										</div>
									</div>
	
								</div>
							</div>

							<div class="hv-item-child">
								<div class="hv-item">
	
									<div class="hv-item-child">
										<div class="person">
											<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F202009%2F2020090618264387.jpg" alt="이오리">
											<p class="name">
												이오리 <b>/ 차장 <기획></b>
											</p>
										</div>
										<br>
										<div class="hv-item-child">
											<div class="person">
												<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2F42%2F201802141225151721.jpg" alt="김해술">
												<p class="name">
													김해술 <b>/ 과장</b>
												</p>
											</div>
										</div>
										<br>
										<div class="hv-item-child">
											<div class="person">
												<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201603%2F20160317145311409.jpg" alt="하동운">
												<p class="name">
													하동운 <b>/ 대리</b>
												</p>
											</div>
										</div>
									</div>
	
								</div>
							</div>

							<div class="hv-item-child">
								<div class="hv-item">
	
									<div class="hv-item-child">
										<div class="person">
											<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201808%2F20180828141741978.jpg" alt="유재식">
											<p class="name">
												유재식 <b>/ 차장 <총무></b>
											</p>
										</div>
										<br>
										<div class="hv-item-child">
											<div class="person">
												<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2F123%2F201403051702331631.jpg" alt="방명수">
												<p class="name">
													방명수 <b>/ 과장</b>
												</p>
											</div>
											<br>
										<div class="hv-item-child">
											<div class="person">
												<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201911%2F20191122154924464.jpg" alt="심봉선">
												<p class="name">
													심봉선 <b>/ 대리</b>
												</p>
											</div>
											<br>
										<div class="hv-item-child">
											<div class="person">
												<img src="https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201910%2F20191008134435808.jpg" alt="임시완">
												<p class="name">
													임시완 <b>/ 사원</b>
												</p>
											</div>
										</div>
										</div>
										</div>
									</div>
	
								</div>
							</div>
	
						</div>
	
					</div>
	
				</div>
			</div>
		</section>
	
		</div>
		<br><br><br><br>
	</div>
	</div>



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