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
					<strong></strong> 문화로 시민을 행복하게! 대전예술의전당
				</p>
			</div>
		</div>
	</div>
	<!-- //subvisual -->

	<!-- navigation -->
	<div id="navigation">
		<div class="naviwrap">
			<a href="<%=request.getContextPath()%>/">HOME</a>&gt;
				<navi> 
					<a href="<%=request.getContextPath()%>/board/center/notice/list">공지사항</a>
				</navi>
			<div class="nv_service">
				<a class="nvs_print" href="#total"
					onclick="printContent('/html/kr/performance/performance_010101.html?mode=V&amp;code=2946');return false"><span
					class="hide">Print</span></a>

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
			<h3 class="cnt_ti">공지사항</h3>

			<div id="txt">
				<div id="topBox_top"></div>
				<div id="topBox">
					<span class="icon"><img src="<%=request.getContextPath()%>/resources/images/icon_01.gif"
						alt=""></span>
					
				</div>
				<div id="topBox_foot"></div>
				<!-- 기본 정보 -->
				<div class="board_viewTit">
					<h4>
						<span>제 목</span>${notice.title }
					</h4>
				</div>
				<ul class="board_viewInfo">

					<li class="writer"><span>작성자</span>${notice.writer }</li>

					<li class="date"><span>작성일</span><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${notice.regdate}" /></li>

					<li class="visit"><span>조회수</span>${notice.viewcnt } </li>
				</ul>

				<!-- 내용이 입력되는 부분 -->
				<h5 class="board_viewHtit">내용보기 </h5>
				<div class="board_viewDetail">
					${notice.cont }<br>
				</div>

				<!-- 게시판 버튼모음 -->
				<div class="board_list_butt">
					<a href="delete?notice_num=${notice.notice_num }">
						<img src="<%=request.getContextPath()%>/resources/images/delete.gif" alt="삭제">
				    </a> 
					
					<a href="list">
						<img src="<%=request.getContextPath()%>/resources/images/list.gif" alt="목록">
				    </a>
					
					<a href="modify?notice_num=${notice.notice_num }">
						<img src="<%=request.getContextPath()%>/resources/images/modify.gif" alt="수정">
					</a>
					
					<a href="regist">
						<img src="<%=request.getContextPath()%>/resources/images/write.gif" alt="쓰기">
					</a>
				</div>

				<!-- 게시글 이동  -->

				<!-- 이전글, 다음글 -->

				<!-- 목록 리스트 화면 -->
			</div>
		</div>
	</div>
	<!-- //container -->
</div>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/board.css"
	type="text/css" media="all">