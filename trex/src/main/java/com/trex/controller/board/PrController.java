package com.trex.controller.board;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.trex.dto.PrVO;
import com.trex.request.Criteria;
import com.trex.service.PrService;

@Controller
@RequestMapping("/board")
public class PrController {

	@Autowired
	private PrService prService;

	@ModelAttribute("submenuTitle")
	public String submenuTitle() {
		return "홍보게시판";
	}

	@ModelAttribute("submenuList")
	public List<String[]> submenuModel() {
		List<String[]> submenuList = new ArrayList<String[]>();

		submenuList.add(new String[] { "홍보게시판", "/board/pr/prlist" });
		submenuList.add(new String[] { "광고게시판", "/board/ad/adlist" });
		submenuList.add(new String[] { "이벤트", "/board/event/list" });

		return submenuList;
	}

	@RequestMapping("/pr/prlist")
	public void prListGET(Criteria cri, Model model) throws Exception {
		Map<String, Object> dataMap = prService.getPrList(cri);
		model.addAttribute("dataMap", dataMap);

	}

	/*
	 * @RequestMapping("/pr/prlist") public ModelAndView prListGET(Criteria
	 * cri,ModelAndView modelnView) throws SQLException{
	 * 
	 * String url="board/pr/prlist";
	 * 
	 * Map<String,Object> dataMap = prService.getPrList(cri);
	 * 
	 * modelnView.addObject("dataMap",dataMap); modelnView.setViewName(url);
	 * 
	 * return modelnView; }
	 */
	/*
	 * @RequestMapping(value="/pr/prlist",method=RequestMethod.GET) public void
	 * prlistGET(Model model)throws Exception {
	 * 
	 * List<PrVO> prlist = prService.prList();
	 * 
	 * model.addAttribute("prlist", prlist);
	 * 
	 * 
	 * }
	 */
	@RequestMapping(value = "/pr/prdetail", method = RequestMethod.GET)
	public ModelAndView prdetailGET(int pr_num, ModelAndView modelnView) throws SQLException {
		PrVO pr = prService.prDetail(pr_num);
		modelnView.addObject("pr", pr);
		return modelnView;
	}

	@RequestMapping(value = "/pr/prregist", method = RequestMethod.GET)
	public void prregistGET() {

	}

	@RequestMapping(value = "/pr/prregist", method = RequestMethod.POST)
	public String prregistPOST(PrVO pr) throws SQLException {
		String url = "redirect:prlist";
		prService.write(pr);

		return url;

	}

	@RequestMapping(value = "/pr/prmodify", method = RequestMethod.GET)
	public void prmodifyGET(int pr_num, Model model) throws SQLException {
		PrVO pr = prService.prDetail(pr_num);
		model.addAttribute("pr", pr);
		System.out.println(pr);
	}

	@RequestMapping(value = "/pr/prmodify", method = RequestMethod.POST)
	public String prmodifyPOST(PrVO pr) throws SQLException {

		String url = "redirect:prlist";
		prService.modify(pr);

		System.out.println(pr);
		return url;

	}

	@RequestMapping(value = "/pr/prdelete", method = RequestMethod.GET)
	public String prdelte(int pr_num) throws SQLException {
		String url = "redirect:prlist";
		prService.remove(pr_num);
		return url;
	}

	@RequestMapping(value = "/my/imageUpload", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> imageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartFile uploadFile) throws Exception {

		// 이미지 업로드할 경로
		String savePath = request.getServletContext().getRealPath("/resources/imageUpload");

		File uploadPathFile = new File(savePath);

		if (!uploadPathFile.exists()) {
			uploadPathFile.mkdirs();
		}

		String fileFormat = uploadFile.getOriginalFilename()
				.substring(uploadFile.getOriginalFilename().lastIndexOf(".") + 1);
		String fileName = UUID.randomUUID().toString().replace("-", "") + fileFormat;

		uploadFile.transferTo(new File(savePath + File.separator + fileName));

		// 업로드된 경로와 파일명을 통해 이미지의 경로를 생성
		String url = request.getContextPath() + "/resources/imageUpload/" + fileName;

		Map<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("url", url);

		System.out.println(dataMap);
		return dataMap;

	}

}
