<%@page import="com.trex.credit.KSPayWebHostBean"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%
	String rcid		= request.getParameter("reWHCid"		);
	String rctype	= request.getParameter("reWHCtype"		);
	String rhash	= request.getParameter("reWHHash"			);

	String	authyn =  "";
	String	trno   =  "";
	String	trddt  =  "";
	String	trdtm  =  "";
	String	amt    =  "";
	String	authno =  "";
	String	msg1   =  "";
	String	msg2   =  "";
	String	ordno  =  "";
	String	isscd  =  "";
	String	aqucd  =  "";
	String	temp_v =  "";
	String	result =  "";
	String	halbu  =  "";
	String	cbtrno =  "";
	String	cbauthno =  "";
	String	resultcd =  "";

	//업체에서 추가하신 인자값을 받는 부분입니다
	String	a =  request.getParameter("a"); 
	String	b =  request.getParameter("b"); 
	String	c =  request.getParameter("c"); 
	String	d =  request.getParameter("d");

	KSPayWebHostBean ipg = new KSPayWebHostBean(rcid);
	if (ipg.kspay_send_msg("1"))		//KSNET 결제결과 중 아래에 나타나지 않은 항목이 필요한 경우 Null 대신 필요한 항목명을 설정할 수 있습니다.
	{
		authyn	 = ipg.kspay_get_value("authyn");
		trno	 = ipg.kspay_get_value("trno"  );
		trddt	 = ipg.kspay_get_value("trddt" );
		trdtm	 = ipg.kspay_get_value("trdtm" );
		amt		 = ipg.kspay_get_value("amt"   );
		authno	 = ipg.kspay_get_value("authno");
		msg1	 = ipg.kspay_get_value("msg1"  );
		msg2	 = ipg.kspay_get_value("msg2"  );
		ordno	 = ipg.kspay_get_value("ordno" );
		isscd	 = ipg.kspay_get_value("isscd" );
		aqucd	 = ipg.kspay_get_value("aqucd" );
		temp_v	 = "";
		result	 = ipg.kspay_get_value("result");
		halbu	 = ipg.kspay_get_value("halbu");
		cbtrno	 = ipg.kspay_get_value("cbtrno");
		cbauthno	 = ipg.kspay_get_value("cbauthno");
		
		if (null != authyn && 1 == authyn.length())
		{
			if (authyn.equals("O"))
			{
				resultcd = "0000";
			}else
			{
				resultcd = authno.trim();
			}

			//ipg.kspay_send_msg("3");		// 정상처리가 완료되었을 경우 호출합니다.(이 과정이 없으면 일시적으로 kspay_send_msg("1")을 호출하여 거래내역 조회가 가능합니다.)
		}
	}
%>
<html>
<head>
<meta http-equiv="Cache-Control" content="no-cache"> 
<meta http-equiv="Pragma" content="no-cache"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>*** KSNET WebHost 결과 [JSP] ***</title>
<link href="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/css/pgstyle.css" rel="stylesheet" type="text/css" charset="euc-kr">
</head>
<script language="javascript">
// 현금영수증 출력 스크립트
function CashreceiptView(tr_no)
{
    receiptWin = "http://pgims.ksnet.co.kr/pg_infoc/src/bill/ps2.jsp?s_pg_deal_numb="+tr_no;
    window.open(receiptWin , "" , "scrollbars=no,width=434,height=580");
}
// 신용카드 영수증 출력 스크립트
function receiptView(tr_no)
{
	receiptWin = "http://pgims.ksnet.co.kr/pg_infoc/src/bill/credit_view.jsp?tr_no="+tr_no;
    window.open(receiptWin , "" , "scrollbars=no,width=434,height=700");
}
-->
</script>

<body>
<table width="560" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="50" align="right" background="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/bg_top.gif" class="txt_pd1">KSNET WebHost 결과 [JSP]</td>
  </tr>
  <tr>
    <td height="530" valign="top" background="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/bg_man.gif">	
	<table width="560" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="25">&nbsp;</td>
        <td width="505" align="center">
		<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="40" style="padding:0px 0px 0px 15px; "><img src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_tit5.gif" width="30" height="30" align="absmiddle"> <strong>결과항목</strong></td>
      </tr>
      <tr>
        <td align="center"><table width="400" border="0" cellspacing="0" cellpadding="0">
          <tr bgcolor="#FFFFFF">
            <td width="120"><img src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif" width="11" height="11" align="absmiddle"> 결제방법</td>
            <td width="280">
<%
						if (null == result || 4 != result.length())
						{
							out.println("(???)");
						}else
						{
							switch (result.charAt(0))
							{
								case '1' : out.println("신용카드"); break;
								case 'I' : out.println("신용카드"); break;
								case '2' : out.println("실시간계좌이체"); break;
								case '6' : out.println("가상계좌발급"); break; 
								case 'M' : out.println("휴대폰결제"); break; 
								case 'G' : out.println("상품권"); break; 
								default  :  out.println("(????)"); break; 
							}
						}
%>
            </td>
          </tr>
          <tr bgcolor="#E3E3E3"> <td height="1" colspan="2"></td> </tr>

          <tr bgcolor="#FFFFFF">
            <td width="120"><img src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif" width="11" height="11" align="absmiddle"> 성공여부</td>
            <td width="280"><%=authyn%>(<%= ((authyn != null && authyn.equals("O")) ? "승인성공" : "승인거절") %>) <font color=red> :성공여부값은 영어 대문자 O,X입니다. </font></td>
          </tr>
          <tr bgcolor="#E3E3E3"> <td height="1" colspan="2"></td> </tr>
          <tr bgcolor="#FFFFFF">
            <td width="120"><img src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif" width="11" height="11" align="absmiddle"> 응답코드</td>
            <td width="280"><%=resultcd%></td>
          </tr>
          <tr bgcolor="#E3E3E3"> <td height="1" colspan="2"></td> </tr>
          <tr bgcolor="#FFFFFF">
            <td width="120"><img src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif" width="11" height="11" align="absmiddle"> 주문번호</td>
            <td width="280"><%=ordno%></td>
          </tr>
          <tr bgcolor="#E3E3E3"> <td height="1" colspan="2"></td> </tr>
          <tr bgcolor="#FFFFFF">
            <td width="120"><img src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif" width="11" height="11" align="absmiddle"> 금액</td>
            <td width="280"><%=amt%></td>
          </tr>
          <tr bgcolor="#E3E3E3"> <td height="1" colspan="2"></td> </tr>
          <tr bgcolor="#FFFFFF">
            <td width="120"><img src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif" width="11" height="11" align="absmiddle"> 거래번호</td>
            <td width="280"><%=trno%> <font color=red>:KSNET에서 부여한 고유번호입니다. </font></td>
          </tr>
          <tr bgcolor="#E3E3E3"> <td height="1" colspan="2"></td> </tr>
          <tr bgcolor="#FFFFFF">
            <td width="120"><img src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif" width="11" height="11" align="absmiddle"> 거래일자</td>
            <td width="280"><%=trddt%></td>
          </tr>
          <tr bgcolor="#E3E3E3"> <td height="1" colspan="2"></td> </tr>
          <tr bgcolor="#FFFFFF">
            <td width="120"><img src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif" width="11" height="11" align="absmiddle"> 거래시간</td>
            <td width="280"><%=trdtm%></td>
          </tr>
          <tr bgcolor="#E3E3E3"> <td height="1" colspan="2"></td> </tr>
<% if (authyn != null && authyn.equals("O")) { %>
          <tr bgcolor="#FFFFFF">
            <td width="120"><img src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif" width="11" height="11" align="absmiddle"> 카드사 승인번호/은행 코드번호</td>
            <td width="280"><%=authno%><font color=red>:카드사에서 부여한 번호로 고유한값은 아닙니다. </font></td>
          </tr>
          <tr bgcolor="#E3E3E3"> <td height="1" colspan="2"></td> </tr>
<% } %>
          <tr bgcolor="#FFFFFF">
            <td width="120"><img src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif" width="11" height="11" align="absmiddle"> 발급사코드/가상계좌번호/계좌이체번호</td>
            <td width="280"><%=isscd%></td>
          </tr>
          <tr bgcolor="#E3E3E3"> <td height="1" colspan="2"></td> </tr>
          <tr bgcolor="#FFFFFF">
            <td width="120"><img src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif" width="11" height="11" align="absmiddle"> 매입사코드</td>
            <td width="280"><%=aqucd%></td>
          </tr>
          <tr bgcolor="#E3E3E3"> <td height="1" colspan="2"></td> </tr>
          <tr bgcolor="#FFFFFF">
            <td width="120"><img src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif" width="11" height="11" align="absmiddle"> 메시지1</td>
            <td width="280"><%=msg1%></td>
          </tr>
          <tr bgcolor="#E3E3E3"> <td height="1" colspan="2"></td> </tr>
          <tr bgcolor="#FFFFFF">
            <td width="120"><img src="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/ico_right.gif" width="11" height="11" align="absmiddle"> 메시지2</td>
            <td width="280"><%=msg2%></td>
          </tr>
          <tr bgcolor="#E3E3E3"> <td height="1" colspan="2"></td> </tr>

		  <% if (authyn != null && authyn.equals("O") && trno.charAt(0) == '1') { %> <!-- 정상승인의 경우만 영수증출력: 신용카드의 경우만 제공 -->
          <tr bgcolor="#FFFFFF">
            <td width="400" colspan="2" align="center"> <input type="button" value="영수증출력" onClick="javascript:receiptView('<%=trno%>')"> </td>
          </tr>
          <tr bgcolor="#E3E3E3"> <td height="1" colspan="2"></td> </tr>
      <% } %>
      <% if (authyn != null && authyn.equals("O") && trno.charAt(0) == '2') { %> <!-- 정상승인의 경우만 영수증출력: 계좌이체의 경우만 제공 -->
          <tr bgcolor="#FFFFFF">
            <td width="00" colspan="2" align="center"> 
            <input type="button" value="영수증출력" onClick="javascript:CashreceiptView('<%=cbtrno%>')"> 
            </td>
          </tr>
          <tr bgcolor="#E3E3E3"> <td height="1" colspan="2"></td> </tr>
      <% } %>
        </table></td>
      </tr>
    </table>
		</td>
        <td width="30">&nbsp;</td>
      </tr>
    </table>
	</td>
  </tr>
  <tr>
    <td height="37" background="http://kspay.ksnet.to/store/KSPayFlashV1.3/mall/imgs/bg_bot.gif">&nbsp;</td>
  </tr>
</table>
</body>
</html>
