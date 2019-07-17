<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>


<input id = datepicker >

	<div id="contentswrap">

		<!-- subvisual -->
		<div id="subvisual">
			<div class="subv_together">
				<div class="subv_pat">
					<p>
						<strong><img
							src="/resources/images/ma_service_type.png"
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
				<a href="/html/kr/together/together_0301.html">참여마당</a>&gt;<a
					href="/_prog/audition/?site_dvs_cd=kr&amp;menu_dvs_cd=030301">오디션/공모사업
					신청</a>&gt;<a
					href="/_prog/audition/?site_dvs_cd=kr&amp;menu_dvs_cd=030301"
					class="navi_ov">오디션신청</a></navi>
				<div class="nv_service">
					<a class="nvs_print" href="#total"
						onclick="printContent('/_prog/audition/?site_dvs_cd=kr&amp;menu_dvs_cd=030301');return false"><span
						class="hide">Print</span></a>

				</div>
			</div>
		</div>
		<!-- //navigation -->

		<!-- container -->
		<div id="container">
			<!-- leftmenu-->
			<div id="leftwrap">
				<h2 id="leftTi"
					style="background:url(<%=request.getContextPath()%>/resources/images/sidemenu.jpg) 0 0 no-repeat">참여마당</h2>

				<!--LEFTMENU START-->

				<script type="text/javascript">
				<!--
					var old_menu = '';
					var old_cell = '';
					var old_Lmenu = '';

					function menuclick(submenu) {
						if (old_menu != submenu) {
							if (old_menu != '') {
								old_menu = 'none';
							}
							jQuery(".lm_2th > li > div").hide();
							if (old_menu != '') {
								jQuery("#" + old_Lmenu).parent().find(">a")
										.removeClass("link_2th_ov").addClass(
												"link_2th");
							}
							jQuery("#" + submenu).parent().find(">a")
									.removeClass("link_2th").addClass(
											"link_2th_ov");

							document.getElementById(submenu).style.display = 'block';
							old_menu = document.getElementById(submenu).style.display;
							old_Lmenu = submenu;
						} else {
							document.getElementById(submenu).style.display = 'none';
							old_menu = '';
						}
					}
				//-->
				</script>



				<ul class="lm_2th">
					<li><a href="/html/kr/together/together_0301.html"
						class="link_2th" onclick="menuclick('submenu1');return false;"
						onkeypress="">회원혜택안내</a>
						<div id="submenu1" style="display: none; cursor: hand;">
							<ul class="lm_3th">
								<li><a href="/html/kr/together/together_0301.html"
									class="link_3th">- 회원안내</a></li>
								<li><a
									href="/_prog/_board/?code=paying_notice&amp;site_dvs_cd=kr&amp;menu_dvs_cd=030103&amp;site_dvs_cd=kr&amp;menu_dvs_cd=030103&amp;site_dvs_cd=kr&amp;menu_dvs_cd=030103"
									class="link_3th">- 회원소식</a></li>
								<li><a href="/html/kr/together/together_030102.html"
									class="link_3th">- Artner</a></li>
							</ul>
						</div>
						</li>
						
						
					<li><a href="/html/kr/together/together_030201.html"
						class="link_2th" onclick="menuclick('submenu2');return false;"
						onkeypress="">견학신청</a>
						<div id="submenu2" style="display: none; cursor: hand;">
							<ul class="lm_3th">
								<li><a href="/html/kr/together/together_030201.html"
									class="link_3th">- 견학안내</a></li>
								<li><a
									href="/_prog/field_trip/?site_dvs_cd=kr&amp;menu_dvs_cd=030202"
									class="link_3th">- 견학신청하기</a></li>
								<li><a
									href="/_prog/field_trip_app_check/?site_dvs_cd=kr&amp;menu_dvs_cd=030203"
									class="link_3th">- 견학신청조회</a></li>
							</ul>
						</div></li>
					<li><a
						href="/_prog/audition/?site_dvs_cd=kr&amp;menu_dvs_cd=030301"
						class="link_2th_ov" onclick="menuclick('submenu3');return false;"
						onkeypress="">오디션/공모사업 신청</a>
						<div id="submenu3" style="display: block;">
							<ul class="lm_3th">
								<li><a
									href="/_prog/audition/?site_dvs_cd=kr&amp;menu_dvs_cd=030301"
									class="link_3th_ov">- 오디션신청</a></li>
								<li><a
									href="/_prog/contest/?site_dvs_cd=kr&amp;menu_dvs_cd=030302"
									class="link_3th">- 공모사업신청</a></li>
							</ul>
						</div></li>
					<li><a href="/_prog/_poll?site_dvs_cd=kr&amp;menu_dvs_cd=0306"
						class="link_2th">이벤트</a></li>
					<li><a
						href="/_prog/_survey/?site_dvs_cd=kr&amp;menu_dvs_cd=0307"
						class="link_2th">설문조사</a></li>
					<li><a
						href="/_prog/_board/?code=stage&amp;site_dvs_cd=kr&amp;menu_dvs_cd=0308&amp;site_dvs_cd=kr&amp;menu_dvs_cd=0308&amp;site_dvs_cd=kr&amp;menu_dvs_cd=0308"
						class="link_2th">공연관람평</a></li>

				</ul>

				<div class="clearfix"></div>
			</div>
			<!-- //leftmenu-->

			<!-- content-->
			<div id="content">
				<!-- 컨텐츠 타이틀 -->
				<h3 class="cnt_ti">광고 신청</h3>
				<!-- 컨텐츠 타이틀 -->


				<!-- 탭메뉴 및 좌측메뉴 펼침기능 시작 부분 -->
				<script type="text/javascript">
					menuclick('submenu3');
				</script>




				<div id="txt">

					<div id="topBox_top"></div>
					<div id="topBox">
						<span class="icon"><img src="/images/kr/common/icon_01.gif"
							alt=""></span>
						<p>
							<span class="box">대전문화예술의전당에서는</span><span class="bold">
								아래와 같이 오디션을 실시합니다.</span>
						</p>
					</div>
					<div id="topBox_foot"></div>

					<table width="100%" class="table1 center" border="0"
						cellspacing="0" cellpadding="0" summary="테이블의 설명이 들어가는 부분입니다.">
						<caption>테이블요약이 들어가는 부분입니다.</caption>
						<colgroup>
							<col style="width: 64px;">
							<col style="width: 320px;">
							<col style="width: 160px;">
							<col style="width: 96px;">

						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="t_head">순번</th>
								<th scope="col" class="t_head">오디션명</th>
								<th scope="col" class="t_head">접수기간</th>
								<th scope="col" class="t_head t_end">접수</th>
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

								<td class="t_end"><a
									href="/_prog/audition_app/?mode=W&amp;site_dvs_cd=kr&amp;menu_dvs_cd=030301&amp;mng_no=35"><img
										src="/images/kr/common/bt_receipt.gif" border="0" alt="접수하기"></a></td>
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

					<div class="pageNum">
						<div class="pageNum">
							<span class="page">1</span><a href="?&amp;GotoPage=2"
								class="page_ov">2</a>
						</div>
					</div>

				</div>


			</div>


			<script type="text/javascript">
				var menu_list = jQuery("#divMenu >ul > li.image_rot");
				var img_rot = jQuery("#divMenu >ul > li").eq(1);
				menu_list.bind("mouseover", qm_rot);

				function qm_rot() {
					var img_idx = menu_list.index(jQuery(this));
					img_rot.find(">a>img").attr(
							"src",
							"/images/kr/common/qm_rot0" + (img_idx + 1)
									+ ".gif");
				}

				var slidemenu_X = 0; //상단 제한 값
				var slidemenu_Y = 500; //하단 제한 값
			</script>
			<script type="text/javascript">
				// slide menu  2006-06-14
				var isDOM = (document.getElementById ? true : false);
				var isIE4 = ((document.all && !isDOM) ? true : false);
				var isNS4 = (document.layers ? true : false);
				var isNS = navigator.appName == "Netscape";

				function getRef(id) {
					if (isDOM)
						return document.getElementById(id);
					if (isIE4)
						return document.all[id];
					if (isNS4)
						return document.layers[id];
				}

				function getSty(id) {
					x = getRef(id);
					return (isNS4 ? getRef(id) : getRef(id).style);
				}

				function moveRightEdge() {
					var yMenuFrom, yMenuTo, yOffset, timeoutNextCheck;

					if (isNS4) {
						yMenuFrom = document.getElementById('divMenu').style.top;
						yMenuTo = windows.pageYOffset + slidemenu_X; // 위쪽 위치
					} else if (isDOM) {
						yMenuFrom = parseInt(
								document.getElementById('divMenu').style.top,
								10);
						yMenuTo = (isNS ? window.pageYOffset
								: document.documentElement.scrollTop)
								+ slidemenu_X; // 위쪽 위치
					}
					timeoutNextCheck = 30;

					divMenu_H = document.getElementById('divMenu');
					limit_H = (parseInt(document.documentElement.scrollHeight) - slidemenu_Y)
							- parseInt(divMenu_H.offsetHeight);
					divMenu_t = parseInt(document.getElementById('divMenu').style.top);
					if (yMenuFrom != yMenuTo) {
						yOffset = Math.ceil(Math.abs(yMenuTo - yMenuFrom) / 20);
						if (yMenuTo < yMenuFrom) {
							yOffset = -yOffset;
						}
						if (isNS4) {
							if (yOffset > 0) {
								if (divMenu_t < limit_H) {
									document.getElementById('divMenu').style.top += yOffset
											+ "px";
								}
							} else {
								document.getElementById('divMenu').style.top += yOffset
										+ "px";
							}

						} else if (isDOM) {
							if (yOffset > 0) {
								if (divMenu_t < limit_H) {
									document.getElementById('divMenu').style.top = parseInt(document
											.getElementById('divMenu').style.top)
											+ yOffset + "px";
								}
							} else {
								document.getElementById('divMenu').style.top = parseInt(document
										.getElementById('divMenu').style.top)
										+ yOffset + "px";
							}
						}
						timeoutNextCheck = 10;
					}

					setTimeout("moveRightEdge()", timeoutNextCheck);
				}

				if (isNS4) {
					var divMenu = document["divMenu"];
					document.getElementById('divMenu').style.top = slidemenu_X
							+ "px";
					document.getElementById('divMenu').style.visibility = "visible";
					moveRightEdge();
				} else if (isDOM) {
					var divMenu = getRef('divMenu');
					document.getElementById('divMenu').style.top = slidemenu_X
							+ "px";
					document.getElementById('divMenu').style.visibility = "visible";
					moveRightEdge();
				}
			</script>
		</div>
		<!-- //container -->
	</div>
</body>



