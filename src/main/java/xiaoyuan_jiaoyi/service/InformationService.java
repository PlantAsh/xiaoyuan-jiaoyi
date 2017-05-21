package xiaoyuan_jiaoyi.service;

import java.util.List;

import xiaoyuan_jiaoyi.entity.InformationCode;
import xiaoyuan_jiaoyi.entity.UserInformation;

public interface InformationService {
	public UserInformation loadInformation(String userAccount) throws Exception;
	
	public List<InformationCode> loadByType(String codeType) throws Exception;
	
	public String updateInformation(UserInformation usin, String userName) throws Exception;
}
