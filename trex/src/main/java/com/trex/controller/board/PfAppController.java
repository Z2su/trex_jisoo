package com.trex.controller.board;

import java.io.File;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.trex.dto.PfAppVO;
import com.trex.service.PfAppService;

@Controller
@RequestMapping("/board/Coronation")
public class PfAppController {
	
	@Autowired
	private PfAppService PfAppService;
	
	@ModelAttribute("submenulist")
	public List<String[]> submenuModel() {
		List<String[]> submenuList = new ArrayList<String[]> ();
		
		submenuList.add(new String[] {"공연등록","/board/Coronation/papp/list"});
		
		return submenuList;
		
	}
	
	@RequestMapping(value="/papp/list")
	public ModelAndView listGET(ModelAndView modelnView) {
		
		String url="board/Coronation/papp/list";
		List<PfAppVO> PFAppList = null;
		
			try {
				System.out.println("PFAppList====" + PFAppList);
				PFAppList = PfAppService.getBoardList();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		modelnView.addObject("PFAppList", PFAppList);
		modelnView.setViewName(url);
		
		return modelnView;
	}
	
	@RequestMapping(value="/papp/detail/{pf_app_code}",method=RequestMethod.GET)
	public ModelAndView detailGET(@PathVariable String pf_app_code, ModelAndView modelnView) {
		String url = "board/Coronation/papp/detail";
		
		PfAppVO PFAppBoard = null;
		
		try {
			PFAppBoard = PfAppService.readBoard(pf_app_code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("PFAppBoard~~~"+PFAppBoard);
		modelnView.addObject("PFAppBoard",PFAppBoard);
		modelnView.setViewName(url);
		
		return modelnView;
	}
	
	@RequestMapping(value="/papp/regist", method=RequestMethod.GET)
	public String registGET() {
		String url ="board/Coronation/papp/regist";
		return url;
	}
	
	@RequestMapping(value="/papp/regist", method=RequestMethod.POST)
	public String registPOST(PfAppVO PFAppBoard, String writer, HttpServletResponse response) throws Exception {
		String url ="redirect:list";
		System.out.println("등록><><><><><><><><>");
		PfAppService.write(PFAppBoard);
		return url;
	
	}
	
	@RequestMapping("/papp/delete/{pf_app_code}")
	public void delete(@PathVariable String pf_app_code, HttpServletResponse response) throws Exception{
		
		PfAppService.remove(pf_app_code);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("location.href='/board/Coronation/papp/list';");
		out.println("</script>");		
	}
	
	@RequestMapping(value="/my/app/imageUpload",method=RequestMethod.POST)
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
