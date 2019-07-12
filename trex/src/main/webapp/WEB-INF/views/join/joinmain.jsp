<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="contentswrap">

			<!-- subvisual -->
			<div id="subvisual">
								<div class="subv_performance">
					<div class="subv_pat">
						<p>
							<strong><img src="/images/kr/common_2015/ma_service_type.png" alt="Daejeon Arts Center"></strong>
							문화로 시민을 행복하게! 대전예술의전당
						</p>
					</div>
				</div>
							</div>
			<!-- //subvisual -->

			<!-- navigation -->
			<div id="navigation">
				<div class="naviwrap">
				 	<a href="/html/kr/" class="nv_home">HOME</a>&gt;<navi><a href="/html/kr/performance/performance_010101.html">공연안내</a>&gt;<a href="/html/kr/performance/performance_010101.html">공연안내</a>&gt;<a href="/html/kr/performance/performance_010101.html" class="navi_ov">공연정보</a></navi>				 	<div class="nv_service">
												<a class="nvs_print" href="#total" onclick="printContent('/html/kr/performance/performance_010101.html?mode=V&amp;code=2946');return false"><span class="hide">Print</span></a>
												<a href="#" onclick="twitterOpen('http://www.djac.or.kr/html/kr/performance/performance_010101.html?mode=V&amp;code=2946', '대전예술의전당 | 공연정보'); return false;" class="nvs_twt twitter" target="_blank" title="대전예술의전당 트위터(새창)"><span class="hide">트위터</span></a>
						<a href="#" onclick="facebookOpen('http://www.djac.or.kr/html/kr/performance/performance_010101.html?mode=V&amp;code=2946'); return false;" class="nvs_face facebook" target="_blank" title="대전예술의전당 페이스북(새창)"><span class="hide">페이스북</span></a>

					</div>
				</div>
			</div>
			<!-- //navigation -->

			<!-- container -->
			<div id="container">
<%-- 				<%@ include file="/WEB-INF/views/board/commons/submenu.jsp" %>
 --%>

				<!-- content-->
				<div id="content">
					<!-- 컨텐츠 타이틀 -->
					<!-- <h3 class="cnt_ti">detail</h3> -->
					
			<!-- 	
				///////////////////////////////////
				//                               //
				//                               //
				//            내용채우기                            //
				//                               //
				//                               //
				//                               //
				//                               //
				//                               //
				/////////////////////////////////// -->
			</div>
	
	
		</div>
		<!-- //container -->
	</div>
	<div id="container">
				<!-- leftmenu-->
				<div id="wrap">
					<h2 id="leftTi">홈페이지가이드</h2>

					<!--LEFTMENU START-->

		<script type="text/javascript"> 
		<!--         
		var old_menu = '';
		var old_cell = '';
		var old_Lmenu = '';

		function menuclick(submenu)
		{		
			if( old_menu != submenu ) {
				if( old_menu !='' ) {
				  old_menu = 'none';				  
				}
				jQuery(".lm_2th > li > div").hide();
				if( old_menu !='' ) {
					jQuery("#"+old_Lmenu).parent().find(">a").removeClass("link_2th_ov").addClass("link_2th");					
				}
				jQuery("#"+submenu).parent().find(">a").removeClass("link_2th").addClass("link_2th_ov");
			
				document.getElementById(submenu).style.display = 'block';
				old_menu = document.getElementById(submenu).style.display;
				old_Lmenu = submenu;				
			} 
			else 
			{
				document.getElementById(submenu).style.display = 'none';
				old_menu = '';			
			}				
		}
		//-->
		</script>
		

					<!-- 컨텐츠 타이틀 -->
					<h3 class="cnt_ti">회원가입</h3>
					<!-- 컨텐츠 타이틀 -->
		 


	<p>회원가입은<br><span class="bold point">일반회원과 공연단회원으로 선택하여 가입할</span> 수 있습니다.</p>
	</div>
	<div id="topBox_foot"></div>
	<h4 class="top_mar_50" >회원가입</h4>
	<div class="freebiemember">
		<ul class="h5_ul">
			<li>회원가입은 일반회원과 공연단회원으로  가입가능합니다 </li>
			<li>다양한 이벤트 참여기회가 부여됩니다. </li>
			<li>공연, 아카데미, 이벤트 등 다양한 정보에 대한 메일서비스를 받을 수 있습니다. </li>
			<li>예당 홈페이지, 전화예매(1544-1556)시 예매 수수료 면제. </li>
			
		</ul>
		<strong class="left_mar_40"><a href="joingmem">일반회원</a></strong>
		<strong class="left_mar_40"><a href="jointro">공연단회원</a></strong>
		<div class="clear"></div>
	</div>
	




</div>
			</div>
			


<script type="text/javascript">
// slide menu  2006-06-14
var isDOM = (document.getElementById ? true : false);
var isIE4 = ((document.all && !isDOM) ? true : false);
var isNS4 = (document.layers ? true : false);
var isNS = navigator.appName == "Netscape";


function getRef(id) {
    if (isDOM) return document.getElementById(id);
    if (isIE4) return document.all[id];
    if (isNS4) return document.layers[id];
}

function getSty(id) {
    x = getRef(id);
    return (isNS4 ? getRef(id) : getRef(id).style);
}

function moveRightEdge() {
    var yMenuFrom, yMenuTo, yOffset, timeoutNextCheck;

    if (isNS4) {
        yMenuFrom   = document.getElementById('divMenu').style.top;
        yMenuTo     = windows.pageYOffset + slidemenu_X;   // 위쪽 위치
    } else if (isDOM) {
        yMenuFrom   = parseInt (document.getElementById('divMenu').style.top, 10);
        yMenuTo     = (isNS ? window.pageYOffset : document.documentElement.scrollTop) + slidemenu_X; // 위쪽 위치
    }
    timeoutNextCheck = 30;
    
    divMenu_H = document.getElementById('divMenu');
    limit_H = (parseInt(document.documentElement.scrollHeight)-slidemenu_Y)-parseInt(divMenu_H.offsetHeight);
    divMenu_t = parseInt(document.getElementById('divMenu').style.top) ;
    if (yMenuFrom != yMenuTo) {
        yOffset = Math.ceil(Math.abs(yMenuTo - yMenuFrom) / 20);
        if (yMenuTo < yMenuFrom){
            yOffset = -yOffset;
        }
        if (isNS4){
            if(yOffset > 0){
                if ( divMenu_t < limit_H) {
                    document.getElementById('divMenu').style.top += yOffset+"px";
                }
            }else{
                document.getElementById('divMenu').style.top += yOffset+"px";
            }
            
        }else if (isDOM){
            if(yOffset > 0){
                if ( divMenu_t < limit_H) {
                    document.getElementById('divMenu').style.top = parseInt (document.getElementById('divMenu').style.top) + yOffset+"px";
                }
            }else{
                document.getElementById('divMenu').style.top = parseInt (document.getElementById('divMenu').style.top) + yOffset+"px";
            }
        }
        timeoutNextCheck = 10;
    }

    setTimeout ("moveRightEdge()", timeoutNextCheck);
}


if (isNS4) {    
    var divMenu = document["divMenu"];
    document.getElementById('divMenu').style.top = slidemenu_X+"px";
    document.getElementById('divMenu').style.visibility = "visible";
    moveRightEdge();
} else if (isDOM) {
    var divMenu = getRef('divMenu');    
    document.getElementById('divMenu').style.top = slidemenu_X+"px";    
    document.getElementById('divMenu').style.visibility = "visible";    
    moveRightEdge();
}
</script>		

	</div>
</body>
</html>