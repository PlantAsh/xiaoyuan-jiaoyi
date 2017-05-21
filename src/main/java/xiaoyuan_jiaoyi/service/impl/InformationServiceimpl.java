package xiaoyuan_jiaoyi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import xiaoyuan_jiaoyi.dao.ArticleDAO;
import xiaoyuan_jiaoyi.dao.InformationCodeDAO;
import xiaoyuan_jiaoyi.dao.UserInformationDAO;
import xiaoyuan_jiaoyi.entity.Article;
import xiaoyuan_jiaoyi.entity.InformationCode;
import xiaoyuan_jiaoyi.entity.UserInformation;
import xiaoyuan_jiaoyi.service.InformationService;

@Service("informationService")
public class InformationServiceimpl implements InformationService {
	@Resource
	private UserInformationDAO userInformationDAO;
	@Resource
	private InformationCodeDAO informationCodeDAO;
	@Resource
	private ArticleDAO articleDAO;

	public UserInformation loadInformation(String userAccount) throws Exception {
		// TODO Auto-generated method stub
		try {
			UserInformation us = new UserInformation();
			us = userInformationDAO.loadInformation(userAccount);
			return us;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw e;
		}
	}

	public List<InformationCode> loadByType(String codeType) throws Exception {
		// TODO Auto-generated method stub
		try {
			List<InformationCode> incd = null;
			incd = informationCodeDAO.loadByType(codeType);
			return incd;
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}
	
	public String updateInformation(UserInformation usin, String userName) throws Exception {
		try {
			if(!usin.getUserName().equals(userName)) {
				Article ar = new Article();
				ar.setUserAccount(usin.getUserAccount());
				ar.setUserName(usin.getUserName());
				int j = articleDAO.updateUserName(ar);
				if(j == 0) {
					return "数据库错误";
				}
			}
			int i = userInformationDAO.updateInformationSelective(usin);
			if(i == 0) {
				return "数据库错误";
			}
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw e;
		}
	}

}
