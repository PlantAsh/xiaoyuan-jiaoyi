package xiaoyuan_jiaoyi.dao;

import xiaoyuan_jiaoyi.entity.User;

public interface UserDAO {

    int addUser(User record);

    User loadUser(String userAccount);
    
    int updatePassword(User record);
    
}