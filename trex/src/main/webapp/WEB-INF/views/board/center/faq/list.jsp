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
			<navi> <a href="/html/kr/performance/performance_010101.html">공연안내</a>&gt;<a
				href="/html/kr/performance/performance_010101.html">공연안내</a>&gt;<a
				href="/html/kr/performance/performance_010101.html" class="navi_ov">공연정보</a></navi>
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
	<!-- //navigation -->

	<!-- container -->
	<div id="container">
		<%@ include file="/WEB-INF/views/board/center/submenu.jsp"%>


		<!-- content-->
		<div id="content">
			<!-- 컨텐츠 타이틀 -->
			<h3 class="cnt_ti">FAQ</h3>

			<div id="txt">

				<div id="topBox">
					<span class="icon"><img src="/resources/images/icon_01.gif"
						alt="" /></span>
					<p>
						<span class="box">고객님들께서 자주 문의하시는 질문입니다.</span><br /> <span
							class="bold point">사이트 이용시 자주 문의하시는 질문입니다. </span>여기에서 궁금증이 해결 되지
						않으셨다면 참여마당 고객의 소리에 글을 올려 주세요. 자세하게 답변해 드리겠습니다.
					</p>
				</div>
				<div id="topBox_foot"></div>


				<div class="faq">

					<c:forEach items="${list}" var="FAQBoard">
						<ul>
							<li class="question"><img src="/resources/images/q.gif"
								alt="Q" /> <strong>${FAQBoard.title } </strong></li>
							<li class="answer"><img src="/resources/images/a.gif"
								alt="A" /> <strong>${FAQBoard.cont }</strong>
								<div class="clear"></div></li>
						</ul>
							<a href="modify?faq_num=${FAQBoard.faq_num }"><img
						src="<%=request.getContextPath()%>/resources/images/modify.gif"
						alt="수정"></a>
							<a href="delete?faq_num=${FAQBoard.faq_num }"><img
						src="<%=request.getContextPath()%>/resources/images/delete.gif"
						alt="삭제"></a>
					</c:forEach>

				</div>

			</div>
		</div>

		<!-- 게시판 버튼모음 -->	
		<div class="board_butt">

			 <a href="regist"><img
				src="<%=request.getContextPath()%>/resources/images/write.gif"
				alt="쓰기"></a> <a href="#" target="_blank"> </a>
		</div>

		<!-- //container -->
	</div>

	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/resources/css/board.css"
		type="text/css" media="all" />