package com.trex.controller.board;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.aop.interceptor.PerformanceMonitorInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;
import com.trex.dto.PerformGuidBoardVO;
import com.trex.dto.PerformScheduleVO;
import com.trex.dto.PerformVO;
import com.trex.service.PerformGuidBoardService;
import com.trex.service.PerformScheduleService;
import com.trex.service.PerformService;

@Controller
@RequestMapping("/board/perform")
public class PerformBoardController {
	@Autowired
	private PerformGuidBoardService PFGBoardService;
	
	@Autowired
	private PerformService PFService;
	
	@Autowired
	private PerformScheduleService PFSHService;

	
	@ModelAttribute("submenuTitle")
	public String submenuTitle() {
		return "공연안내";
	}
	@ModelAttribute("submenuList")
	public List<String[]> submenuModel(){
		List<String[]> submenuList = new ArrayList<String[]> ();
		
		submenuList.add(new String[] {"공연안내","/board/perform/list"});
		submenuList.add(new String[] {"공연예매안내","rese"});
		submenuList.add(new String[] {"기타공연소식","gg"});
		submenuList.add(new String[] {"공연정보신청","gg"});
		
		return submenuList;
	}
	@RequestMapping(value="/list")
	public ModelAndView listGET(ModelAndView modelnView) {
		String url="board/perform/list";
		List<PerformGuidBoardVO> PFGBoardList = null;
		try {

			PFGBoardList = PFGBoardService.getBoardList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelnView.addObject("PFGBoardList", PFGBoardList);
		modelnView.setViewName(url);
		
		return modelnView;
		
	}
	@RequestMapping(value="/detail/{pfg_code}",method=RequestMethod.GET)
	public ModelAndView detailGET(@PathVariable String pfg_code, ModelAndView modelnView) {
		String url = "/board/perform/detail";
		
		PerformGuidBoardVO PFGBoard = null;
		
		try {
			PFGBoard = PFGBoardService.getBoard(pfg_code);
			System.out.println("detail>>>>"+PFGBoard);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelnView.addObject("PFGBoard",PFGBoard);
		modelnView.setViewName(url);
		
		return modelnView;
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public ModelAndView registGET(ModelAndView modelnView) {
		String url ="/board/perform/regist";
		List<PerformVO> PFList=null;
		try {
			PFList = PFService.getPFList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		modelnView.addObject("PFList",PFList);
		modelnView.setViewName(url);
		return modelnView;
	}
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public String registPOST(PerformGuidBoardVO PFGBoard, HttpServletResponse response) {
		/*PerformGuidBoardVO PFGBoard = new PerformGuidBoardVO();*/
		String url = "redirect:list";
		//데이터넣기
/*
		PFGBoard.setRundate(rundate);
		PFGBoard.setStarttime(starttime);
		
		*/
		/*
		PFGBoardService.getPF(pf_code).toPFGBoard(PFGBoard);
		PFGBoardService.getPFSH(pf_code).toPFGBoard(PFGBoard);*/
		/*PFGBoard.setWriter(writer);*/
		try {
			PFGBoardService.write(PFGBoard);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return url;
		
	}

	@RequestMapping("/delete/{pfg_code}")
	public void delete(@PathVariable String pfg_code, HttpServletResponse response) throws Exception{
		
		PFGBoardService.remove(pfg_code);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("location.href='/board/perform/list';");
		out.println("</script>");		
	}
/*	@ResponseBody
	@RequestMapping(value="pfcode", method=RequestMethod.POST)
	public List<PerformScheduleVO> pfcodesearch(@RequestBody String pf_code){
		
	
		List<PerformScheduleVO> dataList=null;
		try {
			dataList = PFSHService.getPFSH(pf_code);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataList;
		
	}*/
	
	@ResponseBody
	@RequestMapping(value="pfcode", method=RequestMethod.POST)
	public List<PerformGuidBoardVO> pfcodesearch(@RequestBody String pf_code){
		
	
		List<PerformGuidBoardVO> dataList=null;
		try {
			dataList = PFGBoardService.getBoardListByPF(pf_code);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataList;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="pfsh", method=RequestMethod.POST)
	public PerformGuidBoardVO pfshsearch(@RequestBody String pfsh_code){
		
		
		
		PerformGuidBoardVO PFGBoard=null;
		System.out.println("starttime???"+pfsh_code);
		
		try {
			PFGBoard = PFGBoardService.getBoardByPFSH(pfsh_code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return PFGBoard;
	}
	
		
	

}
