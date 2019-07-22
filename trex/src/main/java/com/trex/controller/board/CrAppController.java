package com.trex.controller.board;

import java.io.File;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.trex.dto.CrAppVO;
import com.trex.service.CrAppService;

@Controller
@RequestMapping("/board/Coronation")
public class CrAppController {
	
	@Autowired
	private CrAppService CrAppService;
	
	@ModelAttribute("submenulist")
	public List<String[]> submenuModel() {
		List<String[]> submenuList = new ArrayList<String[]> ();
		
		submenuList.add(new String[] {"대관신청","/board/Coronation/app/list"});
		
		return submenuList;
		
	}
		
	
	@RequestMapping(value="/app/list")
	public ModelAndView listGET(ModelAndView modelnView) {
		
		String url="board/Coronation/app/list";
		List<CrAppVO> CRAppBoardList = null;
		
			try {
				CRAppBoardList = CrAppService.getBoardList();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		modelnView.addObject("CRAppBoardList", CRAppBoardList);
		modelnView.setViewName(url);
		
		return modelnView;
	}
	
	@RequestMapping(value="/app/detail/{cr_app_code}",method=RequestMethod.GET)
	public ModelAndView detailGET(@PathVariable String cr_app_code, ModelAndView modelnView) {
		String url = "board/Coronation/app/detail";
		
		CrAppVO CRAppBoard = null;
		
		try {
			CRAppBoard = CrAppService.readBoard(cr_app_code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("CR_App~~~"+CRAppBoard);
		modelnView.addObject("CRAppBoard",CRAppBoard);
		modelnView.setViewName(url);
		
		return modelnView;
	}
	
	@RequestMapping(value="/app/regist", method=RequestMethod.GET)
	public String registGET() {
		String url ="board/Coronation/app/regist";
		return url;
	}
	
	@RequestMapping(value="/app/regist", method=RequestMethod.POST)
	public String registPOST(CrAppVO CRAppBoard, String writer, HttpServletResponse response) throws Exception {
		String url ="redirect:list";
		System.out.println("등록><><><><><><><><>");
		CrAppService.write(CRAppBoard);
		return url;
	
	}
	
	@RequestMapping(value="/app/modify",method=RequestMethod.GET)
	public void modifyForm(String cr_app_code,Model model) throws Exception{
		
		CrAppVO CRAPPboard = CrAppService.getBoardForModify(cr_app_code);
		model.addAttribute("CRAppboard",CRAPPboard);
		
	}	
	
	@RequestMapping(value="/app/modify",method=RequestMethod.POST)
	public void updatePOST(CrAppVO CRAppboard,HttpServletResponse response) throws Exception {

		CRAppboard.setModidate(new Date());

		CrAppService.modify(CRAppboard);	
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		//out.println("window.opener.location.reload();");
		out.println("location.href='detail?cr_app_code="+CRAppboard.getCr_app_code()+"';");
		out.println("</script>");	

	}
	
	@RequestMapping("/app/delete/{cr_app_code}")
	public void delete(@PathVariable String cr_app_code, HttpServletResponse response) throws Exception{
		
		CrAppService.remove(cr_app_code);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("location.href='/board/Coronation/app/list';");
		out.println("</script>");		
	}
	
	@RequestMapping(value="/my/imageUpload",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> imageUpload(HttpServletRequest request,HttpServletResponse response, MultipartFile uploadFile)throws Exception{
		
		
		 // 이미지 업로드할 경로
		String savePath = request.getServletContext().getRealPath("/resources/imageUpload");
		
		File uploadPathFile = new File(savePath);
		
		if(!uploadPathFile.exists()) {
			uploadPathFile.mkdirs();
		}
		
	    
		String fileFormat=uploadFile.getOriginalFilename().substring(uploadFile.getOriginalFilename().lastIndexOf(".")+1);
		String fileName=UUID.randomUUID().toString().replace("-", "")+fileFormat;
		
		uploadFile.transferTo(new File(savePath+File.separator+fileName));
		
	    // 업로드된 경로와 파일명을 통해 이미지의 경로를 생성
		String url = request.getContextPath()+"/resources/imageUpload/" + fileName ;
		
		Map<String,String> dataMap = new HashMap<String,String>();
		dataMap.put("url", url);
		
		System.out.println(dataMap);
		return dataMap;
		
	}
	
	
	
	
	
	
	
	
	

}
