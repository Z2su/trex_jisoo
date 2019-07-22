<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body bgcolor="" leftmargin="0" topmargin="0" marginwidth="0"
	marginheight="0" background="/SRC/javascript/image/010.gif"
	style="background-repeat: repeat-x">
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
				<navi>
				<a href="/html/kr/performance/performance_010101.html">공연안내</a>&gt;<a
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
	</div>


	<style>
@import url(http://fonts.googleapis.com/css?family=Cookie);

[class*="icon-"] {
  font-family: 'Cookie';
  font-style: normal;
  font-size: 2em;
  speak: none;
}
.icon-home:after { content: "Gmem"; } 
.icon-cog:after { content: "Tro"; } 
.icon-cw:after { content: "work"; } 
.icon-location:after { content: "contact"; } 

* { 
  -webkit-box-sizing: border-box; 
  -moz-box-sizing:    border-box; 
  box-sizing:         border-box; 
  margin: 0;
  padding: 0;
}

html {
  color: #444;
  font-size: 100%;    
  background: #f7f7f7;
}

body {
  font-family: Cambria, Georgia, "Times New Roman", Times, serif;
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased; 
  font-size:18px; 
  font-size:1.125rem;
  line-height: 1.5;
}

a {
  text-decoration: none;
  color: #DD6C4F;
}

a:hover {
  text-decoration:underline;
}

a:focus { 
  outline: none;
}

.page-wrap {
  width: 960px;
  margin: 80px auto;
}

.nav {
  list-style: none;
  text-align: center;
}

.nav li {
  position: relative;
  display: inline-block;
  margin-right: -4px;
}

.nav li:before {
  content: "";
  display: block;
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #fff;
  width: 100%;
  height: 1px;
  position: absolute;
  top: 50%;
  z-index: -1;
}
.nav a {
  display: block;
  background-color: #f7f7f7;
  background-image: -webkit-gradient(linear, left top, left bottom, from(#f7f7f7), to(#e7e7e7));
  background-image: -webkit-linear-gradient(top, #f7f7f7, #e7e7e7); 
  background-image: -moz-linear-gradient(top, #f7f7f7, #e7e7e7); 
  background-image: -ms-linear-gradient(top, #f7f7f7, #e7e7e7); 
  background-image: -o-linear-gradient(top, #f7f7f7, #e7e7e7); 
  color: #a7a7a7;
  margin: 36px;
  width: 180px;
  height: 180px;
  position: relative;
  text-align: center;
  line-height: 144px;
  border-radius: 50%;
  box-shadow: 0px 3px 8px #aaa, inset 0px 2px 3px #fff;
}

.nav a:before {
  content: "";
  display: block;
  background: #fff;
  border-top: 2px solid #ddd;
  position: absolute;
  top: -18px;
  left: -18px;
  bottom: -18px;
  right: -18px;
  z-index: -1;
  border-radius: 50%;
  box-shadow: inset 0px 8px 48px #ddd;
}

.nav a:hover {
  text-decoration: none;
  color: #555;
  background: #f5f5f5;
}
.first{text-align: center;}

</style>

<div class="page-wrap">
	
		<nav>
			
			<ul class="nav">
				<li><a href="joingmem" class="icon-Gmem">Gmember</a></li>
				<li><a href="jointro" class="icon-Tro">Troupe</a></li>	
			</ul>
		</nav>

		<div id="first" name="first">

			<p>
				<br><br><br>
				<span class="bold point">일반회원(Gmember)과 공연단회원(Troupe)으로 선택하여 가입할</span> 수 있습니다.
			</p>
		</div>
</div>



	 <div>
		<!-- <div class="freebiemember">
			<ul class="h5_ul">
				<li>회원가입은 일반회원과 공연단회원으로 가입가능합니다</li>
				<li>다양한 이벤트 참여기회가 부여됩니다.</li>
				<li>공연, 아카데미, 이벤트 등 다양한 정보에 대한 메일서비스를 받을 수 있습니다.</li>
				<li>예당 홈페이지, 전화예매(1544-1556)시 예매 수수료 면제.</li>

			<div class="clear"></div>
			</ul>
		 </div> -->
		<!-- 	<strong class="left_mar_40"><a href="joingmem">일반회원</a></strong> <strong
				class="left_mar_40"><a href="jointro">공연단회원</a></strong> -->

	</div> 


	


	
	
</body>
</html>