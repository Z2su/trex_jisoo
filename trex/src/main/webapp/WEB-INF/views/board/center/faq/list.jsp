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
						<span class="box">고객님들께서 자주 문의하시는 질문입니다.</span><br />
						<span class="bold point">사이트 이용시 자주 문의하시는 질문입니다. </span>여기에서 궁금증이
						해결 되지 않으셨다면 참여마당 고객의 소리에 글을 올려 주세요. 자세하게 답변해 드리겠습니다.
					</p>
				</div>
				<div id="topBox_foot"></div>

				<div class="faq">
					<ul>
						<li class="question"><img src="/resources/images/q.gif"
							alt="Q" /> <strong>최근 공연, 정보를 알고 싶어요</strong></li>
						<li class="answer"><img src="/resources/images/a.gif"
							alt="A" /> <strong>상단 메뉴 중 "공연안내"의 공연정보를 통해 정보를 얻으실 수
								있으며, 메인화면 상단의 공연 소식을 통해서 최근 화제작을 한눈에 알수 있습니다.</strong>
							<div class="clear"></div></li>
					</ul>
					<ul>
						<li class="question"><img src="/resources/images/q.gif"
							alt="Q" /> <strong>지난 공연, 정보를 알고 싶어요</strong></li>
						<li class="answer"><img src="/resources/images/a.gif"
							alt="A" /> <strong>1. 홈페이지 상단의 공연정보 검색란을 이용하세요. 유의사항은
								키워드검색으로 띄어쓰기에 유의하셔야 하므로 주요단어만 입력하여 검색하 는 것이 더 빠릅니다. <br /> 2.
								공연 날짜를 알고 계시다 공연정보 안의 월간/연간일정에서 에서 月과 日을 클릭 해 보세요.
						</strong>
							<div class="clear"></div></li>
					</ul>
					<ul>
						<li class="question"><img src="/resources/images/q.gif"
							alt="Q" /> <strong>E-mail로 공연정보를 받아보고 싶습니다</strong></li>
						<li class="answer aborder"><img
							src="/resources/images/a.gif" alt="A" /> <strong>홈페이지내의
								회원가입에서 전당회원(무료·유료회원)으로 가입하시면 최신 공연정보를 e-Mail로 주기적으로 보내드리고 있습니다.</strong>
							<div class="clear"></div></li>
					</ul>
					<ul>
						<li class="question"><img src="/resources/images/q.gif"
							alt="Q" /> <strong>공연관람 시 리플렛 또는 안내책자 등은 따로 구입해야 하는
								건가요?</strong></li>
						<li class="answer aborder"><img
							src="/resources/images/a.gif" alt="A" /> <strong>공연에
								따라 리플렛 또는 안내책자를 판매하는 경우도 있고 무료로 나누어 드리는 경우도 있습니다. 가까운 안내원이나 직원에게
								안내를 받으시면 감사하겠습니다.</strong>
							<div class="clear"></div></li>
					</ul>
					<ul>
						<li class="question"><img src="/resources/images/q.gif"
							alt="Q" /> <strong>공연을 관람할 때 특별히 지켜야 할 복장 에티켓은 없나요?</strong></li>
						<li class="answer aborder"><img
							src="/resources/images/a.gif" alt="A" /> <strong>대부분의
								공연장은 정장 출입을 원칙으로 하고 있습니다. <br /> 하지만 정장이라고 해서 폭이 넓은 드레스를 입고,
								옆사람의 자리까지 차지하고 앉거나 , 너무 불편한 옷을 입어 옷에 신경쓰느라 공연이 끝난 후 무얼 봤는지 생각이
								안난다면 공연 입장료가 너무 아깝다는 생각이 들겠지요. 간편하고도 예의에 맞는 옷차림(꼭 정장이 아니라도)... <br />이것이
								공연장에 가는 본인에게도 옆사람에게도 좋은 공연을 감상하기 위한 옷차림의 예의라고 생각합니다.
						</strong>
							<div class="clear"></div></li>
					</ul>
					<ul>
						<li class="question"><img src="/resources/images/q.gif"
							alt="Q" /> <strong>공연관람 중 같이 참석하지 못하는 아이들을 위한 부대 시설은
								없나요?</strong></li>
						<li class="answer aborder"><img
							src="/resources/images/a.gif" alt="A" /> <strong>
								어린이들은 주의가 산만해지기 쉽기 때문에 공연에 몰입한 주위 사람들에게 큰 피해를 줄 수 있습니다. 따라서
								대전예술의전당의 공연장에는 초등학교 취학 이전의 아동 우리 나이로 8세 미만의 어린이들은 공연장 입장이
								불가능합니다. <br />간혹 어린이가 순하다든지, 음악을 하는 어린이라든지 하는 이유로 입장할 수 있지 않을까
								생각하는 경우가 있으나 입장 허용 연령 이전에는 어떤 경우든 입장이 불가능합니다. <br />다만 어린이 연극이나
								어린이용 발레 공연 등과 같이 드문 예외의 경우에는 입장허용 연령이 5살 정도로 낮아지기도 하는데, 이 경우 공연
								안내 전단이나 티켓 등에 미리 홍보가 되므로 확인을 하고 동반을 하면 됩니다. 만 3살(36개월)부터 취학 전까지의
								어린이들을 동반하여 온 경우에는 어린이놀이방에 공연 티켓을 보여주고 또래의 아이들과 어울릴 수 있도록 하면 됩니다.
								<br />흔한 것은 아니지만 공연에 따라 어린이 수가 어린이놀이방 정원(40명)을 넘어설 경우엔 맡기지 못하는
								경우도 있을 수 있으므로 어린이는 공연장에 데리고 오지 않는 것이 가장 안전한 방법입니다.
						</strong>
							<div class="clear"></div></li>
					</ul>
					<ul>
						<li class="question"><img src="/resources/images/q.gif"
							alt="Q" /> <strong>공연장 입장 시각은 언제 인가요?</strong></li>
						<li class="answer aborder"><img
							src="/resources/images/a.gif" alt="A" /> <strong> 보통
								공연시간 30분전에는 오셔야 합니다. 늦더라도 10분전엔 꼭 오세요. </strong>
							<div class="clear"></div></li>
					</ul>

				</div>

			</div>
		</div>
		<div id="divMenu">

			<!--quick  -->
			<%-- <!-- 	<%@ include file="/WEB-INF/views/board/center/quick.jsp" %> --> --%>

		</div>
		<!-- //container -->
	</div>

	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/resources/css/board.css"
		type="text/css" media="all">