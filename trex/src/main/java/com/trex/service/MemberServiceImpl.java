package com.trex.service;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import com.trex.controller.Criteria;
import com.trex.controller.MailRequest;
import com.trex.dao.MemberDAO;
import com.trex.dto.GmemberVO;
import com.trex.dto.MemberVO;
import com.trex.dto.TroupeVO;
import com.trex.mail.MimeAttachNotifier;
import com.trex.request.TempKey;

public class MemberServiceImpl implements MemberService {

	// MemberDAO 
		private MemberDAO memberDAO;
		public void setMemberDAO(MemberDAO memberDAO) {
			this.memberDAO=memberDAO;
		}
		@Autowired
		private MimeAttachNotifier notifier;
		public void setNotifier(MimeAttachNotifier notifier) {
			this.notifier = notifier;
		}

		/*private JavaMailSender mailSender;
		public void setMailSender(JavaMailSender mailSender) {
			this.mailSender = mailSender;
		}*/
		
	
	@Override
	public String regist(MemberVO member, String type) throws SQLException {
		
		int num = memberDAO.selectMemberNextSeq();
		
		String code = type.toUpperCase()+String.format("%04d", num);
		member.setMem_code(code);
		memberDAO.insertMember(member);
		return code;
		
	}

	@Override
	public void regist(GmemberVO gmember) throws SQLException {
		memberDAO.insertGmember(gmember);
		
	}

	@Override
	public void regist(TroupeVO troupe) throws SQLException {
		memberDAO.insertTroupe(troupe);
		
	}

	@Override
	public MemberVO getMember(String mem_id) throws SQLException {
		return memberDAO.selectMemberById(mem_id);
	}

	@Override
	public GmemberVO getGmember(String id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TroupeVO getTroupe(String id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVO> getMemberList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getMemberList(Criteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GmemberVO> getGmemberList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getGmemberList(Criteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TroupeVO> getTroupeList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getTroupeList(Criteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public void userReg_service(MemberVO memberVO) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void create(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		//memberDAO.create(member);
		
		// 임의의 authkey 생성
		String authkey = new TempKey().getKey(50, false);

		member.setAuthkey(authkey);
		memberDAO.updateAuthkey(member);
		MailRequest mail = new MailRequest();
		
		mail.setSender("wwwsoo012@naver.com");
		mail.setReceiver(member.getMem_email());
		mail.setTitle("회원가입");
		mail.setContent(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://localhost/joinConfirm?mem_id=")
				.append(member.getMem_id())
				.append("&mem_code=")
				.append(member.getMem_code())
				.append("&authkey=")
				.append(authkey)
				.append("' target='_blenk'>이메일 인증 확인</a>")
				.toString());
		System.out.println(">>>*****"+mail);
		notifier.sendMail(mail);

		/*// mail 작성 관련 
		MailUtils sendMail = new MailUtils(mailSender);

		sendMail.setSubject("[Hoon's Board v2.0] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://localhost/joinConfirm?uid=")
				.append(member.getMem_id())
				.append("&email=")
				.append(member.getMem_email())
				.append("&authkey=")
				.append(authkey)
				.append("' target='_blenk'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom("관리자 ", "관리자명");
		sendMail.setTo(member.getMem_email());
		sendMail.send();*/
		
	}

	@Override
	public void updateAuthstatus(MemberVO member) throws SQLException {

		memberDAO.updateAuthstatus(member);
		
	}



	



	
	

}
