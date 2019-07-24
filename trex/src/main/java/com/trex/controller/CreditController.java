package com.trex.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.trex.credit.KSPayWebHostBean;
import com.trex.dao.PayDAO;
import com.trex.dto.CreditRequest;
import com.trex.service.PayService;

@Controller
@RequestMapping("/credit")
public class CreditController {
	
	@Autowired
	private PayService pService;
	
	@Autowired
	private PayDAO payDAO;
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public void getcreditForm(Model model)throws Exception{
		
	/*	String pay_code = "pay";
		model.addAttribute("pay_code",pay_code);*/
		
	}

	@RequestMapping(value="/form", method=RequestMethod.POST)
	public void creditForm(@ModelAttribute("creditReq")CreditRequest creditReq,
			String pay_code) throws Exception{
		
		creditReq.setSndOrderNumber(pay_code);
		creditReq.setSndStoreid("2999199999");
		
	}
/*	
	@RequestMapping(value="/form", method=RequestMethod.POST)
	public String creditForm(해당Request vo,Model model)throws Exception{
		String url="...경로/폼";
		
		CreditRequest creditReq = new CreditRequest();
		creditReq.setSndAddress(vo.getSndAddress());
		//
		//
		//
		//
		//			
		String pay_code = "pay"+ ;
		creditReq.setSndOrderNumber("201907091245");
		creditReq.setSndStoreid("2999199999");
		
		model.addAttribute("creditReq",creditReq);
		
		return url;
	}
*/	
	@RequestMapping(value="/kspay_wh_rcv", method=RequestMethod.POST)
	public void kspay_wh_rcv() {}
	
	@RequestMapping(value="/kspay_wh_result", method=RequestMethod.POST)
	public void kspay_wh_result(HttpServletRequest request) {
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
		String	sndAddress =  request.getParameter("sndAddress"); 

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
				if (authyn.equals("O")) // 결재 성공
				{
					resultcd = "0000";
					System.out.println("결재가 성공했습니다.");
					System.out.println("거래번호 : " +trno);
					System.out.println("거래일자 : " +trddt);
					System.out.println("결재금액 : " +amt);
					System.out.println("주문번호 : " +ordno);
					System.out.println("결재수단 : " +result);
					System.out.println("배송지 : " +sndAddress);
				}else //결재 실패
				{
					resultcd = authno.trim();
				}

				//ipg.kspay_send_msg("3");		// 정상처리가 완료되었을 경우 호출합니다.(이 과정이 없으면 일시적으로 kspay_send_msg("1")을 호출하여 거래내역 조회가 가능합니다.)
			}
		}
	}
}
