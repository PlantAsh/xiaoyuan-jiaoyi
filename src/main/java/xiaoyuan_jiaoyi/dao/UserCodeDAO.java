package xiaoyuan_jiaoyi.dao;

import xiaoyuan_jiaoyi.entity.UserCode;

public interface UserCodeDAO {
    int deleteByPrimaryKey(Integer codeId);

    int insert(UserCode record);

    int insertSelective(UserCode record);

    UserCode selectByPrimaryKey(Integer codeId);

    int updateByPrimaryKeySelective(UserCode record);

    int updateByPrimaryKey(UserCode record);
}