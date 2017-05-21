package xiaoyuan_jiaoyi.dao;

import xiaoyuan_jiaoyi.entity.UserInformation;

public interface UserInformationDAO {

    int addSelective(UserInformation record);

    UserInformation loadInformation(String userAccount);

    int updateInformationSelective(UserInformation record);
    
}