package com.trex.controller.board;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.trex.dto.AdVO;
import com.trex.dto.PerformVO;
import com.trex.request.Criteria;
import com.trex.service.AdService;
import com.trex.service.MemberService;
import com.trex.service.PerformService;
import com.trex.utils.UploadFileUtil;

@Controller
@RequestMapping("/board")
public class AdController {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	private PerformService pfService;
	
	@Autowired
	private AdService adService;
	

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
	
	@RequestMapping("/ad/adlist")
	public void adListGET(Criteria cri,Model model)
			throws Exception{
		
		Map<String,Object> dataMap = adService.getAdList(cri);
		model.addAttribute("dataMap",dataMap);
		
	}
	/*@RequestMapping(value = "/ad/adlist", method = RequestMethod.GET)
	public void prlistGET(Model model) throws Exception {

		List<AdVO> adlist = adService.adList();

		model.addAttribute("adlist", adlist);

	}*/
	
	@RequestMapping(value="/ad/addetail", method = RequestMethod.GET)
	public ModelAndView addetailGET(int ad_num, ModelAndView modelnView) throws SQLException{
		AdVO ad = adService.adDetail(ad_num);
		modelnView.addObject("ad",ad);
		return modelnView;
	}

	@RequestMapping(value = "/ad/adregist", method = RequestMethod.GET)
	public void adregistGET(String writer, Model model, String mem_id) throws SQLException{
	
		List<PerformVO> pfList = pfService.getPFList();
		
		model.addAttribute("pfList",pfList);
		
	}
	
	@RequestMapping(value="/ad/adregist", method=RequestMethod.POST)
	public String adregistPOST(AdVO ad,MultipartFile file,HttpServletRequest request)throws Exception{
		
		
		String imgUploadPath = request.getServletContext().getRealPath(uploadPath);
		String ymdPath = UploadFileUtil.calcPath(imgUploadPath);
		String fileName = null;
		String url="redirect:adlist";
		System.out.println("advo!!!!!!!!!!!"+ad);

		if(file != null) {
		 fileName = UploadFileUtil.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		ymdPath=ymdPath.replace("\\","/")+"/";
		
		ad.setImg(uploadPath + ymdPath + fileName);
		ad.setThumbimg(uploadPath + ymdPath  + "/s/"  + "s_" + fileName);

		adService.write(ad);
		System.out.println("advo!!!!!!!!!!!"+ad);
		
		return url;
	}
	
	@RequestMapping(value="/ad/admodify", method=RequestMethod.GET)
	public void admodifyGET(int ad_num,Model model)throws SQLException{
		AdVO ad = adService.adDetail(ad_num);
		model.addAttribute("ad", ad);
		System.out.println(ad);
	}
	
	@RequestMapping(value="/ad/admodify",method=RequestMethod.POST	)
	public String admodifyPOST(AdVO ad)throws SQLException {
		
		String url="redirect:adlist";
		adService.modify(ad);
		
		System.out.println(ad);
		return url;
		
	}
	
	@RequestMapping(value="/ad/addelete",method=RequestMethod.GET)
	public String addelete(int ad_num)throws SQLException{
		String url="redirect:adlist";
		adService.remove(ad_num);
		return url;
	}
	
	@RequestMapping(value="/ad/agree1",method=RequestMethod.GET)
	public String agree1(AdVO ad)throws SQLException{
		String url="redirect:adlist";
		adService.agree1(ad);
		return url;
	}
	@RequestMapping(value="/ad/agree2",method=RequestMethod.POST)
	public String agree2(AdVO ad)throws SQLException{
		String url="redirect:adlist";
		adService.agree2(ad);
		return url;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
