<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>*** KSNET WebHost Sample [JSP] ***</title>
<link
	href="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/css/pgstyle.css"
	rel="stylesheet" type="text/css" charset="euc-kr">
</head>
<script language="javascript">

	function _pay(_frm) 
	{
 		_frm.sndReply.value = getLocalUrl("kspay_wh_rcv") ;

		var agent = navigator.userAgent;
		var midx		= agent.indexOf("MSIE");
		var out_size	= (midx != -1 && agent.charAt(midx+5) < '7');
    	
		var width_	= 500;
		var height_	= out_size ? 568 : 518;
		var left_	= screen.width;
		var top_	= screen.height;
    	
		left_ = left_ /2 - (width_ /2);
		top_ = top_ /2 - (height_ /2);
		
		op = window.open('about:blank','AuthFrmUp',
		        'height='+height_+',width='+width_+',status=yes,scrollbars=no,resizable=no,left='+left_+',top='+top_+'');

		if (op == null)
		{
			alert("팝업이 차단되어 결제를 진행할 수 없습니다.");
			return false;
		}
		
		_frm.target = 'AuthFrmUp';
		_frm.action ='https://kspay.ksnet.to/store/KSPayFlashV1.3/KSPayPWeb.jsp?sndCharSet=utf-8';
		//_frm.action ='http://210.181.28.116/store/KSPayFlashV1.3/KSPayPWeb.jsp?sndCharSet=utf-8';
		
		_frm.submit();
    }

	function getLocalUrl(mypage) 
	{ 
		var myloc = location.href; 
		return myloc.substring(0, myloc.lastIndexOf('/')) + '/' + mypage;
	} 
	
	// goResult() - 함수설명 : 결재완료후 결과값을 지정된 결과페이지(kspay_wh_result.jsp)로 전송합니다.
	function goResult(){
		document.KSPayWeb.target = "";
		document.KSPayWeb.action = "kspay_wh_result";
		document.KSPayWeb.submit();
	}
	// eparamSet() - 함수설명 : 결재완료후 (kspay_wh_rcv.jsp로부터)결과값을 받아 지정된 결과페이지(kspay_wh_result.jsp)로 전송될 form에 세팅합니다.
	function eparamSet(rcid, rctype, rhash){
		document.KSPayWeb.reWHCid.value 	= rcid;
		document.KSPayWeb.reWHCtype.value   = rctype  ;
		document.KSPayWeb.reWHHash.value 	= rhash  ;
	}

</script>
<body>
	<!-----------------------------------------<Part 1. KSPayWeb Form: 결과페이지주소 설정 > ---------------------------------------->
	<!--결제 완료후 결과값을 받아처리할 결과페이지의 주소-->
	<form name=KSPayWeb action="./kspay_wh_result.jsp" method=post>
		<table width="560" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="50" align="right"
					background="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/bg_top.gif"
					class="txt_pd1">상품 결재</td>
			</tr>
			<tr>
				<td height="530" valign="top"
					background="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/bg_man.gif">
					<table width="560" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="25">&nbsp;</td>
							<td width="505" align="center">
								<table border='0' cellpadding='0' cellspacing='0' width='500'
									align='center'>

									<tr>
										<td height="40" style="padding: 0px 0px 0px 15px;"><img
											src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_tit3.gif"
											width="30" height="30" align="absmiddle"> <strong>결재방법선택<strong></td>
									</tr>
									<tr>
										<td align="center"><table width="400" border="0"
												cellspacing="0" cellpadding="0">
												<tr>
													<td width="110"><img
														src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif"
														width="11" height="11" align="absmiddle"> 결제수단</td>
													<!--신용카드/가상계좌/계좌이체/월드패스카드/포인트/휴대폰결제/상품권-->
													<td width="290">
														<!-- <input type="hidden" name="sndPayMethod" value="1000000000"> 신용카드인 경우 -->
														<select name=sndPaymethod>
															<option value="1000000000" selected>신용카드</option>
															<option value="0100000000">가상계좌</option>
															<option value="0010000000">계좌이체</option>
															<option value="0001000000">월드패스카드</option>
															<option value="0000100000">문화상품권</option>
															<option value="0000010000">휴대폰결제</option>
															<option value="0000001000">게임문화상품권</option>
													</select>
													</td>
												</tr>
												<tr bgcolor="#E3E3E3">
													<td height="1" colspan="2"></td>
												</tr>
												<tr>													
													<!-- 테스트용 아이디: 2999199999 (테스트이후 실제발급아이디로 변경)-->
													<td width="290"><input type='hidden' name='sndStoreid'
														value='${creditReq.sndStoreid }' size='15' maxlength='10'></td>
												</tr>
												<tr bgcolor="#E3E3E3">
													<td height="1" colspan="2"></td>
												</tr>
												<tr>
													<td width="110"><img
														src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif"
														width="11" height="11" align="absmiddle"> 주문번호</td>
													<!--주문번호는 50Byte(한글 25자) 입니다. ' " ` 는 사용하실수 없습니다. 따옴표,쌍따옴표,백쿼테이션 -->
													<td width="290"><input type='text'
														name='sndOrdernumber' value='${creditReq.sndOrderNumber }' size='30'></td>
												</tr>
												<tr bgcolor="#E3E3E3">
													<td height="1" colspan="2"></td>
												</tr>
												<tr bgcolor="#E3E3E3">
													<td height="1" colspan="2"></td>
												</tr>
											</table></td>
									</tr>
									<tr>
										<td height="40" style="padding: 0px 0px 0px 15px;">
											<!--옵션정보 : 옵션 사항 입니다. 설정 안하거나 값을 보내지 않을경우 default 값으로 설정됩니다.-->
											<img
											src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_tit4.gif"
											width="30" height="30" align="absmiddle"> <strong>주문 정보</strong>
										</td>
									</tr>
									<tr>
										<td align="center"><table width="400" border="0"
												cellspacing="0" cellpadding="0">
												<tr>
													<td width="110"><img
														src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif"
														width="11" height="11" align="absmiddle"> 상품명</td>
													<!--상품명 50Byte(한글 25자) 입니다. ' " ` 는 사용하실수 없습니다. 따옴표,쌍따옴표,백쿼테이션 -->
													<td width="290"><input type='text' name='sndGoodname'
														value='${creditReq.sndGoodname }' size='30'></td>
												</tr>
												<tr bgcolor="#E3E3E3">
													<td height="1" colspan="2"></td>
												</tr>
												<tr>
													<td width="110"><img
														src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif"
														width="11" height="11" align="absmiddle"> 가격</td>
													<!--금액은 ,없이 입력 -->
													<td width="290"><input type='text' name='sndAmount'
														value='${creditReq.sndAmount }' size='15' maxlength='9'></td>
												</tr>
												<tr bgcolor="#E3E3E3">
													<td height="1" colspan="2"></td>
												</tr>
												<tr>
													<td width="110"><img
														src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif"
														width="11" height="11" align="absmiddle"> 주문자</td>
													<td width="290"><input type='text' name='sndOrdername'
														value='${creditReq.sndOrdername }' size='30'></td>
												</tr>
												<tr bgcolor="#E3E3E3">
													<td height="1" colspan="2"></td>
												</tr>
												<tr>
													<td width="110"><img
														src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif"
														width="11" height="11" align="absmiddle"> Email</td>
													<!--KSPAY에서 결제정보를 메일로 보내줍니다.(신용카드거래에만 해당)-->
													<td width="290"><input type='text' name='sndEmail'
														value='${creditReq.sndEmail }' size='30'></td>
												</tr>
												<tr bgcolor="#E3E3E3">
													<td height="1" colspan="2"></td>
												</tr>
												<tr>
													<td width="110"><img
														src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif"
														width="11" height="11" align="absmiddle"> 전화번호</td>
													<!--전화번호 value 값에 숫자만 넣게 해주시길 바랍니다. : '-' 가 들어가면 안됩니다.-->
													<td width="290"><input type='text' name='sndMobile'
														value='${creditReq.sndMobile }' size='12' maxlength='12'></td>
												</tr>
												<tr bgcolor="#E3E3E3">
													<td height="1" colspan="2"></td>
												</tr>
											</table></td>
									</tr>
									<tr>
										<td height="40" align="center"><input type="button"
											value="결 제" onClick="javascript:_pay(document.KSPayWeb);"></td>
									</tr>
									<tr>
										<td height="66" align='center'
											background="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/bg_rem.gif">
											위의 파라미터는 기본파라미터만 정의되어있으며 <br> 추가파라미터 기능추가는 소스상에 hidden으로
											처리되어있으므로 <br> 메뉴얼 참조후 세팅하여 사용하시면 됩니다.
										</td>
									</tr>
								</table>
								<input type=hidden name=sndServicePeriod
								value="YYYY년MM월DD일~YYYY년MM월DD일"> <!-- 실제 배송상품이아닌 컨텐츠상품시 제공기간표시 -->
								<!----------------------------------------------- <Part 2. 추가설정항목(메뉴얼참조)>  ----------------------------------------------->

								<!-- 0. 공통 환경설정 --> <input type=hidden name=sndReply value="">
								<input type=hidden name=sndGoodType value="1"> <!-- 상품유형: 실물(1),디지털(2) -->

								<!-- 1. 신용카드 관련설정 --> <!-- 신용카드 결제방법  --> <!-- 일반적인 업체의 경우 ISP,안심결제만 사용하면 되며 다른 결제방법 추가시에는 사전에 협의이후 적용바랍니다 -->
								<input type=hidden name=sndShowcard value="I,M"> <!-- I(ISP), M(안심결제), N(일반승인:구인증방식), A(해외카드), W(해외안심)-->

								<!-- 신용카드(해외카드) 통화코드: 해외카드결제시 달러결제를 사용할경우 변경 --> <input
								type=hidden name=sndCurrencytype value="WON"> <!-- 원화(WON), 달러(USD) -->

								<!-- 할부개월수 선택범위 --> <!--상점에서 적용할 할부개월수를 세팅합니다. 여기서 세팅하신 값은 결제창에서 고객이 스크롤하여 선택하게 됩니다 -->
								<!--아래의 예의경우 고객은 0~12개월의 할부거래를 선택할수있게 됩니다. --> <input
								type=hidden name=sndInstallmenttype
								value="ALL(0:2:3:4:5:6:7:8:9:10:11:12)"> <!-- 가맹점부담 무이자할부설정 -->
								<!-- 카드사 무이자행사만 이용하실경우  또는 무이자 할부를 적용하지 않는 업체는  "NONE"로 세팅  -->
								<!-- 예 : 전체카드사 및 전체 할부에대해서 무이자 적용할 때는 value="ALL" / 무이자 미적용할 때는 value="NONE" -->
								<!-- 예 : 전체카드사 3,4,5,6개월 무이자 적용할 때는 value="ALL(3:4:5:6)" --> <!-- 예 : 삼성카드(카드사코드:04) 2,3개월 무이자 적용할 때는 value="04(3:4:5:6)"-->
								<!-- <input type=hidden	name=sndInteresttype value="10(02:03),05(06)"> -->
								<input type=hidden name=sndInteresttype value="NONE"> <!-- 2. 온라인입금(가상계좌) 관련설정 -->
								<input type=hidden name=sndEscrow value="1"> <!-- 에스크로사용여부 (0:사용안함, 1:사용) -->

								<!-- 3. 월드패스카드 관련설정 --> <input type=hidden name=sndWptype
								value="1"> <!--선/후불카드구분 (1:선불카드, 2:후불카드, 3:모든카드) --> <input
								type=hidden name=sndAdulttype value="1"> <!--성인확인여부 (0:성인확인불필요, 1:성인확인필요) -->

								<!-- 4. 계좌이체 현금영수증발급여부 설정 --> <input type=hidden
								name=sndCashReceipt value="0"> <!--계좌이체시 현금영수증 발급여부 (0: 발급안함, 1:발급) -->

								<!-- 5. 상품권, 게임문화상품권 관련 설정 --> <input type=hidden name=sndMembId
								value="userid"> <!-- 가맹점사용자ID (문화,게임문화 상품권결제시 필수) --> <!----------------------------------------------- <Part 3. 승인응답 결과데이터>  ----------------------------------------------->
								<!-- 결과데이타: 승인이후 자동으로 채워집니다. (*변수명을 변경하지 마세요) --> <input
								type=hidden name=reWHCid value=""> <input type=hidden
								name=reWHCtype value=""> <input type=hidden
								name=reWHHash value=""> <!--------------------------------------------------------------------------------------------------------------------------->

								<!--업체에서 추가하고자하는 임의의 파라미터를 입력하면 됩니다.--> <!--이 파라메터들은 지정된결과 페이지(kspay_result.jsp)로 전송됩니다.-->
								<input type=hidden name='sndAddress' value="${creditReq.sndAddress }">
								<input type=hidden name=b value="b1"> 
								<input type=hidden name=c value="c1">
								<input type=hidden name=d value="d1"> <!--------------------------------------------------------------------------------------------------------------------------->
								</form>
							</td>
							<td width="30">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="37"
					background="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/bg_bot.gif">&nbsp;</td>
			</tr>
		</table>
</body>
</html>
