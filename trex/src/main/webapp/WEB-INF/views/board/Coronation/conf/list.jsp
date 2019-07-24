<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="CR_AppList" value="${dataMap.CR_AppList }" />
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/Coronation.css"
   type="text/css" media="all">
  

 
   <div id="contentswrap">

			<!-- subvisual -->
			<div id="subvisual">
								<div class="subv_together">
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
				 	<a href="/html/kr/" class="nv_home">HOME</a>&gt;<navi><a href="/html/kr/together/together_0301.html">대관 안내</a>
												<a class="nvs_print" href="#total" onclick="printContent('/_prog/audition/?site_dvs_cd=kr&amp;menu_dvs_cd=030301');return false"><span class="hide">Print</span></a>

					</div>
				</div>
			</div>
			<!-- //navigation -->

			<!-- container -->
			<div id="container">
				 <%@ include file="/WEB-INF/views/board/Coronation/submenu.jsp"%>

<!-- 탭메뉴 및 좌측메뉴 펼침기능 시작 부분 -->
<script type="text/javascript">menuclick('submenu3');</script>

	
	<!-- 리스트 넣는 곳 -->
	
	<div id="content">
			<!-- 컨텐츠 타이틀 -->
			<h3 class="cnt_ti">대관 신청 리스트</h3>
			
			
			
			<div id="txt">



				<div id="calendar" >
					
				</div>
			</div>			
			
			
			

		

		</div>
	
	<!--  -->
      



			</div>
			
	<%@ include file="./calendar_form.jsp" %>
		<!-- //container -->
	




