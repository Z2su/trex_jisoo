<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="contentswrap">

	<!-- subvisual -->
	<div id="subvisual">
		<div class="subv_performance">
			<div class="subv_pat">
				<p>
					<strong><img
						src="<%=request.getContextPath()%>/resources/images/ma_service_type.png"
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
			<navi> <a href="/html/kr/performance/performance_010101.html">고객센터</a>&gt;<a
				href="/html/kr/performance/performance_010101.html">FAQ</a></navi>
			<div class="nv_service">
				<a class="nvs_print" href="#total"
					onclick="printContent();return false"><span class="hide">Print</span></a>

			</div>
		</div>
	</div>
	<!-- //navigation -->

	<!-- container -->
	<div id="container">
		<%@ include file="/WEB-INF/views/board/center/submenu.jsp"%>


		<!-- content-->
		<div id="content">
			<!-- 컨텐츠 타이틀 -->
			<h3 class="cnt_ti">FAQ</h3>

			<div id="txt">

				<form name="inputFrm" method="post" action="modify">

					<input type="hidden" name="faq_num" value="${faqboard.faq_num }">
					<input type="hidden" name="faq_code" value="${faqboard.faq_code }">
					<input type="hidden" name="faq_regdate" value="${faqboard.regdate }">


					<ul class="board_writeInfo">

						<!--제목-->
						<li><label for="wrtTitle">제 목</label><input type="text"
							id="wrtTitle" name="title" value="${faqboard.title }"></li>

						<!--작성자 -->
						<li><label for="wrtPers">작성자</label><input type="text"
							id="wrtPers" name="writer" value="${faqboard.writer }"
							readonly=""><span class="tip">* 작성자는 필수입력 사항입니다.</span></li>
						<!--공지 사항 체크-->



						<li><label for="wrtCont">내용입력</label> <textarea id="wrtCont"
								name="cont" rows="20" cols="1">${faqboard.cont }</textarea></li>


					</ul>

					<!-- 게시판 버튼모음 -->
					<div class="board_butt">
						<input type="image" src="<%=request.getContextPath()%>/resources/images/modify.gif" title="수정" alt="수정"> 
						<a href="<%=request.getContextPath()%>/board/center/detail/">
							<img src="<%=request.getContextPath()%>/resources/images/cancel.png" alt="취소">
						</a>
						<a href="/_prog/_board/index.php?code=customer&amp;site_dvs_cd=kr&amp;menu_dvs_cd=040202&amp;skey=&amp;sval=&amp;GotoPage=">
							<img src="<%=request.getContextPath()%>/resources/images/list.gif" alt="목록">
						</a>
					</div>
				</form>
				<!--  웹필터 수정 -->
				<!--  웹필터 수정 -->
			</div>

		</div>
		<!--quick  -->
		<%-- <!-- 	<%@ include file="/WEB-INF/views/board/center/quick.jsp" %> --> --%>

	</div>
	<!-- //container -->
</div>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/board.css"	type="text/css" media="all">