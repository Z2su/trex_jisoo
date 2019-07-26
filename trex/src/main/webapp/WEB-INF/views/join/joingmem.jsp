<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




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
			<navi> <a href="/html/kr/performance/performance_010101.html">공연안내</a>&gt;
			<a href="/html/kr/performance/performance_010101.html">공연안내</a>&gt; <a
				href="/html/kr/performance/performance_010101.html" class="navi_ov">공연정보</a>
			</navi>
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

  <form class="form"action="joinregist" method="post">
								<h3>일반 회원가입</h3>
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
										<label>이름</label> <input class="form-control" placeholder="이름"
											name="name" id="name" type="text" /> <br /> <span
											id="nameMsg"></span>
									</div>
									<div class="form-group">
										<label>남</label> <input type="radio" name="gender" value="남">여
										<input type="radio" name="gender" value="여">
									</div>
									<div class="form-group required">
										<label for="birth">생년월일</label> <input type="text"
											class="form-control" id="birth" name="birth"
											placeholder="ex) 19990415" required>
										<div class="check_font" id="birth_check"></div>
										<span id="birthMsg"></span>
									</div>
									<div class="form-group required">
										<label for="tell">전화번호</label> <input type="text"
											class="form-control" id="tell" name="tell"
											placeholder="ex)01099593141" required>
										<div class="check_font" id="birth_check"></div>
										<span id="tellMsg"></span>
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
									<div class="form-group">
										<label style="display: block;">주소</label> <input
											class="form-control" style="width: 40%; display: inline;"
											placeholder="우편번호" name="address" id="address" type="text"
											readonly="readonly">
										<button type="button" class="btn btn-default"
											onclick="execPostCode();">
											<i class="fa fa-search"></i> 우편번호 찾기
										</button>
									</div>
									<div class="form-group">
										<input class="form-control" style="top: 5px;"
											placeholder="도로명 주소" name="address" id="addressone"
											type="text" readonly="readonly" />
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="상세주소"
											name="signUpUserCompanyAddressDetail" id="addresstwo"
											type="text" />
									</div>
									<button id="join" type="submit"
										class="btn btn-lg btn-success btn-block">회원가입</button>
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
									<%-- <button id="join" type="submit"  href="${pageContext.request.contextPath}"
										class="fa fa-rotate-right pr-2" >취소하기</button> --%>
									<%-- <div class="reg_button">
										<a class="btn btn-danger px-3" href="${pageContext.request.contextPath}">
											<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
											</a>  --%>
									<!-- <input id="join2" type="button"
										class="btn btn-lg btn-success btn-block" value="회원가입"
										onclick="DosignUp();" /> -->



							</form>
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
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)z`
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

		<script type="text/javascript">
		$('input[name="mem_id"]').on('blur',function(){
			 var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
		        if( !idReg.test( $(this).val() ) ) {
		            $(this).focus();
		            $('span#idMsg').text("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.").css({"font-weight":"bold","color":"red"});           
		            return;
		        }else{
		        	$('span#idMsg').text("");
		        }
		});
		
		$("#mem_pwd").change(function(){
		    checkPassword($('#mem_pwd').val(),$('mem_id').val());
		});
		function checkPassword(password,id){
		    
		    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
		        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
		        $('#mem_pwd').val('').focus();
		        return false;
		    }    
		    var checkNumber = password.search(/[0-9]/g);
		    var checkEnglish = password.search(/[a-z]/ig);
		    if(checkNumber <0 || checkEnglish <0){
		        alert("숫자와 영문자를 혼용하여야 합니다.");
		        $('#mem_pwd').val('').focus();
		        return false;
		    }	
		    return true;
		}
		
		
		$(function(){
		    $('#mem_pwd').keyup(function(){
		      $('#chkNotice').html('');
		    });

		    $('#mem_pwd2').keyup(function(){

		        if($('#mem_pwd').val() != $('#mem_pwd2').val()){
		          $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
		          $('#chkNotice').attr('color', 'red');
		        } else{
		          $('#chkNotice').html('비밀번호 일치함<br><br>');
		          $('#chkNotice').attr('color','blue');
		        }
		    });
		});
		
		$('input[name="name"]').on('blur',function(){
			var RegexName = /^[가-힣]{2,4}$/; //이름 유효성 검사 2~4자 사이
			if ( !RegexName.test($.trim($("#name").val())) ){
		            $(this).focus();
		            $('span#nameMsg').text("이름은 2글자에서 4글자까지만 입력가능합니다.").css({"font-weight":"bold","color":"red"});           
		            return;
		        }else{
		        	$('span#nameMsg').text("");
		        }
		});
		
		// 생일 유효성 검사
		var birthJ = false;
		
		// 생년월일	birthJ 유효성 검사
		$('#birth').blur(function(){
			var dateStr = $(this).val();		
		    var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
		    var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
		    var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
		    var today = new Date(); // 날짜 변수 선언
		    var yearNow = today.getFullYear(); // 올해 연도 가져옴
			
		    if (dateStr.length <=8) {
				// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
			    if (1900 > year || year > yearNow){
			    	
			    	$('#birthMsg').text('생년월일을 확인해주세요 :)');
					$('#birthMsg').css('color', 'red');
			    	
			    }else if (month < 1 || month > 12) {
			    		
			    	$('#birthMsg').text('생년월일을 확인해주세요 :)');
					$('#birthMsg').css('color', 'red'); 
			    
			    }else if (day < 1 || day > 31) {
			    	
			    	$('#birthMsg').text('생년월일을 확인해주세요 :)');
					$('#birthMsg').css('color', 'red'); 
			    	
			    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
			    	 
			    	$('#birthMsg').text('생년월일을 확인해주세요 :)');
					$('#birthMsg').css('color', 'red'); 
			    	 
			    }else if (month == 2) {
			    	 
			       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
			       	
			     	if (day>29 || (day==29 && !isleap)) {
			     		
			     		$('#birthMsg').text('생년월일을 확인해주세요 :)');
						$('#birthMsg').css('color', 'red'); 
			    	
					}else{
						$('#birtj').text('');
						birthJ = true;
					}//end of if (day>29 || (day==29 && !isleap))
			     	
			    }else{
			    	
			    	$('#birthMsg').text(''); 
					birthJ = true;
				}//end of if
				
				}else{
					//1.입력된 생년월일이 8자 초과할때 :  auth:false
					$('#birthMsg').text('생년월일을 확인해주세요 :)');
					$('#birthMsg').css('color', 'red');  
					
				}

			}); //End of method /*
			
			$('input[name="tell"]').on('blur',function(){
				var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
			        if( !regExp.test( $(this).val() ) ) {
			            $(this).focus();
			            $('span#tellMsg').text("전화번호 형식이 맞지않습니다.").css({"font-weight":"bold","color":"red"});           
			            return;
			        }else{
			        	$('span#tellMsg').text("");
			        }
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
									var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
									var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
									// 이메일이 적합한지 검사할 정규식

								
									var id = $('#mem_id');

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
										alert("이름을 꼭 입력하세요!");
										$("#name").focus();
										return false;

									} else if ($("input:radio[name='gender']")
											.is(":checked") == false) {
										alert('성별을 체크하세요');
										$('#gender').focus();
										return false;

									} else if ($("#birth").val() == "") {
										alert("생일을 꼭 입력하세요!");
										$("#birth").focus();
										return false;

									} else if ($("#tell").val() == "") {
										alert("전화번호를 꼭 입력하세요!");
										$("#tell").focus();
										return false;

									} else if ($("#mem_email").val() == "") {
										alert("이메일을 꼭 입력하세요!");
										$("#mem_email").focus();
										return false;

									} else if ($("#address").val() == "") {
										alert("주소를 꼭입력해주세요!");
										$("#address").focus();
										return false;

									} else if ($("#addressone").val() == "") {
										alert("주소를 꼭입력해주세요!");
										$("#addressone").focus();
										return false;

									} else if ($("#addresstwo").val() == "") {
										alert("주소를 꼭입력해주세요!");
										$("#addresstwo").focus();
										return false;

									}

								});
			});

			$('#checkid').on("click", function(e) {

				$.ajax({
					type : 'POST',
					url : '/checkSignup',
					data : {
						"mem_id" : $('#mem_id').val()
					},
					success : function(data) {
						if (data == 0) {
							alert("사용가능한 아이디입니다.")
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


	</div>
	

	<!-- //container -->
</div>