package com.trex.controller.board;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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

import com.trex.dto.HallVO;
import com.trex.service.HallService;

@Controller
@RequestMapping("/board/Coronation")
public class HallController {
	
	@Autowired
	private HallService HallService;
	
	@ModelAttribute("submenulist")
	public List<String[]> submenuModel() {
		List<String[]> submenuList = new ArrayList<String[]> ();
		
		submenuList.add(new String[] {"대관시설","/board/Coronation/hall/list"});
		
		return submenuList;
		
	}
	
	@RequestMapping(value="/hall/list")
	public ModelAndView listGET(ModelAndView modelnView) {
		
		String url="board/Coronation/hall/list";
		List<HallVO> HallList = null;
		
			try {
				System.out.println("Halllist~~~"+HallList);
				HallList = HallService.getBoardList();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		modelnView.addObject("HallList", HallList);
		modelnView.setViewName(url);
		
		return modelnView;
	}
	
	@RequestMapping(value="/hall/detail/{hall_code}",method=RequestMethod.GET)
	public ModelAndView detailGET(@PathVariable String hall_code, ModelAndView modelnView) {
		String url = "board/Coronation/hall/detail";
		
		HallVO Hall = null;
		
		try {
			Hall = HallService.readBoard(hall_code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Hall~~~"+Hall);
		modelnView.addObject("Hall",Hall);
		modelnView.setViewName(url);
		
		return modelnView;
	}
	
	@RequestMapping(value="/hall/regist", method=RequestMethod.GET)
	public String registGET() {
		String url ="board/Coronation/hall/regist";
		return url;
	}
	
	@RequestMapping(value="/hall/regist", method=RequestMethod.POST)
	public String registPOST(HallVO Hall, String writer, HttpServletResponse response) throws Exception {
		String url ="redirect:hall/list";
		System.out.println("등록><><><><><><><><>");
		HallService.write(Hall);
		return url;
	
	}
	
	@RequestMapping(value="/hall/modify",method=RequestMethod.GET)
	public void modifyForm(String hall_code,Model model) throws Exception{
		
		HallVO Hall = HallService.getBoardForModify(hall_code);
		model.addAttribute("Hall",Hall);
		
	}	
	
	@RequestMapping(value="/hall/modify",method=RequestMethod.POST)
	public void updatePOST(HallVO Hall,HttpServletResponse response) throws Exception {


		HallService.modify(Hall);	
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		//out.println("window.opener.location.reload();");
		out.println("location.href='detail?hall_code="+Hall.getHall_code()+"';");
		out.println("</script>");	

	}
	
	@RequestMapping("/hall/delete/{hall_code}")
	public void delete(@PathVariable String hall_code, HttpServletResponse response) throws Exception{
		
		HallService.remove(hall_code);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("location.href='/board/Coronation/hall/list';");
		out.println("</script>");		
	}
	
	
	
	
	
	
	
}

