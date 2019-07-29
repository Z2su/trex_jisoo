<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="CR_AppList" value="${dataMap.CR_AppList }" />
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/Coronation.css"
   type="text/css" media="all">
<div id="contentswrap">

			<!-- subvisual -->
			<div id="subvisual">
								<div class="subv_performance">
					<div class="subv_pat">
						<p>
							<strong><img src="/resources/images/ma_service_type.png" alt="Daejeon Arts Center"></strong>
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
      <%@ include file="/WEB-INF/views/board/Coronation/submenu.jsp"%>


				<!-- content-->
				<div id="content">
					<!-- 컨텐츠 타이틀 -->
					<h3 class="cnt_ti">상세 보기</h3>
					
	<table class="board_view">
		<colgroup>
			<col width="25%"/>
			<col width="25%"/>
			<col width="25%"/>
			<col width="25%"/>
			<col width="25%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">게시글 번호</th>
				<td>${CRAppBoard.cr_app_num }</td>
				<th scope="row">시설 번호</th>
				<td>${CRAppBoard.hall_code }</td>
			</tr>
			<tr>
				<th scope="row">공연 등록 코드</th>
				<td>${CRAppBoard.pf_app_code }</td>
				<th scope="row">공연 일정</th>
				<td>${CRAppBoard.startdate } ~ ${CRAppBoard.enddate }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${CRAppBoard.writer }</td>
				<th scope="row">작성시간</th>
				<td><fmt:formatDate value="${CRAppBoard.regdate }" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${CRAppBoard.title }</td>
			</tr>
			<tr>
				<td colspan="4">${CRAppBoard.cont }</td>
			</tr>
		</tbody>
	</table>
	
	
	 <!-- 게시판 버튼모음 -->
           <div class="board_butt">
           <c:if test="${fn:substring(loginUser.mem_code,0,2) eq 'EP' }" >	
 	 		 
 				<c:if test="${CRAppBoard.enable eq 1 }">
 	 			<button id ="confirmbtn" type="button" class="btn btn-sm btn-white btn-bold"
             onclick='confirm_go()'>
				<i class="red ace-icon fa fa-pencil bigger-120"></i><b>승인</b>
			</button>
 	 		 </c:if>
           	<button type="button" class="btn btn-sm btn-white btn-bold"
				onclick="location.href='/board/Coronation/app/delete/${CRAppBoard.cr_app_code }'">
				<i class="grey ace-icon fa fa-times bigger-120"></i><b>삭제</b>
			</button>         
             
			</c:if> 
			
					
			<button type="button" class="btn btn-sm btn-white btn-bold"
				onclick="history.go(-1);">
				<i class="grey ace-icon fa fa-times bigger-120"></i><b>목록</b>
			</button>            
           </div>
	
	
	<script>
	
	function confirm_go(){
		
		if(confirm('승인 하시겠습니까?')){
			alert('승인 완료 되었습니다');

	$('#confirmbtn').hide(); 

			location.href='/board/Coronation/app/conform/${CRAppBoard.cr_app_code }';
			
		};
		
	}
	
	
 	function remove_go(){
		var cr_app_num;
		cr_app_num = ${CRAppBoard.cr_app_num};
		location.href="delete?cr_app_num=${CRAppBoard.cr_app_num}";
	}
	</script>
					
					
				
				
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
	<!--quick  -->
	<%@ include file="/WEB-INF/views/board/commons/quick.jsp" %>
	
		</div>
		<!-- //container -->
	</div>