<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
					<navi> <a
						href="/html/kr/performance/performance_010101.html">공연안내</a>&gt;<a
						href="/html/kr/performance/performance_010101.html">공연안내</a>&gt;<a
						href="/html/kr/performance/performance_010101.html"
						class="navi_ov">공연정보</a></navi>
					<div class="nv_service">
						<a class="nvs_print" href="#total"
							onclick="printContent('/html/kr/performance/performance_010101.html?mode=V&amp;code=2946');return false"><span
							class="hide">Print</span></a> <a href="#"
							onclick="twitterOpen('http://www.djac.or.kr/html/kr/performance/performance_010101.html?mode=V&amp;code=2946', '대전예술의전당 | 공연정보'); return false;"
							class="nvs_twt twitter" target="_blank" title="대전예술의전당 트위터(새창)"><span
							class="hide">트위터</span></a> <a href="#"
							onclick="facebookOpen('http://www.djac.or.kr/html/kr/performance/performance_010101.html?mode=V&amp;code=2946'); return false;"
							class="nvs_face facebook" target="_blank"
							title="대전예술의전당 페이스북(새창)"><span class="hide">페이스북</span></a>

					</div>
				</div>
			</div>
			
			
		<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 850px;
  padding: 15% 0 0;
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
<div class="login-page">

  <form class="form" action="jointro" method="post">

									    <h3 >공연단 회원가입</h3>
									
											<div class="form-group" id="divInputId">
												<label>아이디</label> <input class="form-control"
													style="margin-bottom: 5px;" placeholder="아이디" name="mem_id"
													id="mem_id" type="text" /> <input type="button"
													class="btn btn-default" style="width: 30%;" id="checkid"
													value="중복확인" onclick="duplicationId();" /> <br /> <span
													id="idMsg"></span>
											</div>
											<div class="form-group">
												<label>비밀번호</label> <input class="form-control"
													placeholder="비밀번호" name="mem_pwd" id="mem_pwd"
													type="password" />
											</div>
											<div class="form-group">
												<label>비밀번호 확인</label> <input class="form-control"
													placeholder="비밀번호 확인" name="mem_pwd2" id="mem_pwd2"
													type="password" /> <font id="chkNotice" size="2"></font>

											</div>
											<div class="form-group">
												<label>사업자 이름</label> <input class="form-control"
													placeholder="이름" name="name" id="name" type="text" /> <br />
												<span id="nameMsg"></span>
											</div>
											<div class="form-group">
												<label>사업자번호</label> <input type="text"
													class="form-control input-sm" name="bupanum"
													id="bupanum" placeholder="예 : 000-00-00000"
													maxlength="12"><input type="button"
													class="btn btn-default" style="width: 30%;" id="checkbupanum"
													value="유효성검사" onclick="duplicationId();" />
											</div>




											<div class="form-group">
												<label>이메일</label> <input type="text" name="mem_email"
													id="mem_email" maxlength="30">@ <select
													name="mem_email">

													<option>naver.com</option>
													<option>daum.net</option>
													<option>gmail.com</option>
													<option>nate.com</option>
												</select>
											</div>

											<button type="submit"
												class="btn btn-lg btn-success btn-block">회원가입</button>
											<!-- <input type="button" class="btn btn-lg btn-success btn-block" value="회원가입" onclick="DosignUp();" /> -->
									</form>
								</div>
							</div>
					
				<script type="text/javascript">
					$('input[name="mem_id"]')
							.on(
									'blur',
									function() {
										var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
										if (!idReg.test($(this).val())) {
											$(this).focus();
											$('span#idMsg')
													.text(
															"아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.")
													.css({
														"font-weight" : "bold",
														"color" : "red"
													});
											return;
										} else {
											$('span#idMsg').text("");
										}
									});

					$("#mem_pwd").change(function() {
						checkPassword($('#mem_pwd').val(), $('mem_id').val());
					});
					function checkPassword(password, id) {

						if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/
								.test(password)) {
							alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
							$('#mem_pwd').val('').focus();
							return false;
						}
						var checkNumber = password.search(/[0-9]/g);
						var checkEnglish = password.search(/[a-z]/ig);
						if (checkNumber < 0 || checkEnglish < 0) {
							alert("숫자와 영문자를 혼용하여야 합니다.");
							$('#mem_pwd').val('').focus();
							return false;
						}
						return true;
					}
					$(function() {
						$('#mem_pwd').keyup(function() {
							$('#chkNotice').html('');
						});

						$('#mem_pwd2').keyup(function() {

							if ($('#mem_pwd').val() != $('#mem_pwd2').val()) {
								$('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
								$('#chkNotice').attr('color', 'red');
							} else {
								$('#chkNotice').html('비밀번호 일치함<br><br>');
								$('#chkNotice').attr('color', 'blue');
							}
						});
					});

					$('input[name="name"]').on(
							'blur',
							function() {
								var RegexName = /^[가-힣]{2,4}$/; //이름 유효성 검사 2~4자 사이
								if (!RegexName.test($.trim($("#name").val()))) {
									$(this).focus();
									$('span#nameMsg').text(
											"이름은 2글자에서 4글자까지만 입력가능합니다.").css({
										"font-weight" : "bold",
										"color" : "red"
									});
									return;
								} else {
									$('span#nameMsg').text("");
								}
							});

					function bupanum(str) {
						str = str.replace(/[^0-9]/g, '');
						var tmp = '';
						if (str.length < 4) {
							return str;
						} else if (str.length < 7) {
							tmp += str.substr(0, 3);
							tmp += '-';
							tmp += str.substr(3);
							return tmp;
						} else {
							tmp += str.substr(0, 3);
							tmp += '-';
							tmp += str.substr(1, 2);
							tmp += '-';
							tmp += str.substr(5);
							return tmp;
						}
						return str;
					}

					var li_number = document.getElementById("bupanum");
					li_number.onkeyup = function(event) {
						event = event || window.event;
						var _val = this.value.trim();
						this.value = bupanum(_val);
					}
					
				

					$("input#join2").on('click', function(e) {

						alert("bbbbbb");
					});

					$(function() {

						$("form")
								.submit(
										function() {
											var tel1_pattert = /(^01[016789]$)/; //정규식
											var tel2_3_pattern = /\d{4}&/;
											var regExp = /^[0-9]+$/;
											var format = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
											var regExpbir = /^\d{4}$/;
											var regId = /^[a-z0-9]{3,10}$/; // 아이디 유효성 검사식

											var id = $('#mem_id');

											if (!check(regId, id,
													"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
												alert("ㅎㅎ");
												return false;
											}
											if ($("#mem_id").val() == "") {
												alert("아이디를 꼭 입력하세요!");
												$("#mem_id").focus();
												return false;

											} else if ($("#mem_pwd").val() == "") {
												alert("비밀번호를 꼭 입력하세요!");
												$("#mem_pwd").focus();
												return false;

											} else if ($("#mem_pwd2").val() == "") {
												alert("비밀번호확인을 꼭 입력하세요!");
												$("#mem_pwd2").focus();
												return false;

											} else if ($("#name").val() == "") {
												alert("사업자 이름을 꼭 입력하세요!");
												$("#name").focus();
												return false;

											} else if ($("#bupanum").val() == "") {
												alert("사업자번호를 꼭 입력하세요!");
												$("#bupanum").focus();
												return false;

											} else if ($("#mem_email").val() == "") {
												alert("이메일을 꼭 입력하세요!");
												$("#mem_email").focus();
												return false;

											}

										});
					});

					$('#checkbupanum').on("click", function(e) {

						$.ajax({
							type : 'POST',
							url : '/checkSignuptwo',
							data : {
								"bupanum" : $('#bupanum').val()
							},
							success : function(data) {
								if (data == 0) {
									alert("유효한 번호입니다");
								} else {
									alert("유효하지않은 번호입니다");
								}
							}
						}); //end ajax    
						//end on    

					});

					function check(re, what, message) {
						if (re.test(what.value)) {
							return true;
						}
						alert(message);
						what.value = "";
						what.focus();
						//return false;
					}
					
					$('#checkid').on("click", function(e) {

						$.ajax({
							type : 'POST',
							url : '/checkSignuptwo',
							data : {
								"mem_id" : $('#mem_id').val()
							},
							success : function(data) {
								if (data == 0) {
									alert("사용가능한 아이디입니다");
								} else {
									alert("중복된아이디입니다");
								}
							}
						}); //end ajax    
						//end on    

					});

					function check(re, what, message) {
						if (re.test(what.value)) {
							return true;
						}
						alert(message);
						what.value = "";
						what.focus();
						//return false;
					}
					
				</script>
	

				<!-- </div> -->
				<!--quick  -->
				<%-- 	<%@ include file="/WEB-INF/views/board/commons/quick.jsp" %>
 --%>
			</div>
			<!-- //container -->
		</div>