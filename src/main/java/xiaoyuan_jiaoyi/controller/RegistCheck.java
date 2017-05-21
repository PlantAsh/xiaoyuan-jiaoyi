package xiaoyuan_jiaoyi.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.sf.json.JSONObject;
import xiaoyuan_jiaoyi.entity.User;
import xiaoyuan_jiaoyi.service.UserService;

@Controller
@RequestMapping("/registCheck")
public class RegistCheck {
	@Resource
	private UserService userService;
	
	@RequestMapping(value = "/checkUserAccount", method = RequestMethod.POST)
	public String checkUserName(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userAccount=(String)request.getParameter("userAccount");			
		//检验用户名是否存在
		User user=new User();
		user.setUserAccount(userAccount);
		User us = userService.loadUser(user.getUserAccount());
	    //用户名是否存在的标志
	    boolean flag=true;
	    if(us == null){
	    	flag=false;
	    }		
		//将数据转换成json
		Map<String,Object> map = new HashMap<String,Object>();  
		map.put("flag", flag);	  
		String json = JSONObject.fromObject(map).toString(); 		
		//将数据返回
		response.setCharacterEncoding("UTF-8");
		response.flushBuffer();
		response.getWriter().write(json);
		response.getWriter().flush();  
		response.getWriter().close();
		return null;
	}

}
