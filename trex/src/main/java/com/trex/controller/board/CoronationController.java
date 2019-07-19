package com.trex.controller.board;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.trex.dto.CoronationVO;
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
	public String registPOST(CoronationVO CRGBoard, String writer, HttpServletResponse response) throws Exception {
		String url ="redirect:list";
		System.out.println("등록><><><><><><><><>");
		CoronationService.write(CRGBoard);
		return url;
	
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public void modifyForm(String crg_code,Model model) throws Exception{
		
		CoronationVO board = CoronationService.getBoardForModify(crg_code);
		model.addAttribute("CRG",board);
		
	}	
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public void updatePOST(CoronationVO CRGboard,HttpServletResponse response) throws Exception {

		CRGboard.setModiDate(new Date());

		CoronationService.modify(CRGboard);	
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();");
		out.println("location.href='detail?crg_code="+CRGboard.getCrg_code()+"';");
		out.println("</script>");	

	}
	
	@RequestMapping("/delete/{crg_code}")
	public void delete(@PathVariable String crg_code, HttpServletResponse response) throws Exception{
		
		CoronationService.remove(crg_code);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("location.href='/board/Coronation/list';");
		out.println("</script>");		
	}
	
	
	
	
	
	
	
	
	
	
	

}
