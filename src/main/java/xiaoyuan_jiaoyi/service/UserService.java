package xiaoyuan_jiaoyi.service;

import xiaoyuan_jiaoyi.entity.User;

public interface UserService {
	public String addUser(User user) throws Exception;
	
	public User loadUser(String userAccount) throws Exception;
	
	public String updatePassword(User user) throws Exception;

}
