package com.trex.controller.board;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.trex.dto.CoronationVO;
import com.trex.dto.PerformGuidBoardVO;
import com.trex.service.CoronationService;

@Controller
@RequestMapping("/board/Coronation")
public class CoronationController {
	
	@Autowired
	private CoronationService CoronationService;
	
	@ModelAttribute("submenutitle")
	public String submenuTitle() {
		return "대관안내";
	}
	
	@ModelAttribute("submenulist")
	public List<String[]> submenuModel() {
		List<String[]> submenuList = new ArrayList<String[]> ();
		
		submenuList.add(new String[] {"대관","/board/Coronation/list"});
		
		return submenuList;
		
	}
	
	@RequestMapping(value="list")
	public ModelAndView listGET(ModelAndView modelnView) {
		
		String url="board/Coronation/list";
		List<CoronationVO> CRGBoardList = null;
		
			try {
				CRGBoardList = CoronationService.getBoardList();
				System.out.println("CRG>>>>>"+CRGBoardList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		modelnView.addObject("CRGBoardList", CRGBoardList);
		modelnView.setViewName(url);
		
		return modelnView;
	}
	
	@RequestMapping(value="/detail/{crg_code}",method=RequestMethod.GET)
	public ModelAndView detailGET(@PathVariable String crg_code, ModelAndView modelnView) {
		String url = "board/Coronation/detail";
		
		CoronationVO CRGBoard = null;
		
		try {
			CRGBoard = CoronationService.readBoard(crg_code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelnView.addObject("CRGBoard",CRGBoard);
		modelnView.setViewName(url);
		
		return modelnView;
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public String registGET() {
		String url ="board/Coronation/regist";
		return url;
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public void registPOST(String crg_code, String writer, HttpServletResponse response) throws Exception {
		CoronationVO CRGBoard = new CoronationVO();
		CRGBoard.setWriter(writer);
		
		CRGBoard.setHall_code("HALL0001");
			
		CoronationService.write(CRGBoard);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();window.close();");
		out.println("</script>");	
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
