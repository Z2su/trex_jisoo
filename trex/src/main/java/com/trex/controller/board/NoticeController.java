package com.trex.controller.board;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.trex.dto.NoticeVO;
import com.trex.service.NoticeService;

@Controller
@RequestMapping("/board/center")
public class NoticeController {

	@Autowired
	private NoticeService nService;

	@ModelAttribute("submenuList")
	public List<String[]> submenuModel() {
		
		List<String[]> submenuList = new ArrayList<String[]>();

		submenuList.add(new String[] { "공지사항", "notice/list" });
		submenuList.add(new String[] { "FAQ", "faq/list" });
		submenuList.add(new String[] { "QNA", "qna/list" });

		return submenuList;
	}

	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)
	public ModelAndView listGET(ModelAndView modelnView) {

		String url = "board/center/notice/list";
		List<NoticeVO> NoticeList = null;

		try {
			NoticeList = nService.getNoticeList();
			System.out.println("Notice>>>>>" + NoticeList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		modelnView.addObject("NoticeList", NoticeList);
		modelnView.setViewName(url);

		return modelnView;
	}

	@RequestMapping(value = "/notice/regist")
	public String noticeRegistGET(HttpServletRequest request) throws Throwable {

		return "board/center/notice/regist";
	}

	@RequestMapping(value = "/notice/regist", method = RequestMethod.POST)
	public String noticeRegistPOST(NoticeVO notice, HttpServletResponse response) throws Exception {
		
		String url = "redirect:list";

		nService.regist(notice);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		out.println("<script>");
		out.println("window.opener.location.href='/board/notice/list';window.close();");
		out.println("</script>");

		return url;
	}

	@RequestMapping(value = "/notice/detail{notice_num}", method = RequestMethod.GET)
	public ModelAndView detail(int notice_num, ModelAndView modelnView) throws SQLException {
		
		NoticeVO notice = nService.readNotice(notice_num);
		modelnView.addObject("notice",notice);
		
		return modelnView;
	}

	@RequestMapping(value = "/notice/remove", method = RequestMethod.POST)
	public void remove(int notice_num, HttpServletResponse response) throws Exception {

		nService.remove(notice_num);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();window.close();");
		out.println("</script>");
	}

/*	@RequestMapping(value = "/notice/modify", method = RequestMethod.GET)
	public String modify(int notice_num, Model model) throws Exception {

		String url = "board/center/notice_modify";

		NoticeVO notice = nService.getNotice(notice_num);
		model.addAttribute("notice", notice);
s
		return url;
	}*/

	@RequestMapping(value = "/notice/modify", method = RequestMethod.POST)
	public void modifyPOST(String oldAttach, NoticeVO notice, HttpSession session, HttpServletResponse response)
			throws Exception {

		NoticeVO notice_num = (NoticeVO) session.getAttribute("notice_num");
		if (oldAttach != null && !oldAttach.isEmpty()) {
			String[] fileNames = oldAttach.split(",");
			for (String fileName : fileNames) {
				String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			}
		}

		nService.modify(notice);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();");
		out.println("location.href='detail?=" + notice.getNotice_num() + "';");
		out.println("</script>");
	}
}