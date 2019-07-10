package com.trex.controller.board;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

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

import com.trex.dto.PerformGuidBoardVO;
import com.trex.dto.PerformScheduleVO;
import com.trex.dto.PerformVO;
import com.trex.service.PerformGuidBoardService;
import com.trex.service.PerformScheduleService;
import com.trex.service.PerformService;

@Controller
@RequestMapping("/board/perform")
public class PerformController {
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
	public void registPOST(String pf_code, String writer, HttpServletResponse response) throws Exception {
		PerformGuidBoardVO PFGBoard = new PerformGuidBoardVO();
		PFGBoard.setWriter(writer);
		//데이터넣기
		PFGBoard.setHall_code("HALL0001");
		PFGBoard.setTicket("ticket");
		PFGBoard.setTro("TRO0001");
		/*
		PFGBoardService.getPF(pf_code).toPFGBoard(PFGBoard);
		PFGBoardService.getPFSH(pf_code).toPFGBoard(PFGBoard);*/
		
		System.out.println("PFGBoard>>>>"+PFGBoard);
		PFGBoardService.write(PFGBoard);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();window.close();");
		out.println("</script>");	
		
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
	@ResponseBody
	@RequestMapping(value="pfcode", method=RequestMethod.POST)
	public List<PerformScheduleVO> pfcodesearch(@RequestBody String pf_code){
		
	
		System.out.println("ajax>>>>"+pf_code);
		List<PerformScheduleVO> dataList=null;
		try {
			dataList = PFSHService.getPFSH(pf_code);
			System.out.println("dataList .>> " + dataList);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataList;
		
	}
	

}
