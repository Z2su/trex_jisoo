<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="contentswrap">

	<!-- subvisual -->
	<div id="subvisual">
		<div class="subv_performance">
			<div class="subv_pat">
				<p>
					<strong><img
						src="/images/kr/common_2015/ma_service_type.png"
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
			<navi>
			<a href="<%=request.getContextPath() %>/board/board/prlist">게시판</a>&gt;<a
				href="<%=request.getContextPath() %>/board/board/adlist">광고게시판</a>
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
			<h3 class="cnt_ti">광고 리스트</h3>
			<table width="100%" class="table1 center" border="0" cellspacing="0"
				cellpadding="0" summary="테이블의 설명이 들어가는 부분입니다.">
				<colgroup>
					<col style="width: 64px;">
					<col style="width: 320px;">
					<col style="width: 160px;">
					<col style="width: 96px;">

				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="t_head">번호</th>
						<th scope="col" class="t_head">제목</th>
						<th scope="col" class="t_head">작성자</th>
						<th scope="col" class="t_head t_end">신청결과</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>15</td>
						<td><a
							href="/_prog/audition/?mode=V&amp;site_dvs_cd=kr&amp;menu_dvs_cd=030301&amp;mng_no=35">2019
								그랜드시즌-시그니쳐 컬렉션 오페라&lt;투란도트&gt; 오디션 공고</a></td>
						<td>2019-06-24 09:00 부터<br>2019-07-03 17:00 까지
						</td>

						<td class="t_end"><img
							src="/images/kr/common/bt_completion.gif" border="0" alt="접수완료"></td>
					</tr>
					<tr>
						<td>14</td>
						<td><a
							href="/_prog/audition/?mode=V&amp;site_dvs_cd=kr&amp;menu_dvs_cd=030301&amp;mng_no=34">2019
								그랜드시즌 – 시그니처 컬렉션 대전예술의전당 열네 번째 제작연극 &lt;죄와 벌&gt; 배우 오디션 공고</a></td>
						<td>2019-05-15 09:00 부터<br>2019-05-19 17:00 까지
						</td>

						<td class="t_end"><img
							src="/images/kr/common/bt_completion.gif" border="0" alt="접수완료"></td>
					</tr>
					<tr>
						<td>13</td>
						<td><a
							href="/_prog/audition/?mode=V&amp;site_dvs_cd=kr&amp;menu_dvs_cd=030301&amp;mng_no=33">2019
								스프링페스티벌 제작연극 &lt;어린왕자(가제)&gt; 배우 공모</a></td>
						<td>2019-02-11 00:00 부터<br>2019-02-12 17:00 까지
						</td>

						<td class="t_end"><img
							src="/images/kr/common/bt_completion.gif" border="0" alt="접수완료"></td>
					</tr>
					<tr>
						<td>12</td>
						<td><a
							href="/_prog/audition/?mode=V&amp;site_dvs_cd=kr&amp;menu_dvs_cd=030301&amp;mng_no=31">2019
								스프링페스티벌 가족오페라 &lt;피노키오&gt;오디션 공고</a></td>
						<td>2019-01-19 00:00 부터<br>2019-01-27 23:00 까지
						</td>

						<td class="t_end"><img
							src="/images/kr/common/bt_completion.gif" border="0" alt="접수완료"></td>
					</tr>
					<tr>
						<td>11</td>
						<td><a
							href="/_prog/audition/?mode=V&amp;site_dvs_cd=kr&amp;menu_dvs_cd=030301&amp;mng_no=30">2019
								Sumer New Artists Concert 출연자 오디션 공고</a></td>
						<td>2019-01-22 00:00 부터<br>2019-01-24 00:00 까지
						</td>

						<td class="t_end"><img
							src="/images/kr/common/bt_completion.gif" border="0" alt="접수완료"></td>
					</tr>
					<tr>
						<td>10</td>
						<td><a
							href="/_prog/audition/?mode=V&amp;site_dvs_cd=kr&amp;menu_dvs_cd=030301&amp;mng_no=29">대전예술의전당
								배우(합창단) 오디션 공고</a></td>
						<td>2018-10-15 08:00 부터<br>2018-10-17 17:00 까지
						</td>

						<td class="t_end"><img
							src="/images/kr/common/bt_completion.gif" border="0" alt="접수완료"></td>
					</tr>
					<tr>
						<td>9</td>
						<td><a
							href="/_prog/audition/?mode=V&amp;site_dvs_cd=kr&amp;menu_dvs_cd=030301&amp;mng_no=28">2018
								그랜드시즌 - 연극 &lt;파란나라&gt; 시민배우 공개모집</a></td>
						<td>2018-06-28 09:00 부터<br>2018-07-08 18:00 까지
						</td>

						<td class="t_end"><img
							src="/images/kr/common/bt_completion.gif" border="0" alt="접수완료"></td>
					</tr>
					<tr>
						<td>8</td>
						<td><a
							href="/_prog/audition/?mode=V&amp;site_dvs_cd=kr&amp;menu_dvs_cd=030301&amp;mng_no=27">2018
								대전예당 개관15주년 기념 제작오페라 &lt;라 보엠&gt; 출연자 오디션 공고 </a></td>
						<td>2018-05-28 00:00 부터<br>2018-06-12 17:00 까지
						</td>

						<td class="t_end"><img
							src="/images/kr/common/bt_completion.gif" border="0" alt="접수완료"></td>
					</tr>
					<tr>
						<td>7</td>
						<td><a
							href="/_prog/audition/?mode=V&amp;site_dvs_cd=kr&amp;menu_dvs_cd=030301&amp;mng_no=26">2018
								제작연극 &lt;백치&gt; 출연 배우 오디션 공고 </a></td>
						<td>2018-05-30 00:00 부터<br>2018-06-01 17:00 까지
						</td>

						<td class="t_end"><img
							src="/images/kr/common/bt_completion.gif" border="0" alt="접수완료"></td>
					</tr>
					<tr>
						<td>6</td>
						<td><a
							href="/_prog/audition/?mode=V&amp;site_dvs_cd=kr&amp;menu_dvs_cd=030301&amp;mng_no=25">2018
								공동제작뮤지컬&lt;파가니니&gt; 출연자 오디션 공고 </a></td>
						<td>2018-03-16 09:00 부터<br>2018-03-20 18:00 까지
						</td>

						<td class="t_end"><img
							src="/images/kr/common/bt_completion.gif" border="0" alt="접수완료"></td>
					</tr>
				</tbody>
				
			</table>
			<div class="board_butt" style="margin: 10px 0;padding: 0 10px; text-align: right">

					<a href="/board/board/adlist">
					<img src="<%=request.getContextPath()%>/resources/images/list.gif" alt="목록"></a> 
					<a href="#">
					<img src="<%=request.getContextPath()%>/resources/images/write.gif" alt="쓰기"></a>
			</div>
			
			<div class="pageNum"><div class="pageNum"><span class="page">1</span><a href="?&amp;GotoPage=2" class="page_ov">2</a> </div></div>

		</div>
	</div>
	<!-- //container -->
</div>