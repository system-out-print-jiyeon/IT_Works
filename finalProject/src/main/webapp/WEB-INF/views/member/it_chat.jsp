<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹 내 채팅</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<style>
	.container{max-width:1170px; margin:auto;}
img{ max-width:100%;}
.inbox_people {
  background: #f8f8f8 none repeat scroll 0 0;
  float: left;
  overflow: hidden;
  width: 40%; border-right:1px solid #c4c4c4;
}
.inbox_msg {
  border: 1px solid #c4c4c4;
  clear: both;
  overflow: hidden;
}
.top_spac{ margin: 20px 0 0;}


.recent_heading {float: left; width:40%;}
.srch_bar {
  display: inline-block;
  text-align: right;
  width: 60%; padding:
}
.headind_srch{ padding:10px 29px 10px 20px; overflow:hidden; border-bottom:1px solid #c4c4c4;}

.recent_heading h4 {
  color: #05728f;
  font-size: 21px;
  margin: auto;
}
.srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}
.srch_bar .input-group-addon button {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  padding: 0;
  color: #707070;
  font-size: 18px;
}
.srch_bar .input-group-addon { margin: 0 0 0 -27px;}

.chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
.chat_ib h5 span{ font-size:13px; float:right;}
.chat_ib p{ font-size:14px; color:#989898; margin:auto}
.chat_img {
  float: left;
  width: 11%;
}
.chat_ib {
  float: left;
  padding: 0 0 0 15px;
  width: 88%;
}

.chat_people{ overflow:hidden; clear:both;}
.chat_list {
  border-bottom: 1px solid #c4c4c4;
  margin: 0;
  padding: 18px 16px 10px;
}
.inbox_chat { height: 440px; overflow-y: scroll;}

.active_chat{ background:#ebebeb;}

.incoming_msg_img {
  display: inline-block;
  width: 6%;
}
.received_msg {
  display: inline-block;
  padding: 0 0 0 10px;
  vertical-align: top;
  width: 92%;
 }
 .received_withd_msg p {
  background: #ebebeb none repeat scroll 0 0;
  border-radius: 3px;
  color: #646464;
  font-size: 14px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
}
.time_date {
  color: #747474;
  display: block;
  font-size: 12px;
  margin: 8px 0 0;
}
.received_withd_msg { width: 57%;}
.mesgs {
  float: left;
  padding: 30px 15px 0 25px;
  width: 60%;
}

 .sent_msg p {
  background: #05728f none repeat scroll 0 0;
  border-radius: 3px;
  font-size: 14px;
  margin: 0; color:#fff;
  padding: 5px 10px 5px 12px;
  width:100%;
}
.outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
.sent_msg {
  float: right;
  width: 46%;
}
.input_msg_write input {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  color: #4c4c4c;
  font-size: 15px;
  min-height: 48px;
  width: 100%;
}

.type_msg {border-top: 1px solid #c4c4c4; position: relative;}
.msg_send_btn {
  background: #05728f none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 17px;
  height: 33px;
  position: absolute;
  right: 0;
  top: 11px;
  width: 33px;
}
.messaging { padding: 0 0 50px 0;}
.msg_history {
  height: 400px;
  overflow-y: auto;
}
</style>
</head>
<body>
	<jsp:include page="../common/approvalNavbar.jsp"/><br><br>
	<div class="container"><br><br>
<div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>접속 중</h4>
            </div>
            <!-- 
	            <div class="srch_bar">
	              <div class="stylish-input-group">
	                <input type="text" class="search-bar"  placeholder="Search" >
	                <span class="input-group-addon">
	                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
	                </span> </div>
	            </div>
             -->
             
          </div>
          
          <div class="inbox_chat">
          <!-- 접속한 인원 보이기 -->
          <!-- 
            <div class="chat_list active_chat">
              <div class="chat_people">
                <div class="chat_img"> <img src="${ loginUser.memImg }" style="border-radius: 70%;" alt="프로필"> </div> 
                <div class="chat_ib">
                  <h5>${ loginUser.memName } <span class="chat_date"><c:out value="${sysdate}"/></span></h5>
                  <p></p>
                </div>
              </div>
            </div>
           -->
            
            <!-- 채팅 인원  
            <div class="chat_list">
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5>Sunil Rajput <span class="chat_date">Dec 25</span></h5>
                  <p>Test, which is a new approach to have all solutions 
                    astrology under one roof.</p>
                </div>
              </div>
            </div>
            -->
            
          </div>
        </div>
        <div class="mesgs">
          <div class="msg_history">
          
            <div class="incoming_msg">
            
        	<!-- 채팅 보여지는 칸 -->
              
            </div>
            
          <!-- 1 -->
        </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" id="message" class="write_msg" placeholder="메시지를 입력해주세요!" />
              <button class="msg_send_btn" type="button" id="btnSend"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
          </div>
        <!-- 2 -->
      </div>
      
      <input type="hidden" id="loginN" value="${ loginUser.memName }">
      <input type="hidden" id="loginI" value="${ loginUser.memId }">
      
<script>
	var name = $("input#loginN").val();
	var id = $("input#loginI").val();
	
	//var time = new Date();
	//var now = time.getHours() + "시" + time.getMinutes() + "분" + time.getSeconds() + "초";
	
	var value = "";

   var socket = new SockJS("http://localhost:8888/ITWorks/chat");
  
   socket.onopen = function () {
       console.log('Info: connection opened.');
       console.log('로그인한 사원명 : ' + name);
       console.log('로그인한 사원 아이디명 : ' + id);
       
       var time = new Date();
   	  var now = (time.getMonth()+1) + "월/" + time.getDate() + "일-" + time.getHours() + "시" + time.getMinutes() + "분";
       
       if(name != null){
    	   console.log("입장");
    	   member =   	"<div class='chat_list'>" +
		           			"<div class='chat_people'>" + 
		             			"<div class='chat_img'>" +
		             				"<img src='${ loginUser.memImg }' style='border-radius: 70%;' alt='프로필'>" +
		             			"</div>" + 
		             		"<div class='chat_ib'>" +
		               			"<h5>" + name + "(" + id + ")" + 
		               				"<span class='chat_date'>" + now + "</span>" + 
		               			"</h5>" +
		               			"<p>" + "${loginUser.deptName}" + "/" +"${loginUser.jobName}" +"</p>" +
             				"</div>" +
           				"</div>" +
         			"</div>";
         			
		 $("div.inbox_chat").append(member);
       }
   };
 
   socket.onmessage = function (event) {
      console.log(event.data+'\n'); 
      
      var time = new Date();
  	  var now = time.getHours() + "시" + time.getMinutes() + "분" + time.getSeconds() + "초";
      
      var arr = event.data.split(" (");
      
      // 아이디/이름 나누기 테스트
      console.log(arr[0]);
      
      // 로그인한 사원과 채팅이용자 일치하는지 테스트
      if(id == arr[0]){
    	  console.log('일치함');
    	  // 일치 == (내가 메시지 보냄) 1번 div로 출력
    	  chat = "<div class='outgoing_msg'>" + 
          				"<div class='sent_msg'>" +
          					"<p>" + event.data + "</p>" + 
          					"<span class='time_date'>" + "보낸시간 - " + now + "</span>" + 
          				"</div>" +
      				"</div>";
      				
    	  $("div.incoming_msg").append(chat);
      				
      }else{
    	  console.log('불일치함');
    	  // 불일치 == (다른사람 메시지 받아옴) 2번 div로 출력
    	  chat = 
    		  "<div class='incoming_msg_img'>" +
    		  	"<img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'>" + 
    		  "</div>" +
          	"<div class='received_msg'>" +
          		"<div class='received_withd_msg'>" + 
            		"<p>" + event.data + "</p>" +
            		"<span class='time_date'>" + "받은시간 - " + now + "</span>" + "</div>" +
        	"</div>";
        	
    	  $("div.incoming_msg").append(chat);
      }
      //$("div.messaging").append(value);
      
      //$(".sent_msg").html('<p>' + event.data + '</p>\n');
      
   };


   socket.onclose = function (event) {
      console.log('Info: connection closed.'); 
      //setTimeout( function(){socket.onopen();}, 1000);	// 연결 끊어지면 다시 연결 시도
   };

   socket.onerror = function (event) { 
      console.log('Info: connection not opened. It is error'); 
   };


  $(function(){
   $('#btnSend').on('click', function(evt) {
           //evt.preventDefault();
                socket.send($('input#message').val());
                $('input#message').val("");
       });
  });
   
</script>
		
</body>
</html>