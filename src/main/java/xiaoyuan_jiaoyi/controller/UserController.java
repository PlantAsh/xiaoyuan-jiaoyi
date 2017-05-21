package xiaoyuan_jiaoyi.controller;

import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import xiaoyuan_jiaoyi.entity.InformationCode;
import xiaoyuan_jiaoyi.entity.User;
import xiaoyuan_jiaoyi.entity.UserInformation;
import xiaoyuan_jiaoyi.service.InformationService;
import xiaoyuan_jiaoyi.service.UserService;

@Controller
@RequestMapping("/user")
@SessionAttributes({"UserAccount","userInformation","userLevel","inFloor"})
public class UserController {
	@Resource
	private UserService userService;
	@Resource
	private InformationService informationService;
	
	@RequestMapping(value = "/login")
	public String Login(HttpServletResponse response, ModelMap model, User user) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		
		try {
			User us = userService.loadUser(user.getUserAccount());
			
			if(us == null) {
				out.print("<script>alert('账号或密码错误')</script>");
				out.flush();
				return "user/login";
			} else if(!us.getUserPassword().equals(user.getUserPassword())) {
				out.print("<script>alert('账号或密码错误')</script>");
				out.flush();
				return "user/login";
			} else {
				String sendUser = "";
				model.addAttribute("sendUser", sendUser);
				List<InformationCode> inFloor = null;
				inFloor = informationService.loadByType("floor");
				model.addAttribute("inFloor", inFloor);
				String level = "user_level" + us.getUserLevel();
				model.addAttribute("UserAccount", us.getUserAccount());
				UserInformation usin = informationService.loadInformation(us.getUserAccount());
				model.addAttribute("userInformation", usin);
				model.addAttribute("userLevel", level);
				return "user/" + level;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "user/login";
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String Regist(HttpServletResponse response, User userBean) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		
		try {
			userBean.setUserLevel("1");
			String result = userService.addUser(userBean);
			
			if (!result.equals("success")) {
				out.print("<script>alert('" + result + "')</script>");
				out.flush();
				return "user/regist";
			}else {
				return "user/login";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "user/regist";
		}
	}
	
	@RequestMapping(value = "/cancel")
	public String Cancel(HttpServletRequest request) throws Exception {
		try {
			 Enumeration em = request.getSession().getAttributeNames();
			 while(em.hasMoreElements()){   
				 request.getSession().removeAttribute(em.nextElement().toString());				  
			 }
			return "user/login";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "user/login";
		}
	}
	
	@RequestMapping(value = "/modifyPassword", method = RequestMethod.POST)
	public String modifyPassword(HttpSession session, HttpServletResponse response, User user, String oldPassword) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		
		try {
			String level = (String) session.getAttribute("userLevel");
			String userAccount = (String) session.getAttribute("UserAccount");
			User us = userService.loadUser(userAccount);
			if(!us.getUserPassword().equals(oldPassword)) {
				out.print("<script>alert('原密码错误')</script>");
				out.flush();
				return "user/" + level;
			} else {
				user.setUserAccount(userAccount);
				String result = userService.updatePassword(user);
				if (!result.equals("success")) {
					out.print("<script>alert('" + result + "')</script>");
					out.flush();
				}
				return "user/" + level;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "user/login";
		}
	}

}
