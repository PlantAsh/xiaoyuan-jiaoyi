<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="xiaoyuan_jiaoyi.entity.Article"%>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>森林：物品信息</title>
  <meta name="description" content="这是一个article_information页面">
  <meta name="keywords" content="article_information">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
  <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/image.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/trading.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/article.js" ></script>
</head>

<%
Article ar = (Article) session.getAttribute("article");
String userAccount = (String) session.getAttribute("UserAccount");
String userLevel = (String) session.getAttribute("userLevel");
%>

<body onload="message();getState('<%=ar.getArticleId()%>','<%=ar.getArticleState()%>','<%=ar.getUserAccount()%>','<%=userAccount%>','<%=userLevel%>')">
<%@ include file="../frame/Frame_top.jsp"%>

<div class="am-cf admin-main">
  <%@ include file="../frame/Frame_left.jsp"%>
  
  <%
  if (usin != null) {
  %>
  
  <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">售卖</strong> / <small>Sell</small></div>
      </div>
      
      <hr/>
      
  	  <form action="" name="ifm_top">
      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-3">
          <div class="am-input-group am-input-group-sm">
          <span class="am-input-group-btn">
            <input class="am-btn am-btn-default" type="button" onclick="cancle()" value="返 回" />
            <%if(ar.getUserAccount().equals(usin.getUserAccount()) || userLevel.equals("user_level2")) { %>
            	<input class="am-btn am-btn-default" type="button" onclick="updateArticle()" value="修 改" />
            	<input class="am-btn am-btn-default" type="button" onclick="deleteArticle()" value="删 除" />
            <% }%>
          </span>
          </div>
        </div>
      </div>
   	  </form>
   	  
   	  <hr/>
   	  
   	  <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf">
          <%
          if(ar.getArticlePicture() == null || ar.getArticlePicture().equals("")) {
          %>
          <img class="image-article_information" src="http://omuumyd2p.bkt.clouddn.com/xiaoyuanjiaoyi.png" alt=""/>
          <%
          } else {
          %>
          <img class="image-article_information" src="${pageContext.request.contextPath}/<%=ar.getArticlePicture() %>" alt=""/>
          <%}%>
          <br/>
          <br/>
          <a href="#" onclick="get_allEstimate('<%=ar.getUserAccount() %>')">
          <strong class="am-text-primary am-text-lg"><%=ar.getUserName() %>(<%=ar.getUserAccount() %>)</strong>
          </a>
          <small>于<%=ar.getDate() %>出售</small>
          <%
          	if(!usin.getUserAccount().equals(ar.getUserAccount())) {
          %>
          		<a href="#" id="chat" onclick="chat('<%=ar.getUserAccount() %>',' <%=ar.getUserName() %>')">聊 天</a>
          <%}%>
          <br/>
          <strong><font size="8"><%=ar.getArticleName() %></font></strong>
          <br/>
          <strong><font size="4">售价：<%=ar.getArticlePrice() %></font></strong>
        </div>
      </div>
      
      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
        </div>
        
        <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
          <hr data-am-widget="divider" style="" class="am-divider am-divider-default" />
          <div class="am-form-group">
            <div class="am-u-sm-9">
              <small><font size="5"><%=ar.getArticleDescribe() %></font></small>
            </div>
          </div>
        </div>
      </div>
      
      <hr/>
      
      <form action="" name="Trading">
      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-3">
          <div class="am-input-group am-input-group-sm">
          <span class="am-input-group-btn" id="jiaoyi">
            <%-- <input class="am-btn am-btn-default" type="button" onclick="trading('<%=ar.getArticleId() %>')" value="发起交易" /> --%>
          </span>
          </div>
        </div>
      </div>
   	  </form>
  
  	</div>
  	
  	<br/>
  	
  	<footer class="admin-content-footer">
      <hr>
      <p class="am-padding-left"><%@ include file="../frame/Frame_bottom.jsp"%></p>
    </footer>
  </div>
  <%} %>
  
</div>
<%@ include file="../frame/Frame_chat.jsp"%>
</body>
</html>