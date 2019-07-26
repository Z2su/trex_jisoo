<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<meta charset="UTF-8">
<title>find</title>
<meta href="css/find.css" type="text/css" rel="styleSheet" />



</head>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
	<div id="contentswrap">

		<!-- subvisual -->
		<div id="subvisual">
			<div class="subv_performance">
				<div class="subv_pat">
					<p>
						<strong><img src="/resources/images/ma_service_type.png"
							alt="Daejeon Arts Center"></strong> 문화로 시민을 행복하게! 대전예술의전당
					</p>
				</div>
			</div>
		</div>
		<!-- //subvisual -->

		<!-- navigation -->
		<div id="navigation">
			<div class="naviwrap">
				<a href="/html/kr/" class="nv_home">HOME</a>&gt;
				<navi> <a href="/html/kr/performance/performance_010101.html">공연안내</a>&gt;<a
					href="/html/kr/performance/performance_010101.html">공연안내</a>&gt;<a
					href="/html/kr/performance/performance_010101.html" class="navi_ov">공연정보</a></navi>
				<div class="nv_service">
					<a class="nvs_print" href="#total"
						onclick="printContent('/html/kr/performance/performance_010101.html?mode=V&amp;code=2946');return false"><span
						class="hide">Print</span></a> <a href="#"
						onclick="twitterOpen('http://www.djac.or.kr/html/kr/performance/performance_010101.html?mode=V&amp;code=2946', '대전예술의전당 | 공연정보'); return false;"
						class="nvs_twt twitter" target="_blank" title="대전예술의전당 트위터(새창)"><span
						class="hide">트위터</span></a> <a href="#"
						onclick="facebookOpen('http://www.djac.or.kr/html/kr/performance/performance_010101.html?mode=V&amp;code=2946'); return false;"
						class="nvs_face facebook" target="_blank" title="대전예술의전당 페이스북(새창)"><span
						class="hide">페이스북</span></a>

				</div>
			</div>
		</div>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  background: color:red; /* fallback for old browsers */
  background: -webkit-linear-gradient(right, #76b852, #8DC26F);
  background: -moz-linear-gradient(right, #76b852, #8DC26F);
  background: -o-linear-gradient(right, #76b852, #8DC26F);
  background: linear-gradient(to left, #76b852, #8DC26F);
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}
</style>

<!-- <div class="login-page">
  <div class="form">
    <form class="register-form">
      <input type="text" placeholder="name"/>
      <input type="password" placeholder="password"/>
      <input type="text" placeholder="email address"/>
      <button>create</button>
      <p class="message">Already registered? <a href="#">Sign In</a></p>
    </form>
    <form class="login-form">
      <input type="text" placeholder="username"/>
      <input type="password" placeholder="password"/>
      <button>login</button>
      <p class="message">Not registered? <a href="#">Create an account</a></p>
    </form>
  </div>
</div> -->

<div class="login-page">
  <div class="form">
  <h1>아이디/패스워드 찾기</h1>
	<br/>
	<br/>
	<div id="findID" style="border:1px solid green; padding:10px; ">
		<p>회원정보로 입력된 아이디를 입력하세요.</p>
		<label for="mem_email">이메일인증</label>
		<input type="email" id="mem_email" name="find_id_mem_email" />
		<button type="button" onclick="findId_go();">전송</button>
	</div>
	
	<div id="findPWD" style="border:1px solid green; padding:10px;">
		<p>회원정보로 입력된 아이디를 입력하세요.</p>
		<label for="mem_id">아이디</label><input type="text" id="mem_id" name="mem_id"/><br/>
		<label for="mem_email">이메일</label><input type="email" id="mem_email" name="mem_email" />
		<br><button type="button" onclick="findPwd_go();">전송</button>
	</div>
	<br/>
	<br/> 
	</div>
	</div>
	<script>
		function findId_go(){
			var email=$('input[name="find_id_mem_email"]').val();
			
			$.ajax({
				url:"find/id",			
				method:"post",
				data:{mem_email:email},
				success:function(result){
					var id=result.substring(0,5);					
					for(var i=1;i<result.length;i++){
						id+="*";
					}					
					//alert("회원님의 아이디는 "+id+" 입니다.");
					var p=$('<p>').css({color:"red",fontWeight:"bold"}).text("회원님의 아이디는 "+id+" 입니다.");
					$('div#findID').html(p);
				},
				error:function(){
					alert("존재하지 않는 이메일 주소입니다.");
				}
			});
		};
		function findPwd_go(){
			var id=$('input[name="mem_id"]').val();
			var email=$('input[name="mem_email"]').val();;
			
			var data={mem_id:id,mem_email:email};
			
			$.ajax({
				url:"find/pwd",
				type:"post",
				data:JSON.stringify(data),
				dataType : "text",
				contentType : "application/json; charset=utf-8",
				success:function(msg){
					if(msg=='success'){
						alert("이메일로 패스워드를 전송했습니다.");
					}
				},
				error:function(){
					alert("아이디 혹은 이메일이 일치하지 않습니다.");
				}
				
			});
			
		};
	</script>
</body>














