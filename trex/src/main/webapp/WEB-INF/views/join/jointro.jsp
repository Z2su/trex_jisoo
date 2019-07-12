<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
        #wrap{
            width:530px;
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
</head>
<body>
    <!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">회원가입</font></b>
        <br><br><br>


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
				var inputId = $("#signUpUserId").val();
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

							$("#signUpUserPwd").focus();
							isCheckId = 1;
						} else {
							alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");

							$("#divInputId").addClass("has-error")
							$("#divInputId").removeClass("has-success")

							$("#signUpUserId").focus();
						}
					},
					error : function(req, status, errThrown) {
						alert("network error occur");
					}
				});
			}

			function DosignUp() {

				var inputId = $("#signUpUserId").val();
				var inputPwd = $("#signUpUserPwd").val();
				var inputPwdCfm = $("#signUpUserPwdCfm").val();
				var inputCpnName = $("#signUpUserCompanyName").val();
				var inputCpnTelNo = $("#signUpUserTelNo").val();
				var inputCpnEmail = $("#signUpUserEmail").val();
				var inputCpnNo = $("#signUpUserCompanyNo").val();
				var inputCpnAddr1 = $("#signUpUserPostNo").val();
				var inputCpnAddr2 = $("#signUpUserCompanyAddress").val();
				var inputCpnAddr3 = $("#signUpUserCompanyAddressDetail").val();

				if (inputId.length == 0) {
					alert("아이디를 입력해 주세요.");
					$("#signUpUserId").focus();
					return;
				}
				if (isCheckId == 0) {
					alert("아이디 중복 체크를 해주세요.");
					$("#signUpUserId").focus();
					return;
				}

				if (inputPwd.length == 0) {
					alert("비밀번호를 입력해 주세요.");
					$("#signUpUserPwd").focus();
					return;
				}
				if (inputPwd != inputPwdCfm) {
					alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요.");
					$("#signUpUserPwd").focus();
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
							<h3 class="panel-title">공연단 회원가입</h3>
						</div>
						<div class="panel-body">
							<form role="form" action="jointro" method="post">
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
											placeholder="비밀번호 확인" name="mem_pwd" id="signUpUserPwdCfm"
											type="password" />
									</div>
									<div class="form-group">
										<label>사업자 이름</label> <input class="form-control" placeholder="이름"
											name="name" id="name" type="text" />
									</div>
									<div class="form-group">
										<label>이메일</label> <input type="text" name="mem_email"
											maxlength="30">@ <select name="mem_email">
											<option>naver.com</option>
											<option>daum.net</option>
											<option>gmail.com</option>
											<option>nate.com</option>
															</select> 
									<div class="form-group">
                            			<label>사업자번호</label>
                            			<input class="form-control" placeholder="사업자번호" name="bupanum" id="bupanum" type="text" />
                            		</div> 
									
										<button type="submit" class="btn btn-lg btn-success btn-block">회원가입</button>
										<!-- <input type="button" class="btn btn-lg btn-success btn-block" value="회원가입" onclick="DosignUp();" /> -->
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	
		<!-- </div> -->
		<!--quick  -->
		<%-- 	<%@ include file="/WEB-INF/views/board/commons/quick.jsp" %>
 --%>
	</div>
	<!-- //container -->
</div>