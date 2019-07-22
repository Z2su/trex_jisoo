<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<link rel="icon" type="image/png" href="/somewhere/myicon.png" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/common.css"
   type="text/css" media="all">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/layout.css"
   type="text/css" media="all">
   


<script
   src="<%=request.getContextPath()%>/resources/js/jquery-1.11.3.min.js"
   type="text/javascript"></script>
<script
   src="<%=request.getContextPath()%>/resources/js/jquery.easing.1.3.js"
   type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/kr/main_2015.js"
   type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/kr/content.js"
   type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/kr/calendar.js"
   type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/javascript.js"
   type="text/javascript"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/resources/js/ajax/facebox/facebox.js"></script>
<link type="text/css"
   href="<%=request.getContextPath()%>/resources/js/ajax/facebox/facebox.css"
   rel="stylesheet" media="all">
<script type="text/javascript"
   src="<%=request.getContextPath()%>/resources/js/ajax/lazyload/jquery.lazyload.mini.js"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/resources/js/ajax/prevImg/humanmsg.js"></script>
<link type="text/css"
   href="<%=request.getContextPath()%>/resources/js/ajax/prevImg/humanmsg.css"
   rel="stylesheet" media="all">
   
  
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/jquery-ui-1.12.1/jquery-ui.min.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="<%=request.getContextPath()%>/resources/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>

<script src="<%=request.getContextPath()%>/resources/js/jquery-ui-1.12.1/datepicker-ko.js"></script>

 
<title>T-REX</title>
</head>
<body>
   <div id="headerWarp">
      <div id="header">
         <!-- 로고-->
         <h1 id="logo">
            <a href="/"><img
               src="<%=request.getContextPath()%>/resources/images/t-rex-logo2.jpg"
               border="0" alt="티렉스티렉스 공룡짱 티렉스"></a>
         </h1>
         <!-- 로고-->
         <!-- 글로벌메뉴-->
         <ul id="global">
            <li><a href="<%=request.getContextPath()%>/">HOME</a></li>
            
            <c:if test="${loginUser eq null }">
            <li><a href="/login">로그인</a></li>
            <li><a href="/join">회원가입</a></li>
            </c:if>
            <c:if test="${loginUser ne null }">
            <li><a href="/logout">로그아웃</a></li>
            <li><a href="#">마이페이지</a></li>
            <li><a href="#">${loginUser.mem_id } 님 </a>
            
            </c:if>
            
            <li><a href="#" target="_blank" title="대전예술의전당 영문 홈페이지(새창)">?</a></li>
         </ul>
         <!-- 글로벌메뉴-->
         <!-- 공연검색-->
         <div class="find">
            <form name="s_form" method="get" action="#공연안내" class="top_find">
               <input type="hidden" name="skey" value="subject"> <input
                  type="hidden" name="mode" value="S">
               <fieldset style="margin: 0; padding: 0; list-style: none;">
                  <legend>공연검색</legend>

                  <input type="text" id="topsearch" name="sval" class="findTxt"
                     value="검색어를 입력해 주세요"><input type="image" id="searchBtn"
                     src="<%=request.getContextPath()%>/resources/images/findButt.gif"
                     alt="search" class="findButt">
               </fieldset>
            </form>
         </div>
         <!-- 공연검색-->
      </div>

      <!-- 탑메뉴-->
      <div id="menu" style="z-index: 1;">
         <div id="animate" style="height: 50px;">
            <h2 class="blind">주메뉴영역</h2>
            <div class="tmbg">
               <ul id="tm">

                  <li><a href="<%=request.getContextPath() %>/board/perform/list"
                     class="">공연안내<span class="arrow" style="display: none;"></span></a>
                  <div id="tms">
                        <ul class="">
                           <li><a href="/board/perform/list"
                              class="">공연안내</a></li>
                           <li><a href="#"
                              class="">공연예매안내</a></li>
                          <!--  <li><a href="#"
                              class="">기타공연소식</a></li>
                           <li><a
                              href="#"
                              class="">공연정보신청</a></li> -->
                        </ul>
                     </div></li>
                  <li><a
                     href="<%=request.getContextPath() %>/board/Coronation/list"
                     class="">대관안내<span class="arrow" style="display: none;"></span></a>
                  <div id="tms">
                        <ul class="">
                           <li><a
                              href="#"
                              class="">정기/수시대관 공고</a></li>
                           <li><a href="#" class="">공연장대관</a></li>
                           <li><a href="#" class="">컨벤션홀대관</a></li>
                        </ul>
                     </div>
                     </li>
                  <li><a href="<%=request.getContextPath()%>/board/pr/prlist" class="">홍보게시판 <span class="arrow" style="display: none;"></span></a>
                  <div id="tms">
                        <ul class="">
                           <li><a href="<%=request.getContextPath()%>/board/pr/prlist"
                              class="">홍보게시판</a></li>
                           <li><a href="<%=request.getContextPath()%>/board/ad/adlist"
                              class="">광고게시판</a></li>
                           <li><a
                              href="<%=request.getContextPath()%>/board/event/list"
                              class="">이벤트</a></li>
                        </ul>
                     </div>
                     </li>
                     
	
			
			
                     <li><a href="<%=request.getContextPath() %>/board/center/main"
                     class="">고객센터<span class="arrow" style="display: none;"></span></a>
                  <div id="tms">
                        <ul class="">
                           <li><a href="<%=request.getContextPath() %>/board/center/notice/list"
                              class="">공지사항</a></li>
                           <li><a href="<%=request.getContextPath() %>/board/center/faq/list"
                              class="">FAQ</a></li>
                           <li><a
                              href="<%=request.getContextPath() %>/board/center/qna/list"
                              class="">Q&A</a></li>
                           <li><a
                              href="<%=request.getContextPath() %>/board/center/event/list"
                              class="">이벤트</a></li>
                        </ul>
                     </div>
                     </li>
                     	
			<c:if test="${fn:substring(loginUser.mem_code,0,2) ne 'EP' }" >
					
					<c:if test="${loginUser eq null  }">
					 <li><a href="#" class="">마이페이지<span
                        class="arrow" style="display: none;"></span></a>
                  <div id="tms">로그인 후 이용 가능합니다</div></li>
                  		
                  	</c:if>
                  	
                   <c:if test="${fn:substring(loginUser.mem_code,0,2) eq 'GM' }" >
                   
                  <li><a href="<%=request.getContextPath() %>/mypage/MypageMemberList" class="">마이페이지<span
                        class="arrow" style="display: none;"></span></a>
                  <div id="tms">
                  	
                 
                  
                        <ul class="" >
                           <li><a href="<%=request.getContextPath() %>/mypage/MypageMemberList" class="">회원정보조회</a></li>
                           <li><a href="<%=request.getContextPath() %>/mypage/MypageMemberRescHis" class="">예매확인 및 취소</a></li>
                           <li><a href="<%=request.getContextPath() %>/mypage/MypageMemberMile" class="">마일리지조회</a></li>
                           <li><a href="<%=request.getContextPath() %>/mypage/MypageMemberBoardList" class="">게시글조회</a></li>
                           <li><a href="<%=request.getContextPath() %>/mypage/MypageMemberSec" class="">회원탈퇴</a></li>
                        </ul>
                        </div>
                        </li>
                  </c:if>
                  <c:if test="${fn:substring(loginUser.mem_code,0,2) eq 'TR' }" >
                    
                  <li><a href="<%=request.getContextPath() %>/mypage/MypageTroupeList" class="">마이페이지<span
                        class="arrow" style="display: none;"></span></a>
                  <div id="tms">
                  
                        <ul class="" >
                           <li><a href="<%=request.getContextPath() %>/mypage/MypageTroupeList" class="">공연단정보조회</a></li>
                           <li><a href="<%=request.getContextPath() %>/mypage/MypageTroupeCrAppList" class="">대관신청조회</a></li>
                           <li><a href="<%=request.getContextPath() %>/mypage/MypageTroupeAdList" class="">광고신청조회</a></li>
                           <li><a href="<%=request.getContextPath() %>/mypage/MypageTroupeSec" class="">회원탈퇴</a></li>
                        </ul>
                     </div></li>
                     
                        </c:if>
                     
                </c:if>
				
                <c:if test="${fn:substring(loginUser.mem_code,0,2) eq 'EP' }" >
                
                  <li><a href="<%=request.getContextPath() %>/manager/myinfo" class="">관리자페이지<span
                        class="arrow" style="display: none;"></span></a>
                  <div id="tms">
                        <ul class="">
                           <li><a href="<%=request.getContextPath() %>/manager/myinfo" class="">마이페이지</a></li>
                           <li><a href="<%=request.getContextPath() %>/manager/eplist" class="">직원관리</a></li>
                           <li><a href="<%=request.getContextPath() %>/manager/memlist" class="">회원조회</a></li>
                           <li><a href="<%=request.getContextPath() %>/manager/calender" class="">일정관리</a></li>
                        </ul>
                     </div></li>
                     
                     </c:if>
                  <li class="tmect"><a href="#" target="_blank"
                     title="빠른예매 새창열기" class="">빠른예매<span class="arrow"
                        style="display: none;"></span></a> <a
                     href="#" class="mmore" title="사이트맵"><span
                        class="hide">사이트맵</span><span class="arrow"
                        style="display: none;"></span></a>
                     <div id="tms">
                        대전예술의전당<br> 아카데미교육사업 <a href="#" target="_blank"
                           title="빠른예매 새창열기">빠른예매</a>
                     </div></li>
               </ul>
            </div>
         </div>

      </div>
      <!-- 탑메뉴-->
      <script type="text/javascript">
         $(document).ready(function() {
            var param = "#menu";
            var btn = "#tm>li>a";
            var obj = "#tms";
            var index = 99;
            var wraper = "#animate";
            topmenu(param, btn, obj, index, wraper);
         });
      </script>
   </div>




