//인터파크 원스탑예매 (아카데미.문화예술)
function INTER_OpenSeat(strGroupCD,SessionBizCode,memberid,ssn)
{	
	//2011.11.4 lee.sang.su
	//var strURL = "http://ticket.interpark.com/othersite.2.0/djart/booking/bookingSession.asp?GroupCode="+strGroupCD+"&SessionBizCode="+SessionBizCode+"&memberid="+memberid;
	
	//2012.06.19 lee.sang.su 신규원스탑 변경으로 인한 변경 
	//var strURL = "http://ticket.interpark.com/othersite.2.0/gate/SiteBookingGate.asp?GroupCode="+strGroupCD+"&SessionBiz="+SessionBizCode+"&Member="+memberid;
	
	var SessionBizCode = "08920";
	var strURL = "http://ticket.djac.or.kr/djac/BookingGate.asp?GroupCode="+strGroupCD+"&SessionBiz="+SessionBizCode+"&Member="+memberid;

	if(	strGroupCD && memberid ) {

		window.open(strURL, "", "width=900, height=680");

	}else{
		alert("로그인 후 이용해주세요.");
		exit;
	}
}


//확인창 스크립트 - 특정 문구를 사용할 경우에는 msg 에 값 입력, '삭제하시겠습니까?' 기본값
function ConfirmMsg(msg){
	if(msg) var chk = confirm(msg);
	else var chk = confirm("처리하시겠습니까?");

	if(chk) return true;
	else return false;
}

//이메일 함수 변경 추가 - FormBoxClass 의 email 셋팅과 연동
function domainChange(obj){
	var input = jQuery("#emal_domain");
	var email_domain = obj.value;
	
	if(!email_domain) {
		input.val('');
		input.attr("readonly",false);
		input.focus();
	}
	else {
		input.val(email_domain);
		input.attr("readonly",true);
	}
}

//자바스크립트 trim
String.prototype.trim = function() {
    return this.replace(/(^\s*)|(\s*$)/gi, "");
}

//입력폼 필수처리
function disableForm(form, obj){
	var arr = form.split(',');
	var cnt = arr.length;
	
	if(!document.getElementById(arr[0]).disabled) {
		for(i=0;i<cnt;i++){
			document.getElementById(arr[i].trim()).disabled = true;
		}
		jQuery(obj).find('span').html('사용함');
	}
	else {
		for(i=0;i<cnt;i++){
			document.getElementById(arr[i].trim()).disabled = false;
		}
		jQuery(obj).find('span').html('사용안함');
	}
}


//입력 폼 한번만 넘어가도록 처리
/*
jQuery(function(){
	jQuery("form").submit(function(){
		//alert(jQuery(this)[0])
		return frmChk(jQuery(this)[0]);
		jQuery(this).find("input[type='image']").attr("disabled",true);
	})
})
*/


//이미지 보기 프로세스
function viewImgProcess(obj){
	var file_nm = obj.href;
	var viewImg = "<div style='position:absolute;top:50%;left:50%;border:3px solid #9f9f9f;background:white;color:#afafaf;text-align:center;' id='viewImg'><img src="+file_nm+" /><br />※2초뒤에  사라집니다.</div>";
	jQuery(obj).parent().append(viewImg).find("#viewImg").delay("2000").fadeOut(500);
}

//이미지 삭제 프로세스
function imgDelProcess($key){
	
}

//새창 뛰우기 
function openwin1(code,linkurl,width,height,scroll)
{		
	/*** 팝업 창 화면 중앙에 오픈시키기**/
	
	if ( getCookie(code) != "done" )	{
	    var str;
	    
	    str = "height=" + height + ",innerHeight=" + height;
	    str += ",width=" + width + ",innerWidth=" + width;
	    if(scroll==1) str += ",scrollbars=yes";
	
	    if (window.screen) {
	        var ah = screen.availHeight - 30;
	        var aw = screen.availWidth - 10;
	        var xc = (aw - width) / 2;
	        var yc = (ah - height) / 2;
	
	        str += ",left=" + xc + ",screenX=" + xc;
	        str += ",top=" + yc + ",screenY=" + yc;

	    }
		//팝업이 없을시 아래 2줄 앞부분을 "//"으로 가려줌
	    noticeWindow = window.open(linkurl, code , str);
	    //noticeWindow.opener = self;
	    noticeWindow.focus();
	}
}

//페이지 인쇄
function printContent(getUrl) 
{
	window.open("/_module/print/printContent.php?link_url="+getUrl,"print","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=640,height=700");
}

//예매내역 확인 인쇄
function printContent_ticket() 
{
	var interSrc = $("iframe#interfrm").attr('src');
	interSrc = encodeURIComponent(interSrc);
	window.open("/_module/print/printContent_ticket.php?link_url="+interSrc,"print","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=640,height=700");
	
}

//페스티발페이지 인쇄
function printContent2(getUrl) 
{
	window.open("/_module/print/printContent2.php?link_url="+getUrl,"print","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=640,height=700");
}


//아카데미페이지 인쇄
function printContent3(getUrl, site_dvs_cd) 
{
	window.open("/_module/print/printContent3.php?link_url="+getUrl,"print","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=640,height=700");
}



function SearchKeyword(obj){
	//https://search.i815.or.kr/Search/TotalSearch.jsp?sT=3&tid=&v_allword=%EC%95%88%ED%9D%AC%EC%A0%9C
	var skeyword;
	skeyword  = encodeURI(obj);
	window.open("https://search.i815.or.kr/Search/TotalSearch.jsp?sT=3&tid=&v_allword="+skeyword,"print","left=200,top=50,scrollbars=yes,toolbar=no,resizable=yes");
}


function ContView(obj){
	//http://new.i815.or.kr/media_data/magazine/2010/07/201007/EBook.htm?page=5
	var skeyword;
	skeyword  = encodeURI(obj);
	window.open("/media_data/magazine/"+skeyword,"print","left=200,top=50,scrollbars=yes,toolbar=no,resizable=yes");
}

function _ContView(obj){
	//http://new.i815.or.kr/media_data/magazine/2010/07/201007/EBook.htm?page=5
	var skeyword;
	skeyword  = encodeURI(obj);
	window.open("/media_data/thesis/"+skeyword,"print","left=200,top=50,scrollbars=yes,toolbar=no,resizable=yes");
}


////다른 자바스크립트 파일 인클루드 시키기
//var jsload = function(src){
//	var src = src;
//	return{
//		insSrc:function(src){
//			var script = document.createElement('script'); 
//			script.type = 'text/javascript'; 
//			script.src = src;
//			document.getElementsByTagName('head')[0].appendChild(script);
//		},
//		insCss:function(src){
//			var css = document.createElement('link'); 
//			css.type = 'text/css'; 
//			css.href = src;
//			css.rel = 'stylesheet';
//			css.media = 'all';
//			document.getElementsByTagName('head')[0].appendChild(css);
//		}
//	}
//};
//
////jsload.insSrc('/js/jquery.js');//jQuery load
//
////jquery lightbox 관련 파일
////jsload.insSrc('/js/ajax/lightbox/js/jquery.lightbox.js');//js load
////jsload.insCss('/js/ajax/lightbox/css/jquery.lightbox.css');//css load
//
////jquery facebox 관련 파일
//jsload.insSrc('<%=request.getContextPath()%>/resources/js/ajax/facebox/facebox.js');//js load
//jsload.insCss('<%=request.getContextPath()%>/resources/js/ajax/facebox/facebox.css');//css load
//
////웹접근성 체크
////jsload.insSrc('/js/webinspector.js');//js load
//
////팝업창 체크
////jsload.insSrc('/js/ajax/popChk/popChk.js');//js load
//
////이미지 천천히 로딩
//jsload.insSrc('/js/ajax/lazyload/jquery.lazyload.mini.js');//js load
//
////첨부이미지 미리보기
//jsload.insSrc('/js/ajax/prevImg/humanmsg.js');//js load
//jsload.insCss('/js/ajax/prevImg/humanmsg.css');//css load
//
//

var addrUrl = "/_module/newaddr/zipCodeSearch_API.php"; //표준화면경로

function addrPop()
{

	var parray = new Object();
	var returnValue = "";
	
	var style ="dialogWidth:506px;dialogHeight:633px"; // 사이즈등 style을 선언 
	returnValue = window.showModalDialog(addrUrl, parray ,style ); // modal 실행 window.showModalDialog 포인트!! 


	for(var imsi in returnValue) {
		//alert("["+imsi+"]" + returnValue[imsi]);
	}



	if(returnValue)
	{
		//var theForm1 = document.frm1;
		//theForm1.reset();
		
		if(returnValue.AD_POSTNO != ""){
			//document.getElementById("zipcode1").value = returnValue.AD_POSTNO.substr(0,3);
			//document.getElementById("zipcode2").value = returnValue.AD_POSTNO.substr(3,3);
			document.getElementById("zip1").value = returnValue.AD_POSTNO.substr(0,3);
			document.getElementById("zip2").value = returnValue.AD_POSTNO.substr(3,3);
		}
		/*
		if(returnValue.AD_POSTSEQ != "")
			document.getElementById("zipcodeseq").value = returnValue.AD_POSTSEQ;
		
		if(returnValue.AD_JI_BASE != ""){
			document.getElementById("jibunaddress").value = returnValue.AD_JI_BASE;
			if(returnValue.AD_JI_DETAIL != ""){
				document.getElementById("jibunaddress").value = document.getElementById("jibunaddress").value + " " + returnValue.AD_JI_DETAIL;
			}
		}
		if(returnValue.AD_RO_BASE != "")
		{
			document.getElementById("roadaddress").value = returnValue.AD_RO_BASE;
			if(returnValue.AD_RO_DETAIL != ""){
				document.getElementById("roadaddress").value = document.getElementById("roadaddress").value + ", " + returnValue.AD_RO_DETAIL;
				if(returnValue.AD_RO_REF != ""){
					document.getElementById("roadaddress").value = document.getElementById("roadaddress").value + " ( " + returnValue.AD_RO_REF + " )";
				}
			}
		}
		
		
		if(returnValue.AD_JI_BASE != "")
			document.getElementById("jibunaddress1").value = returnValue.AD_JI_BASE;
		if(returnValue.AD_JI_DETAIL != "")
			document.getElementById("jibunaddress2").value = returnValue.AD_JI_DETAIL;
		*/	
/*

			도로명-기본주소	AD_RO_BASE
			도로명-상세주소	AD_RO_DETAIL
			도로명-참고주소	AD_RO_REF

*/
	
		if(returnValue.AD_RO_BASE != "")
			//document.getElementById("roadaddress1").value = returnValue.AD_RO_BASE;
			document.getElementById("addr").value = returnValue.AD_RO_BASE;

		//alert(returnValue.AD_RO_DETAIL);
		//alert(returnValue.AD_RO_REF);
/*
		if(returnValue.AD_RO_DETAIL)
			//document.getElementById("roadaddress2").value = returnValue.AD_RO_DETAIL;
			document.getElementById("dtl_addr").value = "";
			document.getElementById("dtl_addr").value = returnValue.AD_RO_DETAIL+"("+returnValue.AD_RO_REF+")";

		if(returnValue.AD_RO_REF != ""){
			document.getElementById("dtl_addr").value = "";
			document.getElementById("dtl_addr").value = document.getElementById("dtl_addr").value + " ( " + returnValue.AD_RO_REF + " )";
		}

*/

		document.getElementById("dtl_addr").value = "";
		document.getElementById("dtl_addr").value = returnValue.AD_RO_DETAIL + "( " + returnValue.AD_RO_REF + " )";

		/*
		if(returnValue.AD_RO_REF != "")
			document.getElementById("roadaddress3").value = returnValue.AD_RO_REF;
			
		if(returnValue.AD_RO_BUILDMGNO != "")
			document.getElementById("roadbdnum").value = returnValue.AD_RO_BUILDMGNO;

		if(returnValue.AD_RO_PNU != "")
			document.getElementById("roadpnu").value = returnValue.AD_RO_PNU;
			
		var SAN, MN, SN, BDONGCD, BDONGNM, HDONGCD, HDONGNM, ROADCD, DONGSEQ, ROADNM, UNDERCD, BUILDMN, BUILDSN, BUILDNM, POSNO, SECNO;
		if(returnValue.AD_SIDO != "") // 시도명칭
			document.getElementById("sido1").value = returnValue.AD_SIDO;
		
		if(returnValue.AD_GUNGU != "") // 시군구명칭
			document.getElementById("GUNGU1").value = returnValue.AD_GUNGU;
		
		if(returnValue.AD_DONG != "") // 읍면동명칭
			document.getElementById("DONG1").value = returnValue.AD_DONG;
		
		if(returnValue.AD_RI != "") // 리 명칭
			document.getElementById("RI1").value = returnValue.AD_RI;
		
		var SAN = returnValue.AD_SAN;  // 지번산여부
		var MN = returnValue.AD_MN;  // 지번본번
		var SN = returnValue.AD_SN;  // 지번부번
		var BDONGCD = returnValue.AD_BDONGCD;  // 법정동코드
		var BDONGNM = returnValue.AD_BDONGNM;  // 법정동명칭
		var HDONGCD = returnValue.AD_HDONGCD;  // 행정동코드
		var HDONGNM = returnValue.AD_HDONGNM;  // 행정동명칭
		var ROADCD = returnValue.AD_RO_ROADCD;  // 도로명코드
		var DONGSEQ = returnValue.AD_RO_DONGSEQ;  // 읍면동일련번호
		var ROADNM = returnValue.AD_RO_ROADNM;  // 도로명칭
		var UNDERCD = returnValue.AD_RO_UNDERCD;  // 지하여부
		var BUILDMN = returnValue.AD_RO_BUILDMN;  // 건물본번
		var BUILDSN = returnValue.AD_RO_BUILDSN;  // 건물부번
		var BUILDNM = returnValue.AD_RO_BUILDNM;  // 건물명
		var POSNO = returnValue.AD_RO_POSNO;  // 지점번호
		var SECNO = returnValue.AD_RO_SECNO;  // 구획번호
		alert("산:" + SAN + " @ " + "지번본번:" + MN + " @ " + "지번부번:" + SN + " @ " +  "법정동코드:" + BDONGCD + " @ " +  "법정동명칭:" + BDONGNM + " @ " +  "행정동코드:" + HDONGCD + " @ " +  "행정동명칭:" + HDONGNM + " @ " +  "도로명코드:" + ROADCD + " @ " + "읍면동일련번호:" + DONGSEQ + " @ " +  "도로명칭:" + ROADNM + " @ " + "지하여부:" + UNDERCD + " @ " + "건물본번:" + BUILDMN + " @ " + "건물부번:" + BUILDSN + " @ " + "건물명:" + BUILDNM + " @ " +  "지점번호:" + POSNO + " @ " +  "구획번호:" + SECNO );
		*/	
	}
}
