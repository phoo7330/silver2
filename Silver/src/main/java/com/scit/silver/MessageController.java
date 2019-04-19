package com.scit.silver;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.silver.dao.MessageDAO;
import com.scit.silver.vo.message;

@Controller
public class MessageController {
	
	@Autowired
	MessageDAO mdao;
	
	@RequestMapping(value = "/insertMessage",  method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody int insertMessage(String ms, String sender, HttpSession session, Model model) {
		System.out.println("Message"+ms);
		
		message message = new message();
		message.setMs_title("제목");
		message.setMs_content(ms);
		message.setUserid((String)session.getAttribute("loginId"));
		message.setMs_Sender(sender);
		System.out.println(message.toString());
		
		int result = mdao.insertMessage(message);
		model.addAttribute("Message", sender);
		return result;

	}
	
	@RequestMapping(value = "/SelectSendMessageBox", method = { RequestMethod.POST })
	public @ResponseBody ArrayList<message> selectSendMessageBox(HttpSession session) {
		ArrayList<message> result = null;
		String loginId = (String) session.getAttribute("loginId");
		result = mdao.selectMesageSender(loginId);
		
		System.out.println("[보낸 쪽지 목록]: " + result);
		
		return result;
	}
	
	@RequestMapping(value = "/SelectReceiveMessageBox", method = { RequestMethod.POST })
	public @ResponseBody ArrayList<message> selectReceiveMessageBox(HttpSession session) {
		ArrayList<message> result = null;
		String loginId = (String) session.getAttribute("loginId");
		result = mdao.selectMesageReceiver(loginId);
		
		System.out.println("[받은 쪽지 목록]: " + result);
		
		return result;
	}
	
}
