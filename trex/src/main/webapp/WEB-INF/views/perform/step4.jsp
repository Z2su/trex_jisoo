<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko"><head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<link rel="stylesheet" type="text/css" href="//ticketimage.interpark.com/TicketImage/onestop/css/reset.css">
<link rel="stylesheet" type="text/css" href="//ticketimage.interpark.com/TicketImage/onestop/css/style.css">
<script type="text/javascript" src="//ticketimage.interpark.com/TicketImage/onestop/css/common.js"></script>
<script type="text/javascript" src="//ticketimage.interpark.com/TicketImage/onestop/css/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="/Lib/js/XmlRs.js"></script>
<script type="text/javascript" src="/Book/Inc/Js/common.js"></script>
<script type="text/javascript" src="/Book/Inc/Js/block.js"></script>
<script type="text/javascript" src="/Book/Inc/Js/prototype_1_7.js"></script>
<script type="text/javascript" src="/Book/Inc/Js/Ajax.js"></script>
<script type="text/javascript">
//<![CDATA[
	document.observe("dom:loaded", fnInit);

	var	PrintOrNot = "69000";	// 69003 이면 포장서비스 안됨
	var	Zipwin;	
	var nBookStep = 4;	//현재 예매 단계

	//초기화
	function fnInit(){
		parent.fnSetNowBookStep(nBookStep);
		parent.fnSetNextImage("");
/*
		if (Prototype.Browser.IE){	//IE
			alert("Prototype.Browser.IE");
			window.history.forward(1);
		}else{	//FF, Chrome, Opera, Safari
			history.navigationMode = 'compatible'; // Opera, Safari
			window.history.forward(1);
		}
*/
		var objDelivery = $N("Delivery");

		
		$("Delivery_24012").style.display = "none";	//홈티켓 배송수단 노출
		$("Delivery_24011").style.display = "none";	//모바일티켓 배송수단 노출
		$("Gift_All").style.display = "none";	//포장서비스 노출
		objDelivery[0].disabled = false;	//현장수령 설정
		objDelivery[1].disabled = false;	//일반배송 설정
		objDelivery[2].disabled = false;	//특급배송 설정

		
		if (objDelivery[1].disabled == false){
			objDelivery[1].disabled = false;
		}
		if (objDelivery[2].disabled == false){
			objDelivery[2].disabled = false;
		}

		// 예약번호 선택 안되는 상황에서 예약번호가 활성화 된 경우
		if (objDelivery[0].disabled == true && objDelivery[0].disabled == false){
			objDelivery[0].checked = true;
			objDelivery[1].disabled = true;	//일반
			objDelivery[2].disabled = true;	//특급
		}

		//상품별 배송 제한 하드코딩
		fnGoodsDeliveryCheck();

		// 배송수단 기본 선택
		// 선택 가능한 첫번째 배송수단을 기본으로 선택.
		for(var i = 0; i < objDelivery.length; i++){
			if(objDelivery[i].disabled == false){
				objDelivery[i].checked = true;
				fnChange();
				break;
			}
		}
		
		//받는사람 정보 초기화
		fnSyncAddress();

		// 스포츠 장르 홈티켓 문구 추가
		if (parent.$F("KindOfGoods") == "01007"){
			if (parent.$F("SubCategory") == "07001" || parent.$F("SubCategory") == "07003" || parent.$F("SubCategory") == "07004" || parent.$F("SubCategory") == "07031" || parent.$F("SubCategory") == "07002"){
				$("HomeTicketNotice").innerHTML = "홈티켓은 한 장으로 출력됨에 따라, <br />일행이 동시에 입장하셔야 합니다.";
			}
		}


		//이전 선택한 배송수단이 존재하면 세팅
		var ParentDelivery = "24000";
		for(var i = 0; i < objDelivery.length; i++){
			if(objDelivery[i].disabled == false){
				if (ParentDelivery == objDelivery[i].value){
					objDelivery[i].checked = true;
					break;
				}
			}
		}

		//포장서비스
		var ParentDeliveryGift = "";
		var objrdoGift = $N("rdoGift");

		for(var i = 0; i < objrdoGift.length; i++){
			if(objrdoGift[i].value == ParentDeliveryGift){
				objrdoGift[i].checked = true;
			}
		}

		//입력받은 배송정보
		var ParentRPhoneNo = "--".split("-");
		if (ParentRPhoneNo.length == 3){
			$("RPhoneNo1").value = ParentRPhoneNo[0];
			$("RPhoneNo2").value = ParentRPhoneNo[1];
			$("RPhoneNo3").value = ParentRPhoneNo[2];
		}

		var ParentRHpNo = "--".split("-");
		if (ParentRHpNo.length == 3){
			$("RHpNo1").value = ParentRHpNo[0];
			$("RHpNo2").value = ParentRHpNo[1];
			$("RHpNo3").value = ParentRHpNo[2];
		}

		var ParentRZipcode = parent.$F("RZipcode");
		if (ParentRZipcode!=""){
			$("RZipcode").value = ParentRZipcode;
		}

		$("RName").value = parent.$F("RName");
		$("RAddr").value = parent.$F("RAddr");
		$("RSubAddr").value = parent.$F("RSubAddr");

		fnChange();

		Event.observe("SSN2", "keyup", fnNextBtnMode);

	}

	//이벤트 핸들러
	function fnNextBtnMode(event){
		if ($("SSN2").value.length >= 7){
			parent.fnSetNextImage("C");
		}else{
			parent.fnSetNextImage("");
		}
	}

	//포장서비스 초기화
	function fnInitPackage(){
		if(PrintOrNot == "69003"){
			$N("rdoGift")[0].checked = false;
			$N("rdoGift")[0].disabled = true;
			$N("rdoGift")[1].checked = false;
			$N("rdoGift")[1].disabled = true;
			$N("rdoGift")[2].checked = false;
			$N("rdoGift")[2].disabled = true;
			$N("rdoGift")[3].checked = false;
			//$N("rdoGift")[3].disabled = true;
			$N("rdoGift")[3].disabled = true;
			$N("rdoGift")[4].checked = false;
			$N("rdoGift")[4].disabled = true;
		}
	}

	//우편번호 검색,특급 배송지 검색 버튼 활성화 및 비활성화
	function fnChange(){
		var myDelivery = "00000";
		var objDelivery = $N("Delivery");
		var objGift = $N("rdoGift");
		var myDeliveryObj;

		for(i=0; i < objDelivery.length; i++){
			if(objDelivery[i].checked){
				myDelivery = objDelivery[i].value;
				myDeliveryObj = objDelivery[i];
				break;
			}
		}

		//연휴 배송 제한되는 상품/기간여부 체크
		if (fnHolidayLimit(myDelivery, "20190823")){
			myDeliveryObj.checked = false;
			return;
		}

		$("DeliveryRow").style.display = "none";
		
		//선택한 배송수단 배경색 변경 & 안내창 노출
		for(i=0; i < objDelivery.length; i++){
			if(objDelivery[i].checked){
				$("Delivery_" + objDelivery[i].value).className = "selected";
				$("DeliveryInfo_" + objDelivery[i].value).style.display = "";
			}else{
				$("Delivery_" + objDelivery[i].value).className = "";
				$("DeliveryInfo_" + objDelivery[i].value).style.display = "none";
			}
		}
		

		//포장 서비스 초기화
		fnInitPackage();

		// 현장수령인 경우
		if(myDelivery == "24000" || myDelivery == "24012" || myDelivery == "24011"){
			$("DeliveryRow").style.display = "none";

			objGift[0].checked = false;
			objGift[0].disabled = true;
			objGift[1].checked = false;
			objGift[1].disabled = true;
			objGift[2].checked = false;
			objGift[2].disabled = true;
			objGift[3].checked = false;
			objGift[3].disabled = true;
			objGift[4].checked = false;
			objGift[4].disabled = true;
									
			//검색창을 close
			if (typeof(Zipwin) == 'object' && Zipwin.closed == false)
				Zipwin.close();
		}
		
		// 일반배송
		if(myDelivery == "24001")		{
			$("DeliveryRow").style.display = "";
			//$("spanAddrFindExpress").style.display = "none";
			$("spanAddrFindDely").style.display = "";			
			
			$("chkSyncAddress").disabled = false;

			if(PrintOrNot != "69003"){
				objGift[0].disabled = false;
				objGift[1].disabled = false;
				objGift[2].disabled = false;
				objGift[3].disabled = true;
				objGift[4].disabled = false;
			}

			if (typeof(Zipwin) == 'object' && Zipwin.closed == false)
				fnZipcode('N');
		}
		
		// 특급배송
		if(myDelivery == "24004"){
			$("DeliveryRow").style.display = "";
			//$("spanAddrFindExpress").style.display = "";
			$("spanAddrFindDely").style.display = "none";
			
			$("chkSyncAddress").checked = false;
			fnSyncAddress();
			$("chkSyncAddress").disabled = true;
			
			if(PrintOrNot != "69003"){
				objGift[0].disabled = false;
				objGift[1].disabled = false;
				objGift[2].disabled = false;
				objGift[3].disabled = true;
				objGift[4].disabled = false;
			}

			if (typeof(Zipwin) == 'object' && Zipwin.closed == false)
				fnZipcode('E');
		}
		
		//선택정보 전달
		if(myDelivery != "00000"){
			// 포장지 선택한 경우
			if(!objGift[0].disabled && objGift[0].checked){
				parent.fnSetValDelivery(myDelivery, "Y", "I7002", 500);
			}else if(!objGift[1].disabled && objGift[1].checked){
				parent.fnSetValDelivery(myDelivery, "Y", "I7007", 1000);				
			}else if(!objGift[2].disabled && objGift[2].checked){
				parent.fnSetValDelivery(myDelivery, "Y", "I7006", 1000);				
			}else if(!objGift[3].disabled && objGift[3].checked){
				parent.fnSetValDelivery(myDelivery, "Y", "I7008", 0);				
			}else{
				parent.fnSetValDelivery(myDelivery, "Y", "", 0);
			}
		}

/*		//다음단계버튼 변경
		if(myDelivery != "00000" && fnCheckDeliveryNoAlert()){
			parent.fnSetNextImage("C");	
		}else{
			parent.fnSetNextImage("");	
		}
*/	}

	//배송선택
	function fnSelect(){
		if(fnCheckDelivery()){
			// 주문자정보 유효성 체크			
			var SSN = $F("SSN1") + $F("SSN2");

			if(!fnIsNumber(SSN)||!CheckBirthDay("B",$F("SSN1"))){
				alert("생년월일을 정확하게 입력하여 주세요");
				$("SSN1").value = "";
				$("SSN1").focus();
				return 0;
			}		


			
			//전화번호 유효성 체크
			var PhoneNo1 = $F("PhoneNo1").replace(/\s/g,"");
			var PhoneNo2 = $F("PhoneNo2").replace(/\s/g,"");
			var PhoneNo3 = $F("PhoneNo3").replace(/\s/g,"");
			var HpNo1 = $F("HpNo1").replace(/\s/g,"");
			var HpNo2 = $F("HpNo2").replace(/\s/g,"");
			var HpNo3 = $F("HpNo3").replace(/\s/g,"");

			var RPhoneNo1 = $F("RPhoneNo1").replace(/\s/g,"");
			var RPhoneNo2 = $F("RPhoneNo2").replace(/\s/g,"");
			var RPhoneNo3 = $F("RPhoneNo3").replace(/\s/g,"");
			var RHpNo1 = $F("RHpNo1").replace(/\s/g,"");
			var RHpNo2 = $F("RHpNo2").replace(/\s/g,"");
			var RHpNo3 = $F("RHpNo3").replace(/\s/g,"");

			var PhoneAlert = "유효하지 않은 번호로 입력하셨습니다. 정확한 정보를 입력해 주세요.";
			
			if (PhoneNo1.length < 2 || !fnIsNumber(PhoneNo1)){	alert(PhoneAlert);	$("PhoneNo1").focus();	return 0;	}
			if (PhoneNo2.length < 3 || !fnIsNumber(PhoneNo2)){	alert(PhoneAlert);	$("PhoneNo2").focus();	return 0;	}
			if (PhoneNo3.length < 4 || !fnIsNumber(PhoneNo3)){	alert(PhoneAlert);	$("PhoneNo3").focus();	return 0;	}
			if (HpNo1.length < 3 || !fnIsNumber(HpNo1)){	alert(PhoneAlert);	$("HpNo1").focus();	return 0;	}
			if (HpNo2.length < 3 || !fnIsNumber(HpNo2)){	alert(PhoneAlert);	$("HpNo2").focus();	return 0;	}
			if (HpNo3.length < 4 || !fnIsNumber(HpNo3)){	alert(PhoneAlert);	$("HpNo3").focus();	return 0;	}

			if ($("DeliveryRow").style.display == ""){
				if (RPhoneNo1.length < 2 || !fnIsNumber(RPhoneNo1)){	alert(PhoneAlert);	$("RPhoneNo1").focus();	return 0;	}
				if (RPhoneNo2.length < 3 || !fnIsNumber(RPhoneNo2)){	alert(PhoneAlert);	$("RPhoneNo2").focus();	return 0;	}
				if (RPhoneNo3.length < 4 || !fnIsNumber(RPhoneNo3)){	alert(PhoneAlert);	$("RPhoneNo3").focus();	return 0;	}
				if (RHpNo1.length < 3 || !fnIsNumber(RHpNo1)){	alert(PhoneAlert);	$("RHpNo1").focus();	return 0;	}
				if (RHpNo2.length < 3 || !fnIsNumber(RHpNo2)){	alert(PhoneAlert);	$("RHpNo2").focus();	return 0;	}
				if (RHpNo3.length < 4 || !fnIsNumber(RHpNo3)){	alert(PhoneAlert);	$("RHpNo3").focus();	return 0;	}
			}

			//메일주소 유효성 체크
			var Email = $F("Email");
			if (!fnCheckEmail(Email)){
				alert("유효한 메일주소로 입력해 주세요.");
				$("Email").focus();
				return 0;
			}


			var PhoneNo, HpNo, RPhoneNo, RHpNo;
			PhoneNo = PhoneNo1 + "-" + PhoneNo2 + "-" + PhoneNo3;
			HpNo = HpNo1 + "-" + HpNo2 + "-" + HpNo3;
			RPhoneNo = RPhoneNo1 + "-" + RPhoneNo2 + "-" + RPhoneNo3;
			RHpNo = RHpNo1 + "-" + RHpNo2 + "-" +  RHpNo3;


			var url = "https://ticket.djac.or.kr/Book/Lib/BookEncrypt.asp?SSN=" + SSN + "&PhoneNo=" + PhoneNo + "&HpNo=" + HpNo + "&RPhoneNo=" + RPhoneNo + "&RHpNo=" + RHpNo + "&Email=" + Email;
			//암호화 요청
			fnCallJSONP("fnDeliveryEncryptCallback", url);


			//fnDeliveryEncryptCallback에서 parent.fnSelect를 다시 호출하기 때문에 false를 리턴
			return 2;
		}else{
			return 0;
		}
	}
	
	function fnCheckNumericData(id, length){
		if ((id.length < length) || !fnIsNumber(id)){
			$(id).focus()
			return false;
		}else{
			return true;
		}
	}
	// 암호화 요청 콜백 함수
	function fnDeliveryEncryptCallback(data){
		var myDelivery = "";
		for(i=0; i < $N("Delivery").length; i++){
			if($N("Delivery")[i].checked){
				myDelivery = $N("Delivery")[i].value;
			}
		}

		// 포장지 선택한 경우
		if(!$N("rdoGift")[0].disabled && $N("rdoGift")[0].checked){
			parent.fnSetValDelivery(myDelivery, "Y", "I7002", 500);
		}else if(!$N("rdoGift")[1].disabled && $N("rdoGift")[1].checked){
			parent.fnSetValDelivery(myDelivery, "Y", "I7007", 1000);
		}else if(!$N("rdoGift")[2].disabled && $N("rdoGift")[2].checked){
			parent.fnSetValDelivery(myDelivery, "Y", "I7006", 1000);
		}else if(!$N("rdoGift")[3].disabled && $N("rdoGift")[3].checked){
			parent.fnSetValDelivery(myDelivery, "Y", "I7008", 0);
		}else{
			parent.fnSetValDelivery(myDelivery, "Y", "", 0);
		}

		// 주문자정보 Main 전달
		parent.fnSetValMember(data.Encrypt, $F("MemberName"), data.SSN, data.PhoneNo, data.HpNo, data.Email, "Y", $F("Zipcode"), $F("Addr"), $F("SubAddr"));

		// 수령인정보 Main 전달
		parent.fnSetValAddress(myDelivery, $F("RName"), data.RPhoneNo, data.RHpNo, $F("RZipcode"), $F("RAddr"), $F("RSubAddr"));

		// 다음 단계 선택
		parent.fnNextStep("C");
	}

	//입력정보 확인 및 특급 배송지 검색 확인(특급배송인 경우)
	function fnCheckDelivery(){
		var myDelivery = "00000";
		var myDeliveryObj;
		
		for(i=0; i < $N("Delivery").length; i++){
			if($N("Delivery")[i].checked){
				myDelivery = $N("Delivery")[i].value;
				myDeliveryObj = $N("Delivery")[i];
			}
		}

		if(myDelivery == "00000"){
			alert("배송방법을 선택하세요");
			return false;
		}
	
		//연휴 배송 제한되는 상품/기간여부 체크
		if (fnHolidayLimit(myDelivery, "20190823")){
			myDeliveryObj.checked = false;
			return false;
		}

		//배송지 정보 확인은 일반배송, 특급배송 시에만 한다.
		if(myDelivery == "24001" || myDelivery == "24004"){
			if($F("RName")=="" || $F("RPhoneNo1")=="" || $F("RPhoneNo2")=="" || $F("RPhoneNo3")=="" || $F("RHpNo1")=="" || $F("RHpNo2")=="" || $F("RHpNo3")=="" || $F("RZipcode")=="" || $F("RAddr")=="" || $F("RSubAddr")==""){
				alert("배송지 정보를 빠짐없이 입력하세요.");
				return false;
			}
		}
		
		//생년월일 뒷 7자리 체크
		if($F("SSN1") == "" || !CheckBirthDay("B",$F("SSN1"))){
			alert("생년월일 6자리를 정확하게 입력하여 주세요");
			$("SSN1").focus();
			return false;
		}
		
		//주문자 정보 확인
		if($F("MemberName")=="" || $F("SSN1")=="" || $F("PhoneNo1")=="" || $F("PhoneNo2")=="" || $F("PhoneNo3")=="" || $F("HpNo1")=="" || $F("HpNo2")=="" || $F("HpNo3")=="" || $F("Email")==""){
			alert("주문자 정보를 빠짐없이 입력하세요.");
			return false;
		}
		//특급 배송 가능 지역인지 확인
		if(myDelivery == "24004" && $F("ExpressYN") == "N"){
			alert("특급우편 가능지역이 아닙니다.");
			return false;
		}	
		//모바일티켓인 경우 핸드폰 번호 재확인
		if(myDelivery == "24011"){
			if(!confirm("모바일티켓을 선택하셨습니다.\n예매자 정보의 휴대폰 번호로 모바일티켓이 발송됩니다.\n휴대폰 번호(" + $F("HpNo1") + "-" + $F("HpNo2") + "-" + $F("HpNo3") + ")를 확인해주세요.\n수정없이 다음단계로 이동할까요?")){
				return false;
			}
		}

		return true;
	}

	//입력정보 확인 및 특급 배송지 검색 확인(특급배송인 경우)
	function fnCheckDeliveryNoAlert(){
		var myDelivery = "00000";
		var objDelivery = $N("Delivery");
		for(i=0; i < objDelivery.length; i++){
			if(objDelivery[i].checked){
				myDelivery = objDelivery[i].value;
			}
		}

		//배송지 정보 확인은 일반배송, 특급배송 시에만 한다.
		if(myDelivery == "24001" || myDelivery == "24004"){
			if($F("RName")=="" || $F("RPhoneNo1")=="" || $F("RPhoneNo2")=="" || $F("RPhoneNo3")=="" || $F("RHpNo1")=="" || $F("RHpNo2")=="" || $F("RHpNo3")=="" || $F("RZipcode")=="" || $F("RAddr")=="" || $F("RSubAddr")==""){
				return false;	
			}
		}
		//주문자 정보 확인
		if($F("MemberName")=="" || $F("SSN1")=="" || $F("PhoneNo1")=="" || $F("PhoneNo2")=="" || $F("PhoneNo3")=="" || $F("HpNo1")=="" || $F("HpNo2")=="" || $F("HpNo3")=="" || $F("Email")==""){
			return false;
		}
		//특급 배송 가능 지역인지 확인
		if(myDelivery=="24004" && $F("ExpressYN") == "N"){
			return false;
		}
	
		return true;
	}

	//주문자 정보와 동일
	function fnSyncAddress(){
		if($("chkSyncAddress").checked){
			$("RName").value = $F("MemberName");
			$("RPhoneNo1").value = $F("PhoneNo1");
			$("RPhoneNo2").value = $F("PhoneNo2");
			$("RPhoneNo3").value = $F("PhoneNo3");
			$("RHpNo1").value = $F("HpNo1");
			$("RHpNo2").value = $F("HpNo2");
			$("RHpNo3").value = $F("HpNo3");
			$("RZipcode").value = $F("Zipcode");
			$("RAddr").value = $F("Addr");
			$("RSubAddr").value = $F("SubAddr");
		}else{
			$("RName").value = "";
			$("RPhoneNo1").value = "";
			$("RPhoneNo2").value = "";
			$("RPhoneNo3").value = "";
			$("RHpNo1").value = "";
			$("RHpNo2").value = "";
			$("RHpNo3").value = "";
			$("RZipcode").value = "";
			$("RAddr").value = "";
			$("RSubAddr").value = "";
		}
	}	

	//우편번호 검색창 로드	f= N:일반, E:특급
	function fnZipcode(f){
//		alert("ticket.djac.or.kr");
		var loc = "https://incorp.interpark.com/basicdata/AddressPopup.do?_method=oldAddr";
		var rtnUrl = encodeURI("https://ticket.djac.or.kr/common/AddressSearchResult.asp");
		loc += "&reqSite=90&rtnUrl="+rtnUrl+"&rtnFunc=";
		Zipwin = window.open(loc,"wndZipCode","top=50, left=250, width=700, height=750, scrollbars=yes");
		Zipwin.focus();
		/*
		loc = "/Book/BookZipcode.asp?Flag=" + f;
		Zipwin = window.open(loc,"wndZipCode","top=250, left=250, width=524, height=395, scrollbars=yes");
		Zipwin.focus();
		*/
	}

	//검색된 우편번호 설정
	function fnSetZipcode(v1, v2, v3){
		$("RZipcode").value = v1.replace("-","");
		$("RAddr").value = v2;
		$("RSubAddr").value = "";
		$("ExpressYN").value = v3;
		$("RSubAddr").focus();		
	}
	function fnSetZipcodeNew(v1, v2, v3){
		$("RZipcode").value = v1;
		$("RAddr").value = v2;
		$("RSubAddr").value = v3;
		$("ExpressYN").value = "N";
		$("RSubAddr").focus();		
	}

	//이전 배송지 선택창 로드
	function fnAddress(){
		loc = "/Book/BookAddress.asp";
		win = window.open(loc,"wndBookAddress","top=250, left=250, width=524, height=395, scrollbars=yes");
		win.focus();
	}

	//이전 배송지 설정
	function fnSetAddress(v1, v2, v3, v4, v5, v6, v7){
		// 전화번호포맷(000-0000-0000)으로 넘어오지 않은 경우 처리
		v2 = fnSetPhoneFormat(v2);
		v3 = fnSetPhoneFormat(v3);

		$("RName").value = v1;		
		$("RPhoneNo1").value = v2.substring(0, v2.indexOf("-"));
		$("RPhoneNo2").value = v2.substring(v2.indexOf("-") + 1, v2.lastIndexOf("-"));
		$("RPhoneNo3").value = v2.substring(v2.lastIndexOf("-") + 1);
		$("RHpNo1").value = v3.substring(0, v3.indexOf("-"));
		$("RHpNo2").value = v3.substring(v3.indexOf("-") + 1, v3.lastIndexOf("-"));
		$("RHpNo3").value = v3.substring(v3.lastIndexOf("-") + 1);
		$("RZipcode").value = v4.replace("-","");
		$("RAddr").value = v5;
		$("RSubAddr").value = v6;
		$("ExpressYN").value = v7;		
	}

	// 자동 포커스 이동
	function fnMoveFocus(n, v1, v2){
		if($F(v1).length >= n){
			$(v2).focus();
		}
	}
	
	function fnSetDelivery(n){
		var objDelivery = $N("Delivery");
		var strchangeYN = "N";
		//배송 수단 선택
		for(i=0; i < objDelivery.length; i++){
			if(objDelivery[i].value == n && objDelivery[i].disabled == false){
				objDelivery[i].checked = true;
				strchangeYN = "Y";
				break;
			}
		}
		
		if(strchangeYN == "Y"){
			fnChange();
		}
	}	
//]]>
</script>

<script type="text/javascript">
	//연휴 배송 제한 체크
	function fnHolidayLimit(delivery, playdate){

		return false;

	}
</script>

<script type="text/javascript">
	//상품별 배송 제한 하드코딩
	function fnGoodsDeliveryCheck(){

	}
</script>

</head>
			
<body>
<form name="formDelivery">
<input type="hidden" id="ExpressYN" name="ExpressYN" value="N">
	<div class="contFrame frameBg1">
		<div class="deliveryL">
			<div class="delivery_select">
				<h3 class="title"><img src="//ticketimage.interpark.com/TicketImage/onestop/stit_delivery_01.gif" alt="배송방법선택"></h3>
				<table>
					<caption>배송종류</caption>
					<tbody>
						<tr id="Delivery_24000" name="Delivery_24000" class="selected">
							<td><input type="radio" class="chk" id="Delivery" name="Delivery" value="24000" onclick="fnChange()"><label for="Delivery_24000" onclick="fnSetDelivery('24000')">현장수령</label></td>
						</tr>
						<tr id="Delivery_24001" name="Delivery_24001" class="">
							<td><input type="radio" class="chk" id="Delivery" name="Delivery" value="24001" onclick="fnChange()"><label for="Delivery_24001" onclick="fnSetDelivery('24001')">배송 (2,800원)</label></td>
						</tr>
						<tr id="Delivery_24004" name="Delivery_24004" style="display:none;" class="">
							<td><input type="radio" class="chk" id="Delivery" name="Delivery" value="24004" onclick="fnChange()"><label for="Delivery_24004" onclick="fnSetDelivery('24004')">특급배송 (0원)</label></td>
						</tr>
						<tr id="Delivery_24012" name="Delivery_24012" style="display:none;" class="">
							<td><input type="radio" class="chk" id="Delivery" name="Delivery" value="24012" onclick="fnChange()"><label for="Delivery_24012" onclick="fnSetDelivery('24012')">홈티켓</label></td>
						</tr>
						<tr id="Delivery_24011" name="Delivery_24011" style="display:none;" class="">
							<td><input type="radio" class="chk" id="Delivery" name="Delivery" value="24011" onclick="fnChange()"><label for="Delivery_24011" onclick="fnSetDelivery('24011')">모바일티켓</label></td>
						</tr>
					</tbody>
				</table>
				<div class="info">
					<div id="DeliveryInfo_24000" class="inner" style="">
						<p class="sel">티켓현장수령은 예매시 부여되는 <em>"예약번호"로 <br>관람일 당일 티켓을 수령하여 입장합니다.</em><img src="//ticketimage.interpark.com/TicketImage/onestop/icon_delivery.gif" alt="현장수령시 유의사항 더보기" class="que" onmouseover="showlayernormalclick('lay_sel1');" onmouseout="showlayernormalclick('lay_sel1');"></p>
					</div>
					<!-- 현장수령 //-->
					<div id="DeliveryInfo_24001" class="inner" style="display:none;">
					
						<p class="sel"><em>예매완료(결제익일) 기준 4~5일 이내에 <br>배송</em>됩니다. (주말/공휴일 제외한 영업일기준)<img src="//ticketimage.interpark.com/TicketImage/onestop/icon_delivery.gif" alt="배송시 유의사항 더보기" onmouseover="showlayernormalclick('lay_sel2');" onmouseout="showlayernormalclick('lay_sel2');"><br>*티켓은 묶음배송이 불가합니다.<br>*배송받으신 티켓 분실 시 입장 불가합니다.</p>
					
					</div>
					<!-- 일반배송 //-->
					<div id="DeliveryInfo_24004" class="inner" style="display:none;">
						<p class="sel"><em>예매완료(결제익일) 후 2일 이내에 배송</em>됩니다.<br>특급배송의 경우 지역 사정상 배송이 불가할 수 <br>있습니다.<img src="//ticketimage.interpark.com/TicketImage/onestop/icon_delivery.gif" alt="특급배송시 유의사항 더보기" onmouseover="showlayernormalclick('lay_sel3');" onmouseout="showlayernormalclick('lay_sel3');"><br>*티켓은 묶음배송이 불가합니다.</p>
					</div>
					<!-- 특급배송 //-->
					<div id="DeliveryInfo_24012" class="inner" style="display:none;">
						<p class="sel"><em>홈티켓을 출력하여 현장입구에 설치된 <br>전용단말기에 체크하고 입장</em>하시면 됩니다.<img src="//ticketimage.interpark.com/TicketImage/onestop/icon_delivery.gif" alt="홈티켓 유의사항 더보기" onmouseover="showlayernormalclick('lay_sel4');" onmouseout="showlayernormalclick('lay_sel4');"></p>
					</div>
					<!-- 홈티켓 //-->
					<div id="DeliveryInfo_24011" class="inner" style="display:none;">	
						<p class="sel"><em>본인의 휴대폰으로 전송받은 모바일티켓을 <br>현장입구에설치된 전용 게이트에 체크하고 <br>입장</em>하시면 됩니다.<img src="//ticketimage.interpark.com/TicketImage/onestop/icon_delivery.gif" alt="모바일티켓 유의사항 더보기" onmouseover="showlayernormalclick('lay_sel5');" onmouseout="showlayernormalclick('lay_sel5');"></p>
					</div>
					<!-- 모바일티켓 //-->
				</div>
			</div><!-- delivery_select //-->
			
			<div id="Gift_All" name="Gift_All" class="premium" style="display:none">
				<h3 class="title"><img src="//ticketimage.interpark.com/TicketImage/onestop/stit_delivery_02.gif" alt="티켓프리미엄서비스"></h3>
				<div class="cont">
					<table>
						<caption>티켓포장서비스 선택</caption>
						<tbody>
							<tr>
								<td><input type="radio" class="chk" name="rdoGift" id="rdoGift" value="I7002" disabled="" onclick="javascript:fnChange();"><label for="">기본포장 (500원)</label></td>
							</tr>
							<tr>
								<td><input type="radio" class="chk" name="rdoGift" id="rdoGift" value="I7007" disabled="" onclick="javascript:fnChange();"><label for="">스페셜포장-아이보리 (1,000원)</label></td>
							</tr>
							<tr>
								<td><input type="radio" class="chk" name="rdoGift" id="rdoGift" value="I7006" disabled="" onclick="javascript:fnChange();"><label for="">스페셜포장-퍼플 (1,000원)</label></td>
							</tr>
							<tr>
								<td><input type="radio" class="chk" name="rdoGift" id="rdoGift" value="I7008" disabled="" onclick="javascript:fnChange();"><label for="">기본포장 (TiKi회원무료)</label></td>
							</tr>
							<tr>
								<td><input type="radio" class="chk" name="rdoGift" id="rdoGift" value="" disabled="" onclick="javascript:fnChange();"><label for="">선택안함</label></td>
							</tr>
						</tbody>
					</table>
				</div>
				<span class="btn"><img src="//ticketimage.interpark.com/TicketImage/onestop/btn_preview.gif" alt="티켓포장 미리보기" onclick="showPop('lay_premium');"></span>
			</div><!-- premium //-->		
		</div><!-- deliveryL //-->

		<div class="deliveryR">
			<div class="scrollY">
				<div class="orderer">
					<h3 class="title"><img src="//ticketimage.interpark.com/TicketImage/onestop/stit_delivery_03.gif" alt="주문자확인"></h3>
					<table>
						<caption>주문자정보 입력</caption>
						<colgroup><col width="80px"><col width="*"></colgroup>
						<tbody>
							<tr class="fir">
								<th><label for="MemberName">이름</label></th>
								
								<td>김지수<input type="hidden" id="MemberName" value="김지수"></td>
							
							</tr>
							
							<tr>
								<th><label for="SSN1">생년월일</label></th>
								<td class="form">
									<input id="SSN1" name="SSN1" type="text" style="width:45px;" class="txt1" maxlength="6">  <span style="font-size:11px;">예) 850101 (YYMMDD)</span>
									<input id="SSN2" name="SSN2" type="hidden" value="0000000">
								</td>
							</tr>
							<tr>
								<td colspan="2"><em>현장수령 및 고객문의시 본인확인을 위해 정확한 정보를 입력해주세요.</em></td>
							</tr>							
														
							<tr>
								<th><label for="PhoneNo1">전화번호</label></th>
								<td class="form"><input type="text" id="PhoneNo1" value="02" style="width:36px;" class="txt1" maxlength="3" onkeyup="fnMoveFocus(3, 'PhoneNo1', 'PhoneNo2');">&nbsp;-&nbsp;<input type="text" id="PhoneNo2" value="0000" style="width:41px;" class="txt1" maxlength="4" onkeyup="fnMoveFocus(4, 'PhoneNo2', 'PhoneNo3');">&nbsp;-&nbsp;<input type="text" id="PhoneNo3" value="0000" style="width:41px;" class="txt1" maxlength="4" onkeyup="fnMoveFocus(4, 'PhoneNo3', 'HpNo1');"></td>
							</tr>
							<tr>
								<th><label for="HpNo1">휴대폰</label></th>
								<td class="form"><input type="text" id="HpNo1" value="010" style="width:36px;" class="txt1" maxlength="3" onkeyup="fnMoveFocus(3, 'HpNo1', 'HpNo2');"> - <input type="text" id="HpNo2" value="2343" style="width:41px;" class="txt1" maxlength="4" onkeyup="fnMoveFocus(4, 'HpNo2', 'HpNo3');"> - <input type="text" id="HpNo3" value="5331" style="width:41px;" class="txt1" maxlength="4" onkeyup="fnMoveFocus(4, 'HpNo3', 'Email');"></td>
							</tr>
							<!--<tr>
								<td colspan="2" class="fs">휴대폰 번호로 예매정보를 받으시겠습니까?<span class="select"><input type="radio" class="chk" id="SmsOrNotY" value="Y" checked/><label>예</label><input type="radio" class="chk" id="SmsOrNotN" value="N" disabled/><label>아니오</label></span></td>
							</tr>-->
							<tr>
								<th><label for="Email">이메일</label></th>
								<td class="form"><input type="text" id="Email" value="wltn656@naver.com" style="width:170px;" class="txt1"></td>
								<input type="hidden" id="Zipcode" value="34417">
								<input type="hidden" id="Addr" value="대전광역시 대덕구 비래서로25번길 18">
								<input type="hidden" id="SubAddr" value="1동 302호 (비래동, 영흥빌라)">
							</tr>
							<tr>
								<td colspan="2" class="fs">SMS 문자와 이메일로 예매 정보를 보내드립니다.<span class="select">
								<!--<input type="radio" class="chk" id="EmailOrNotY" value="Y" checked/><label>예</label><input type="radio" class="chk" id="EmailOrNotN" value="N" disabled/><label>아니오</label>--></span></td>
							</tr>							
						</tbody>
					</table>
				</div><!-- orderer //-->
				<div class="deliver" id="DeliveryRow" name="DeliveryRow" style="display:none">
					<h3 class="title"><img src="//ticketimage.interpark.com/TicketImage/onestop/stit_delivery_04.gif" alt="배송자정보"></h3>
					<table>
						<caption>배송자정보 입력</caption>
						<colgroup><col width="80px"><col width="*"></colgroup>
						<tbody>
							<tr class="fir">
								<td colspan="2"><em>배송 받으시는 분의 휴대폰으로 배송정보(등기번호)가 전송되오니<br>정확한 정보를 입력해 주세요.</em></td>
							</tr>
							<tr>
								<th>받으시는 분</th>
								<td><input type="text" id="RName" value="" style="width:50px;" class="txt1"> <input type="checkbox" id="chkSyncAddress" onclick="javascript:fnSyncAddress()">주문자와 동일 <a href="javascript:fnAddress();" title="이전배송지 창열기"><img src="//ticketimage.interpark.com/TicketImage/onestop/btn_delivery_01.gif" alt="이전배송지 선택버튼"></a></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td class="form"><input type="text" id="RPhoneNo1" value="" style="width:36px;" class="txt1" maxlength="3" onkeyup="fnMoveFocus(3, 'RPhoneNo1', 'RPhoneNo2');"> - <input type="text" id="RPhoneNo2" value="" style="width:41px;" class="txt1" maxlength="4" onkeyup="fnMoveFocus(4, 'RPhoneNo2', 'RPhoneNo3');"> - <input type="text" id="RPhoneNo3" value="" style="width:41px;" class="txt1" maxlength="4" onkeyup="fnMoveFocus(4, 'RPhoneNo3', 'RHpNo1');"></td>
							</tr>
							<tr>
								<th>휴대폰</th>
								<td class="form"><input type="text" id="RHpNo1" value="" style="width:36px;" class="txt1" maxlength="3" onkeyup="fnMoveFocus(3, 'RHpNo1', 'RHpNo2');"> - <input type="text" id="RHpNo2" value="" style="width:41px;" class="txt1" maxlength="4" onkeyup="fnMoveFocus(4, 'RHpNo2', 'RHpNo3');"> - <input type="text" id="RHpNo3" value="" style="width:41px;" class="txt1" maxlength="4"></td>
							</tr>
							<tr>
								<th>주소</th>
								<td class="form">
									<p><input type="text" id="RZipcode" value="" style="width:72px;" class="txt1" disabled="">&nbsp;<span id="spanAddrFindDely"><a href="javascript:fnZipcode('N');" title="우편번호 찾기 창열기"><img src="//ticketimage.interpark.com/TicketImage/onestop/btn_post.gif" alt="우편번호 찾기버튼"></a></span>
									</p>
									<p><input type="text" id="RAddr" class="txt" value="" style="width:200px;" readonly=""></p>
									<p><input type="text" id="RSubAddr" class="txt" value="" style="width:200px;"></p>
									
								</td>
							</tr>
						</tbody>
					</table>
				</div><!-- deliver //-->
			</div>
			
		</div><!-- deliveryR //-->

		<div class="layerWrap" id="lay_sel1" style="display:none;">
			<div class="delivery_layer">
				<h4 class="title1">티켓 현장수령시 유의사항</h4>
				<div class="cont"><em>티켓현장수령은 예매시 부여되는<br> "예약번호(티켓번호)"로 당일 티켓을 수령,<br>입장하는 것입니다. </em><br>1시간 전 현장에 도착하셔서 티켓을 수령하시면 이용에 불편함이 없으십니다. <br>티켓 수령 시 예매확인서(또는 예약번호)와 <br>신분증을 지참하셔야 합니다. </div>
			</div>
		</div><!-- 현장수령 레이어 //-->

		<div class="layerWrap" id="lay_sel2" style="display:none;">
			<div class="delivery_layer">
				<h4 class="title1">배송 유의사항</h4>
				<div class="cont">
					<em>예매완료(결제익일) 기준 4~5일 이내에 배송</em>됩니다.<br>(주말/공휴일 제외한 영업일기준)
					<p class="pt"><strong>배송료 2,800원</strong></p>
					결제 시 공연일 12일 전 예매분에 한해 배송<br>선택이 가능합니다.  <span class="ul">티켓 배송이 시작된 이후에 취소시<br>에는 배송료가 환불되지 않습니다. </span><br>금주 주말 (토/일)공연 취소를 원할 경우 내사수령 바랍니다. <br>우편으로 보낼 시 우체국이 토요일 근무를<br> 안하는 관계로 수취인(인터파크)수령이 불가능하여 취소처리가 되지 않을 수 있습니다.<br>*티켓은 묶음배송이 불가합니다.</div>
			</div>
		</div><!-- 일반배송 (2,000원) //-->

		<div class="layerWrap" id="lay_sel3" style="display:none;">
			<div class="delivery_layer">
				<h4 class="title1">특급배송 유의사항</h4>
				<div class="cont">
					<em>예매완료(결제익일) 후 2일 이내에 배송</em>됩니다.<br>(주말/공휴일 제외한 영업일기준)<br>지역사정상 배송이 불가할 수 있습니다.<br>전국 33개 주요 도시 특급우편 가능)
					<p class="pt"><strong>배송료 0원</strong></p>
					결제 시 공연일 0일 전 예매분에 한해 특급배송<br>선택이 가능합니다. <span class="ul">티켓 배송이 시작된 이후에 <br>취소시에는 배송료가 환불되지 않습니다.</span><br>*티켓은 묶음배송이 불가합니다.
				</div>
			</div>
		</div><!-- 특급배송 (3,000원) //-->

		<div class="layerWrap" id="lay_sel4" style="display:none;">
			<div class="delivery_layer">
				<h4 class="title1">홈티켓 유의사항</h4>
				<div class="cont">
					<em>홈티켓을 출력하여  현장입구에 설치된 <br>전용단말기에  체크하고 입장</em>하시면 됩니다.<br><span id="HomeTicketNotice"></span>
					<p class="pt"><strong>홈티켓 사용방법</strong></p>
					<ul class="num">
						<li class="num1">배송방법을 홈티켓으로 선택한다. </li>
						<li class="num2">예매완료 후 홈티켓을 출력한다. </li>
						<li class="num3">현장에서 전용단말기에 서 체크 후 입장한다. </li>
					</ul>
				</div>
			</div>
		</div><!-- 홈티켓 //-->

		<div class="layerWrap" id="lay_sel5" style="display:none;">
			<div class="delivery_layer">
				<h4 class="title1">모바일티켓 유의사항</h4>
				<div class="cont">
					<em>본인의 휴대폰으로 전송받은 모바일티켓을<br>현장입구에 설치된 전용 게이트에 체크하고<br>입장</em>하시면 됩니다.<br>모바일티켓 서비스는 고객님의 휴대폰<br>무선인터넷 사용료가 부과됩니다.  
					<p class="pt"><strong>모바일티켓 사용방법</strong></p>
					<ul class="num">
						<li class="num1">배송방법을 모바일티켓으로 선택한다.  </li>
						<li class="num2">예매완료 후 모바일 티켓 받기!</li>
						<li class="num3">현장에서 전용단말기에 서 체크 후 입장한다. </li>
					</ul>
				</div>
			</div>
		</div><!-- 모바일티켓 //-->

		<div class="layerWrap" id="lay_premium" style="display:none;">
			<div class="premium_layer">
				<h4 class="title1">포장미리보기</h4>
				<div class="cont">
					<div class=""><img src="//ticketimage.interpark.com/TicketImage/onestop/@wrap.gif" alt="티켓포장 미리보기 이미지"></div>
				</div>
				<div class="btn"><img src="//ticketimage.interpark.com/TicketImage/onestop/btn_lay_close.gif" alt="티켓포장 미리보기 닫기" onclick="closePop('lay_premium');"></div>
			</div>
		</div><!-- 포장 미리보기 레이어 //-->
	</div>
</form>


</body></html>