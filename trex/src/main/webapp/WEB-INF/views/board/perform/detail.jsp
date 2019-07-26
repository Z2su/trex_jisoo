<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/resources/css/Perform.css" type="text/css" media="all">
<div id="contentswrap">

	<!-- subvisual -->
	<div id="subvisual">
		<div class="subv_performance">
			<div class="subv_pat">
				<p>
					<strong>
					<img
						src="/resources/images/ma_service_type.png"
						alt="Daejeon Arts Center">
						</strong> 문화로 시민을 행복하게! 대전예술의전당
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
					class="hide">Print</span></a> 

			</div>
		</div>
	</div>
	<!-- //navigation -->

	<!-- container -->
	<div id="container">
		<%@ include file="/WEB-INF/views/board/commons/submenu.jsp"%>


		<!-- content-->
		<div id="content">
			<!-- 컨텐츠 타이틀 -->
			<h3 class="cnt_ti">detail</h3>
			<input  type="button" id="remove" value="삭제"/>

			<div id="showView">
				<strong class="top"></strong>
				<div class="pefrImg">
					<div class="photo_gallery">
						<div class="galleryNum">
							(<span class="bold">1</span>/4)
						</div>
						<div class="galleryView">
							<ul class="bicImage">
								<li><a
									href="/resources/images/perform/performance_1_155383691853133_518870747.jpg"
									rel="facebox"><img
										src="/resources/images/perform/${PFGBoard.pf_code }.jpg"
										alt="" style="display: inline;"></a></li>
								<!-- <li><a
									href="/resources/images/perform/performance_2_155383691903589_1853500726.jpg"
									rel="facebox"><img
										src="/resources/images/perform/performance_2_155383691903589_1853500726.jpg"
										alt="바르셀로나 기타 트리오 &amp; 댄스 “플라멩코”" style="display: none;"></a></li>
								<li><a href="/resources/images/perform/" rel="facebox"><img
										src="/resources/images/perform/" alt="바르셀로나 기타 트리오 &amp; 댄스 “플라멩코”"
										style="display: none;"></a></li>
								<li><a href="/resources/images/perform/" rel="facebox"><img
										src="/resources/images/perform/" alt="바르셀로나 기타 트리오 &amp; 댄스 “플라멩코”"
										style="display: none;"></a></li> -->
							</ul>
							<!-- <ul class="bicImage1">
								<li><a
									href="/resources/images/perform/performance_1_155383691853133_518870747.jpg"
									rel="facebox"><img
										src="/resources/images/perform/expansion.gif" alt="확대보기"></a></li>
								<li><a
									href="/resources/images/perform/performance_2_155383691903589_1853500726.jpg"
									rel="facebox"><img
										src="/resources/images/perform/expansion.gif" alt="확대보기"></a></li>
								<li><a href="/resources/images/perform/" rel="facebox"><img
										src="/resources/images/perform/expansion.gif" alt="확대보기"></a></li>
								<li><a href="/resources/images/perform/" rel="facebox"><img
										src="/resources/images/perform/expansion.gif" alt="확대보기"></a></li>
							</ul> -->
						</div>
						<!-- <div id="discount" style="display: none;">예당 유료회원 법인
							20%할인(100매), 골드 20%(4매), 블루 15%(4매)</div>

						<p class="no_mar center top_mar_5"><a href="/resources/images/perform/performance_1_155383691853133_518870747.jpg" rel="facebox"><img src="/resources/images/perform/expansion.gif" alt="확대보기" /></a></p>
						<div class="galleryThum">
							<div class="wrap">
								<ul class="thumnail">
									<li><a href="#total" onclick="thumImg(1); return false;"><img
											src="/resources/images/perform/thm_performance_1_155383691853133_518870747.jpg"
											alt="바르셀로나 기타 트리오 &amp; 댄스 “플라멩코”"
											style="width: 41px; height: 39px;"></a></li>
									<li><a href="#total" onclick="thumImg(2); return false;"><img
											src="/resources/images/perform/thm_performance_2_155383691903589_1853500726.jpg"
											alt="바르셀로나 기타 트리오 &amp; 댄스 “플라멩코”"
											style="width: 41px; height: 39px;"></a></li>
								</ul>
							</div>
						</div> -->
					</div>
				</div>
				<script type="text/javascript">
					photoAlbum();
				</script>
				
				<ul class="pefrText">
					<li><strong>공연이름</strong><span id="title">${PFGBoard.title }</span></li>
				
					<li><strong>공연구분</strong><span>${PFGBoard.divi } </span></li>
					<li><strong>공연날짜</strong><span id="rundate"> <fmt:formatDate
								value="${PFGBoard.rundate }" pattern="yyyy-MM-dd" /> 
					</span></li>
					<li><strong>공연시간</strong><span id="starttime"> <fmt:formatDate
								value="${PFGBoard.starttime }" pattern="HH:mm" />
					</span></li>
					<li><strong>공연장소</strong><span id="hall_name">${PFGBoard.hall_name }</span></li>
				<!-- 	<li><strong>티켓정보</strong><span>R석 7만원, S석 6만원, A석 5만원,
							B석 4만원</span></li> -->
					<li><strong>소요시간</strong><span id="runtime">${PFGBoard.runtime }</span></li>
					<!-- <li><strong>관람등급</strong><span>8세 이상</span></li> -->
					<li><strong>공연장르</strong><span id="cls">${PFGBoard.cls }</span></li>
				<!-- 	<li><strong>문의처</strong><span>브라보컴 1661-1605</span></li> -->
				</ul>
				
				<p class="reserer">
					<a href="#total"
							onclick="window.open('/performrese/${PFGBoard.pf_code }/step1', '네이버새창', 'width=910, height=690, toolbar=no, menubar=no, scrollbars=no, resizable=yes' );" >
						<img
						src="/resources/images/perform/bt_reser.gif"
						alt="바르셀로나 기타 트리오 &amp; 댄스 “플라멩코” 공연예매"></a>
						<!-- <a href="#total"
						onclick="javascript:if(confirm('[바르셀로나 기타 트리오 &amp; 댄스 “플라멩코”] 공연정보를 관심공연담기로 지정 하시겠습니까?')) goBasket('3087');"><img
						src="/resources/images/perform/bt_show.gif"
						alt="바르셀로나 기타 트리오 &amp; 댄스 “플라멩코”관심공연담기"></a>
						-->
						<a
                  href="/board/perform/list"><img
                  src="/resources/images/list.gif" alt="목록"></a> 
				</p>
			</div>
			<div class="clearfix"></div>
			<!-- <!-- <div class="show_sale">
				<h4>
					할인혜택<a class="user_money"
						href="/html/kr/together/together_0301.html"><img
						src="/resources/images/perform/bt_subscribe.gif" alt="유료회원혜택"></a>
				</h4>
				<div class="showcontent">
					<strong></strong>
					<div>예당&nbsp;유료회원&nbsp;법인&nbsp;20%할인(100매),&nbsp;골드&nbsp;20%(4매),&nbsp;블루&nbsp;15%(4매)
					</div>
				</div>
			</div> 
			<div id="showviewTab">
				<span>
				<a href="#show_view_01" onclick="showview01(0);return false;">공연소개</a>
				</span> 
				<span>
				<a href="#show_view_02" onclick="showview02(0);return false;">프로그램소개</a>
				</span>
				<span>
				<a href="#show_view_03" onclick="showview03(0);return false;">출연진소개</a>
				</span> 
				<span><a href="#show_view_04" onclick="showview04(0);return false;">기타사항</a>
				</span>
				<span>
				<a href="#show_view_05" onclick="showview05(0);return false;">이벤트</a></span>
			</div> -->
			<div class="showcontent">
		<strong></strong>
				<div id="show_view_01">
								${PFGBoard.cont }
					
				</div>

		</div>
		
		<script>
		$('#remove').on('click',function(e){
			
			e.preventDefault();
			
			location.href="/board/perform/delete/${PFGBoard.pfg_code}";	

		});
		
		</script>
		<!--quick  -->

	</div>
	<!-- //container -->
</div>