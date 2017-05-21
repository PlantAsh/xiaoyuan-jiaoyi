package xiaoyuan_jiaoyi.dao;

import java.util.List;

import xiaoyuan_jiaoyi.entity.InformationCode;

public interface InformationCodeDAO {

    List<InformationCode> loadByType(String codeType);
    
}