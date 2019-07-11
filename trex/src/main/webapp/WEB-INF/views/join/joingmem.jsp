<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<body>


<div id="contentswrap">

	<!-- subvisual -->
	<div id="subvisual">
		<div class="subv_performance">
			<div class="subv_pat">
				<p>
					<strong><img
						src="/images/kr/common_2015/ma_service_type.png"
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
	
	
<!-- <style>
p, h1, form, button{border:0; margin:0; padding:0;}
.spacer{clear:both; height:1px;}

.myform{
	margin:10px;
	width:400px;
	padding:14px;
}

#stylized{
	border:solid 2px #b7ddf2;
	background:#ebf4fb;
}
#stylized h1 {
	font-size:16px;
	font-weight:bold;
	margin-bottom:8px;
	font-family:nanumgothic,dotum;

}
#stylized p{
	font-size:11px;
	color:#666666;
	margin-bottom:20px;
	border-bottom:solid 1px #b7ddf2;
	padding-bottom:10px;
	font-family:dotum;
}
#stylized label{
	display:block;
	font-weight:bold;
	text-align:right;
	width:140px;
	float:left;
	font-family:tahoma;
}
#stylized .small{
	color:#666666;
	display:block;
	font-size:11px;
	font-weight:normal;
	text-align:right;
	width:140px;
	font-family:dotum;
	letter-spacing:-1px;
}
#stylized input{
float:left;
font-size:12px;
padding:4px 2px;
border:solid 1px #aacfe4;
width:200px;
margin:2px 0 20px 10px;
}
#stylized button{
clear:both;
margin-left:150px;
width:125px;
height:31px;
text-align:center;
line-height:31px;
background-color:#000;
color:#FFFFFF;
font-size:11px;
font-weight:bold;
font-family:tahoma;
}
</style>


<div id="stylized" class="myform">
<form id="form" name="form" method="post">
<h1>글쓰기 폼</h1>
<p>기본적인 입력폼입니다.</p>

<label>Name
<span class="small">이름 입력</span>
</label>
<input type="text" name="name" id="name" />

<label>Email
<span class="small">이메일주소</span>
</label>
<input type="text" name="email" id="email" />

<label>Password
<span class="small">패스워드 6자 이상</span>
</label>
<input type="text" name="password" id="password" />

<button type="submit">Sign-up</button>
<div class="spacer"></div>
 -->
</form>
</div>
	
	<!-- //navigation -->

	<!-- container -->
	<div id="container">
		<%-- 				<%@ include file="/WEB-INF/views/board/commons/submenu.jsp" %>
 --%>

		<!-- content-->
		<!-- <div id="content"> -->
		<!-- 컨텐츠 타이틀 -->
		<!-- 	<h3 class="cnt_ti">detail</h3> -->
	
   <script type="text/javascript">
			var isCheckId = 0;
			function duplicationId() {
				var inputId = $("#mem_id").val();
				$.ajax({
					async : false,
					type : "post",
					url : "duplicationCheck.do",
					data : inputId,
					success : function(data) {
						if (data == "S") {
							alert("사용가능한 아이디입니다.");

							$("#divInputId").addClass("has-success")
							$("#divInputId").removeClass("has-error")

							$("#mem_pwd").focus();
							isCheckId = 1;
						} else {
							alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");

							$("#divInputId").addClass("has-error")
							$("#divInputId").removeClass("has-success")

							$("#mem_id").focus();
						}
					},
					error : function(req, status, errThrown) {
						alert("network error occur");
					}
				});
			}

			function DosignUp() {

				var divinputId = $("#mem_id").val();
				var inputPwd = $("#mem_pwd").val();
				var inputPwdCfm = $("#mem_pwdCfm").val();
				var inputCpnName = $("#signUpUserCompanyName").val();
				var inputCpnTelNo = $("#signUpUserTelNo").val();
				var inputCpnEmail = $("#signUpUserEmail").val();
				var inputCpnNo = $("#signUpUserCompanyNo").val();
				var inputCpnAddr1 = $("#signUpUserPostNo").val();
				var inputCpnAddr2 = $("#signUpUserCompanyAddress").val();
				var inputCpnAddr3 = $("#signUpUserCompanyAddressDetail").val();

				if (inputId.length == 0) {
					alert("아이디를 입력해 주세요.");
					$("#mem_id").focus();
					return;
				}
				if (isCheckId == 0) {
					alert("아이디 중복 체크를 해주세요.");
					$("#mem_id").focus();
					return;
				}

				if (inputPwd.length == 0) {
					alert("비밀번호를 입력해 주세요.");
					$("#mem_pwd").focus();
					return;
				}
				if (inputPwd != inputPwdCfm) {
					alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요.");
					$("#mem_pwd").focus();
					return;
				}

				if (inputCpnName.length == 0) {
					alert("회사명을 입력해 주세요.");
					$("#signUpUserCompanyName").focus();
					return;
				}

				if (inputCpnTelNo.length == 0) {
					alert("전화번호를 입력해 주세요.");
					$("#signUpUserTelNo").focus();
					return;
				}

				if (inputCpnEmail.length == 0) {
					alert("이메일을 입력해 주세요.");
					$("#signUpUserEmail").focus();
					return;
				}

				if (inputCpnNo.length == 0) {
					alert("사업자번호를 입력해 주세요.");
					$("#signUpUserCompanyNo").focus();
					return;
				}

				if (inputCpnAddr1.length == 0 || inputCpnAddr2.length == 0
						|| inputCpnAddr3.length == 0) {
					alert("주소를 입력해 주세요.");
					$("#signUpUserCompanyAddressDetail").focus();
					return;
				}
				if (confirm("회원가입을 하시겠습니까?")) {
					alert("가입!");

					location.href = "joinregist";

				}
			}

			function CheckCompanyNo() {

			}
		</script> 


		
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-3" style="width: 50%">
					<div class="login-panel panel panel-default"
						style="margin-top: 10%; margin-bottom: 10%;">
						<div class="panel-heading">
							<h3 class="panel-title">일반 회원 가입</h3>
						</div>
						<div class="panel-body">
							<form role="form" action="joinregist" method="post">
								<!-- <form role="form"> -->
								<fieldset>
									<div class="form-group" id="divInputId">
										<label>아이디</label> <input class="form-control"
											style="margin-bottom: 5px;" placeholder="아이디" name="mem_id"
											id="signUpUserId" type="text" /> <input type="button"
											class="btn btn-default" style="width: 30%;" value="중복확인"
											onclick="duplicationId();" />
									</div>
									<div class="form-group">
										<label>비밀번호</label> <input class="form-control"
											placeholder="비밀번호" name="mem_pwd" id="signUpUserPwd"
											type="password" />
									</div>
									<div class="form-group">
										<label>비밀번호 확인</label> <input class="form-control"
											placeholder="비밀번호 확인" name="mem_PwdCfm" id="signUpUserPwdCfm"
											type="password" />
									</div>
									<!-- <div class="form-group">
                            		<label>회사명</label>
                            		<input class="form-control" placeholder="회사명" name="signUpUserCompanyName" id="signUpUserCompanyName" type="text" />
                            	</div> -->
									<div class="form-group">
										<label>이름</label> <input class="form-control" placeholder="이름"
											name="name" id="signUpUsername" type="text" />
									</div>
									<div class="form-group">
										<label>성별</label> <input type="radio" name="gender" value="남"
											checked>남 <input type="radio" name="gender" value="여"
											checked>여
									</div>

									<div class="form-group">
										<label>생년월일</label> <input type="text" name="birth"
											maxlength="4" placeholder="년(4자)" size="6"> <select
											name="birth">
											<option value="">월</option>
											<option value="01">1</option>
											<option value="02">2</option>
											<option value="03">3</option>
											<option value="04">4</option>
											<option value="05">5</option>
											<option value="06">6</option>
											<option value="07">7</option>
											<option value="08">8</option>
											<option value="09">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
										</select> <input type="text" name="birth_dd" maxlength="2"
											placeholder="일" size="4">
									</div>
									<div class="form-group">
										<label>전화번호</label> <input class="form-control"
											placeholder="전화번호" name="tell" id="signUpUserTelNo"
											type="text" />
									</div>
									<div class="form-group">
										<label>이메일</label> <input type="text" name="mem_email"
											maxlength="30">@ <select name="mem_email">
											<option>naver.com</option>
											<option>daum.net</option>
											<option>gmail.com</option>
											<option>nate.com</option>
												</select> 
										<!-- <div class="form-group">
                            		<label>사업자번호</label>
                            		<input class="form-control" placeholder="사업자번호" name="signUpUserCompanyNo" id="signUpUserCompanyNo" type="text" />
                            	</div> -->
										<div class="form-group">
											<label style="display: block;">주소</label> <input
												class="form-control" style="width: 40%; display: inline;"
												placeholder="우편번호" name="signUpUserPostNo"
												id="signUpUserPostNo" type="text" readonly="readonly">
											<button type="button" class="btn btn-default"
												onclick="execPostCode();">
												<i class="fa fa-search"></i> 우편번호 찾기
											</button>
											<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                                <div class="modal-dialog">
	                                    <div class="modal-content">
	                                        <div class="modal-header">
	                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                                            <h4 class="modal-title" id="myModalLabel">우편번호 서비스</h4>
	                                        </div>
	                                        <div class="modal-body">
	                                        	<label>주소 입력</label>
	                                        	<div class="form-group input-group">
		                                           <input type="text" class="form-control" name="dlgSearchAddress" onclick="execPostCode();">
			                                           <span class="input-group-btn">
			                                               <button class="btn btn-default" type="button"><i class="fa fa-search"></i>
			                                               </button>
			                                           </span>
		                                       </div>
	                                            <p class="help-block">아래와 같은 조합으로 검색을 하시면 더욱 정확한 결과가 검색됩니다.</p>
	                                            <p class="help-block">도로명 + 건물번호</p>
	                                            <p class="text-primary">예) 판교역로 235, 제주 첨단로 242</p>
	                                            <p class="help-block">지역명(동/리) + 번지</p>
	                                            <p class="text-primary">예) 삼평동 681, 제주 영평동 2181</p>
	                                            <p class="help-block">지역명(동/리) + 건물명(아파트명)</p>
	                                            <p class="text-primary">예) 분당 주공, 연수동 주공3차</p>
	                                            <p class="help-block">사서함명 + 번호</p>
	                                            <p class="text-primary">예) 분당우체국사서함 1~100</p>
	                                        </div>
	                                        <div class="modal-footer">
	                                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                                            <button type="button" class="btn btn-primary">저장</button>
	                                        </div>
	                                    </div>
	                                    /.modal-content
	                                </div>
	                                /.modal-dialog
	                            </div> -->
										</div>
										<div class="form-group">
											<input class="form-control" style="top: 5px;"
												placeholder="도로명 주소" name="address"
												id="signUpUserCompanyAddress" type="text"
												readonly="readonly" />
										</div>
										<div class="form-group">
											<input class="form-control" placeholder="상세주소"
												name="signUpUserCompanyAddressDetail"
												id="signUpUserCompanyAddressDetail" type="text" />
										</div>
										 <button type="submit" class="btn btn-lg btn-success btn-block">회원가입</button> 
<!-- 										<input type="submit" class="btn btn-lg btn-success btn-block" value="회원가입" onclick="DosignUp();" />
 -->  								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript">
			function execPostCode() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
								// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
								var extraRoadAddr = ''; // 도로명 조합형 주소 변수
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraRoadAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraRoadAddr += (extraRoadAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraRoadAddr !== '') {
									extraRoadAddr = ' (' + extraRoadAddr + ')';
								}
								// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
								if (fullRoadAddr !== '') {
									fullRoadAddr += extraRoadAddr;
								}
								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								console.log(data.zonecode);
								console.log(fullRoadAddr);

								$("[name=signUpUserPostNo]").val(data.zonecode);
								$("[name=address]").val(fullRoadAddr);

								/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
								document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
								document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
							}
						}).open();
			}
		</script>
		<!-- </div> -->
		<!--quick  -->
			<%@ include file="/WEB-INF/views/board/commons/quick.jsp" %>

	</div>
	<!-- //container -->
</div> --%>