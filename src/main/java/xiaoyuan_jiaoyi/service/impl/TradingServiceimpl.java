package xiaoyuan_jiaoyi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import xiaoyuan_jiaoyi.dao.ArticleDAO;
import xiaoyuan_jiaoyi.dao.TradingInformationDAO;
import xiaoyuan_jiaoyi.entity.TradingInformation;
import xiaoyuan_jiaoyi.service.TradingService;

@Service("tradingService")
public class TradingServiceimpl implements TradingService {

	@Resource
	private TradingInformationDAO tradingDAO;
	
	@Resource
	private ArticleDAO articleDAO;
	
	public String addTrading(TradingInformation trading) throws Exception {
		// TODO Auto-generated method stub
		try {
			int i = tradingDAO.addTrading(trading);
			if(i == 0) {
				return "服务器错误";
			} else {
				return "success";
			}
		} catch(Exception e) {
			throw e;
		}
	}

	public String getState(int articleId, String userAccount) throws Exception {
		// TODO Auto-generated method stub
		try {
			TradingInformation tr = new TradingInformation();
			tr = tradingDAO.getState(articleId, userAccount);
			if (tr == null) {
				return "未交易";
			}
			String tradingState = tr.getTradingState();
			return tradingState;
		} catch(Exception e) {
			throw e;
		}
	}

	public List<TradingInformation> trading_ifm(String userAccount) throws Exception {
		// TODO Auto-generated method stub
		try {
			List<TradingInformation> tra = null;
			tra = tradingDAO.trading_ifm(userAccount);
			return tra;
		} catch(Exception e) {
			throw e;
		}
	}

	public String update_trd(TradingInformation trading) throws Exception {
		// TODO Auto-generated method stub
		try {
			if(trading.getTradingState().equals("正在交易")) {
				int i = tradingDAO.updateTrading_ifm(trading);
				if(i == 0) {
					return "服务器错误";
				} else {
					tradingDAO.updateTrading_other(trading);
					articleDAO.updateState(trading.getArticleId());
				}
				return "success";
			} else {
				int i = tradingDAO.updateTrading_ifm(trading);
				if(i == 0) {
					return "服务器错误";
				}
				return "success";
			}
		} catch(Exception e) {
			throw e;
		}
	}

	public TradingInformation getEstimate(int tradingId) throws Exception {
		// TODO Auto-generated method stub
		try {
			TradingInformation tr = new TradingInformation();
			tr = tradingDAO.getEstimate(tradingId);
			return tr;
		} catch(Exception e) {
			throw e;
		}
	}

	public String update_Estimate(TradingInformation trading) throws Exception {
		// TODO Auto-generated method stub
		try {
			int i = tradingDAO.update_Estimate(trading);
			if(i == 0) {
				return "服务器错误";
			}
			return "success";
		} catch(Exception e) {
			throw e;
		}
	}

	public List<TradingInformation> get_allEstimate(String otherAccount) throws Exception {
		// TODO Auto-generated method stub
		try {
			List<TradingInformation> tr = null;
			tr = tradingDAO.get_allEstimate(otherAccount);
			return tr;
		} catch(Exception e) {
			throw e;
		}
	}

}
