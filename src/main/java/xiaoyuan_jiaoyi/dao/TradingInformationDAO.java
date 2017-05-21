package xiaoyuan_jiaoyi.dao;

import java.util.List;

import xiaoyuan_jiaoyi.entity.TradingInformation;

public interface TradingInformationDAO {
    List<TradingInformation> trading_ifm(String userAccount);
    
    List<TradingInformation> get_allEstimate(String otherAccount);

    int addTrading(TradingInformation record);

    TradingInformation getState(int articleId, String userAccount);

    int updateTrading_ifm(TradingInformation record);
    
    int updateTrading_other(TradingInformation record);
    
    TradingInformation getEstimate(int tradingId);
    
    int update_Estimate(TradingInformation record);
}