package xiaoyuan_jiaoyi.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import xiaoyuan_jiaoyi.dao.UserDAO;
import xiaoyuan_jiaoyi.dao.UserInformationDAO;
import xiaoyuan_jiaoyi.entity.User;
import xiaoyuan_jiaoyi.entity.UserInformation;
import xiaoyuan_jiaoyi.service.UserService;

@Service("userService")
public class UserServiceimpl implements UserService {
	@Resource
	private UserDAO userDAO;
	
	@Resource
	private UserInformationDAO userInformationDAO;

	public String addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		try {
			User us = new User();
			us = userDAO.loadUser(user.getUserAccount());
			if (us == null) {
				userDAO.addUser(user);
				UserInformation usin = new UserInformation();
				usin.setUserAccount(user.getUserAccount());
				usin.setUserName(user.getUserAccount());
				userInformationDAO.addSelective(usin);
				return "success";
			} else {
				return "账号已存在";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw e;
		}
	}

	public User loadUser(String userAccount) throws Exception {
		// TODO Auto-generated method stub
		try {
			User us = new User();
			us = userDAO.loadUser(userAccount);
			return us;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw e;
		}
	}

	public String updatePassword(User user) throws Exception {
		// TODO Auto-generated method stub
		try {
			int i = userDAO.updatePassword(user);
			if(i == 0) {
				return "服务器错误";
			}
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw e;
		}
	}

}
