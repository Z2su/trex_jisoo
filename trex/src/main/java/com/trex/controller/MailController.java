package com.trex.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.trex.mail.MimeAttachNotifier;

@Controller
@RequestMapping("/mail")
public class MailController {
	
	@Autowired
	private MimeAttachNotifier notifier;
	
	@RequestMapping(value="/mailForm",method=RequestMethod.GET)
	public void mailGet() throws Exception{
		/*String url="mail/mailForm";
		return url;*/
	}
	
	
	@RequestMapping(value="/send",method=RequestMethod.POST,
					produces="text/plain;charset=utf-8")
	public String mailPost(MailRequest mail,
						   HttpServletRequest request,	
						   HttpServletResponse response,
						   RedirectAttributes rttr ) throws Exception{
		String url="redirect:/mail/success";
		
		MultipartFile attach=mail.getFile();
		String savePath="";
		String uploadPath="";
		//파일유무
		if(attach!=null && !attach.isEmpty()){
			//파일의크기
			if(attach.getSize()<1024*1024*5){
				//파일저장
				uploadPath=request.getSession().getServletContext()
						          .getRealPath("resources/mail_attach");
				File file = new File(uploadPath,attach.getOriginalFilename());
				
				if(!file.exists()) {
					file.mkdirs();
				}
				
				attach.transferTo(file);
				
				savePath=file.getAbsolutePath();
						
			}else{
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out=response.getWriter();			
				out.println("<script>alert('용량초과 입니다!');</script>");
				out.println("<script>history.go(-1);</script>");
				return null;
			}
		}
		
		
		notifier.sendMail(mail, uploadPath);
		
		Map<String,String> resultMap=new HashMap<String,String>();
		resultMap.put("receiver",mail.getReceiver());
		resultMap.put("sender", mail.getSender());
		resultMap.put("title", mail.getTitle());
		resultMap.put("content",mail.getContent());
		resultMap.put("uploadPath", savePath);
		
		rttr.addFlashAttribute("result",resultMap);
		
		return url;
	}
	
	@RequestMapping(value="/success",method=RequestMethod.GET)
	public void mailSuccess() throws Exception{}
}









