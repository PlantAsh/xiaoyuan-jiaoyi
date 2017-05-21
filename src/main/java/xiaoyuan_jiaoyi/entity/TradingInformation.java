package xiaoyuan_jiaoyi.entity;

import java.util.Date;

public class TradingInformation {
    private Integer tradingId;

    private Integer articleId;

    private String userAccount;

    private String tradingAccount;

    private String tradingPrice;

    private String tradingDate;

    private String tradingState;

    private String buyEstimate;

    private String sellEstimate;
    
    private String articleName;
    
    private String articleFloor;
    
    private String userName;
    
    private String tradingName;

    public Integer getTradingId() {
        return tradingId;
    }

    public void setTradingId(Integer tradingId) {
        this.tradingId = tradingId;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount == null ? null : userAccount.trim();
    }

    public String getTradingAccount() {
        return tradingAccount;
    }

    public void setTradingAccount(String tradingAccount) {
        this.tradingAccount = tradingAccount == null ? null : tradingAccount.trim();
    }

    public String getTradingPrice() {
        return tradingPrice;
    }

    public void setTradingPrice(String tradingPrice) {
        this.tradingPrice = tradingPrice;
    }

    public String getTradingDate() {
        return tradingDate;
    }

    public void setTradingDate(String tradingDate) {
        this.tradingDate = tradingDate;
    }

    public String getTradingState() {
        return tradingState;
    }

    public void setTradingState(String tradingState) {
        this.tradingState = tradingState == null ? null : tradingState.trim();
    }

    public String getBuyEstimate() {
        return buyEstimate;
    }

    public void setBuyEstimate(String buyEstimate) {
        this.buyEstimate = buyEstimate == null ? null : buyEstimate.trim();
    }

    public String getSellEstimate() {
        return sellEstimate;
    }

    public void setSellEstimate(String sellEstimate) {
        this.sellEstimate = sellEstimate == null ? null : sellEstimate.trim();
    }
    
    public String getArticleName() {
        return articleName;
    }

    public void setArticleName(String articleName) {
        this.articleName = articleName == null ? null : articleName.trim();
    }
    
    public String getArticleFloor() {
        return articleFloor;
    }

    public void setArticleFloor(String articleFloor) {
        this.articleFloor = articleFloor == null ? null : articleFloor.trim();
    }
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    public String getTradingName() {
        return tradingName;
    }

    public void setTradingName(String tradingName) {
        this.tradingName = tradingName;
    }
}