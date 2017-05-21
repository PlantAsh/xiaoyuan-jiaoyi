package xiaoyuan_jiaoyi.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import net.sf.json.JSONObject;
import xiaoyuan_jiaoyi.dao.ArticleDAO;
import xiaoyuan_jiaoyi.entity.Message;
import xiaoyuan_jiaoyi.service.ArticleService;
import xiaoyuan_jiaoyi.service.ChatService;

@Controller
@RequestMapping("/chat")
@SessionAttributes({ "message", "sendUser", "messageUser" })
public class ChatController {
	
	@Resource
	private ChatService chatService;
	
	@RequestMapping(value = "/getMessages", method = RequestMethod.POST)
	public String getMessages(HttpSession session, HttpServletResponse response, String sendUser, ModelMap model) throws Exception {
		try {
			String acceptUser = (String) session.getAttribute("UserAccount");
			List<Message> message2 = (List<Message>) session.getAttribute("message");
			String sendUser2 = (String) session.getAttribute("sendUser");
			List<Message> message = null;
			message = chatService.getMessage(sendUser, acceptUser);
			boolean flag = false;
			if(message.size() >= 0) {
				flag = true;
			}
			if(message2 == null || sendUser2.equals("")) {
				model.addAttribute("message", message);
				model.addAttribute("sendUser", sendUser);
			} else if(message2.size() == message.size() && sendUser2.equals(sendUser)) {
				flag = false;
			} else {
				model.addAttribute("message", message);
				model.addAttribute("sendUser", sendUser);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("flag", flag);
			map.put("message", message);
			map.put("sendUser", sendUser);
			map.put("acceptUser", acceptUser);
			String json = JSONObject.fromObject(map).toString();
			response.setCharacterEncoding("UTF-8");
	        response.flushBuffer();
	        response.getWriter().write(json);
	        response.getWriter().flush();
	        response.getWriter().close();
			return null;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value = "/getUser", method = RequestMethod.POST)
	public String getUser(HttpSession session, HttpServletResponse response, ModelMap model, String name) throws Exception {
		try {
			String acceptUser = (String) session.getAttribute("UserAccount");
			List<Message> messageUser2 = (List<Message>) session.getAttribute("messageUser");
			List<Message> messageUser = null;
			messageUser = chatService.getUser(acceptUser);
			boolean flag = false;
			boolean flag2 = false;
			if(messageUser.size() > 0) {
				flag2 = true;
				flag = true;
			}
			if(messageUser2 == null) {
				model.addAttribute("messageUser", messageUser);
			} else if(messageUser.size() == messageUser2.size() && name.equals("true")) {
				flag = false;
			} else {
				model.addAttribute("messageUser", messageUser);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("flag", flag);
			map.put("flag2", flag2);
			map.put("acceptUser", acceptUser);
			map.put("messageUser", messageUser);
			String json = JSONObject.fromObject(map).toString();
			response.setCharacterEncoding("UTF-8");
	        response.flushBuffer();
	        response.getWriter().write(json);
	        response.getWriter().flush();
	        response.getWriter().close();
			return null;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value = "/closeMessages", method = RequestMethod.POST)
	public String closeMessages(HttpSession session, HttpServletResponse response, ModelMap model) throws Exception {
		try {
			String sendUser = "";
			model.addAttribute("sendUser", sendUser);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("flag", true);
			String json = JSONObject.fromObject(map).toString();
			response.setCharacterEncoding("UTF-8");
	        response.flushBuffer();
	        response.getWriter().write(json);
	        response.getWriter().flush();
	        response.getWriter().close();
			return null;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value = "/sendMessage", method = RequestMethod.POST)
	public String sendMessage(HttpSession session, HttpServletResponse response, ModelMap model, String text) throws Exception {
		try {
			String acceptUser = (String) session.getAttribute("UserAccount");
			String sendUser = (String) session.getAttribute("sendUser");
			Message message = new Message();
			message.setMessageSend(acceptUser);
			message.setMessageAccept(sendUser);
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			message.setMessageDate(sdf.format(date));
			message.setMessageState("未读");
			text = text.replace("\r\n", "<br/>");
			message.setMessage(text);
			String result = chatService.addMessage(message);
			boolean flag = false;
			if(result.equals("success")) {
				flag = true;
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("flag", flag);
			String json = JSONObject.fromObject(map).toString();
			response.setCharacterEncoding("UTF-8");
	        response.flushBuffer();
	        response.getWriter().write(json);
	        response.getWriter().flush();
	        response.getWriter().close();
			return null;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value = "/getCount", method = RequestMethod.POST)
	public String getCount(HttpSession session, HttpServletResponse response) throws Exception {
		try {
			String acceptUser = (String) session.getAttribute("UserAccount");
			int count = chatService.getCount(acceptUser);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("count", count);
			String json = JSONObject.fromObject(map).toString();
			response.setCharacterEncoding("UTF-8");
	        response.flushBuffer();
	        response.getWriter().write(json);
	        response.getWriter().flush();
	        response.getWriter().close();
			return null;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
