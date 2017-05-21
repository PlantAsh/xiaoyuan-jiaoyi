<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>森林：用户界面</title>
  <meta name="description" content="这是一个 user 页面">
  <meta name="keywords" content="user">
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
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/trading.js"></script>
</head>

<body onload="message();trading_ifm_start()">
<%@ include file="../frame/Frame_top.jsp"%>

<div class="am-cf admin-main">
  <%@ include file="../frame/Frame_left.jsp"%>

  <div class="admin-content">
    <div class="admin-content-body">
    
      <div data-am-widget="intro" class="am-intro am-cf am-intro-default">

        <div class="am-g am-intro-bd">
          <div class="am-intro-left am-u-sm-5">
        	 <img src="http://omuumyd2p.bkt.clouddn.com/xiaoyuan-jiaoyi.jpg" class="am-img-thumbnail am-circle" height="300" width="300"/>
          </div>
          <%if (usin != null) { %>
          <div class="am-intro-right am-u-sm-7">
          <h2><%=usin.getUserName() %></h2>
          
          <% if(usin.getUserBirthday() == null) {
        	     usin.setUserBirthday("");
             }
          %>
          <p>生日：<%=usin.getUserBirthday() %></p>
          
          <% if(usin.getUserFloor() == null) {
            	 usin.setUserFloor("");
             }
          %>
          <p>楼：<%=usin.getUserFloor() %></p>
          
          <% if(usin.getUserMajor() == null) {
            	 usin.setUserMajor("");
             }
          %>
          <p>专业：<%=usin.getUserMajor() %></p>
          
          <% if(usin.getUserEmail() == null) {
            	 usin.setUserEmail("");
             }
          %>
          <p>邮箱：<%=usin.getUserEmail() %></p>
          
          <% if(usin.getUserTelephone() == null) {
            	 usin.setUserTelephone("");
             }
          %>
          <p>手机：<%=usin.getUserTelephone() %></p>
          </div>
          <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
          <hr data-am-widget="divider" style="" class="am-divider am-divider-default" />
             <h3>简介</h3>
             <% 
             String userInfo = null;
             if(usin.getUserInfo() == null || usin.getUserInfo().equals("")) {
            	 usin.setUserInfo("");
            	 userInfo = "此人太懒了，什么都没写。";
             } else {
            	 userInfo = usin.getUserInfo();
             }
             %>
             <p><%=userInfo %></p>
          </div>
          <%} %>
        </div>
      </div>
      
      <hr/>
      
      <div class="am-g">
        <div class="am-u-sm-12">
        	<h3>交易信息</h3>
        	<table class="am-table am-table-bd am-table-striped admin-content-table">
            <thead>
            <tr>
              <th>物品名称</th><th>出售用户</th><th>购买用户</th><th>价格</th><th>状态</th><th>管理</th>
            </tr>
            </thead>
            <tbody id="jiaoyi_ifm">
            
            </tbody>
          </table>
        </div>
      </div>
      
      <hr/>
      
      <div class="am-g">
        <div class="am-u-sm-12">
        	<h3>历史交易</h3>
        	<table class="am-table am-table-bd am-table-striped admin-content-table">
            <thead>
            <tr>
              <th>物品名称</th><th>出售用户</th><th>购买用户</th><th>价格</th><th>状态</th><th>管理</th>
            </tr>
            </thead>
            <tbody id="jiaoyi_history">
            
            </tbody>
          </table>
        </div>
      </div>
      
      <hr/>
      
      <div class="am-g">
        <div class="am-u-sm-12">
        	<h3>未成功交易</h3>
        	<table class="am-table am-table-bd am-table-striped admin-content-table">
            <thead>
            <tr>
              <th>物品名称</th><th>出售用户</th><th>购买用户</th><th>价格</th><th>状态</th>
            </tr>
            </thead>
            <tbody id="jiaoyi_lose">
            
            </tbody>
          </table>
        </div>
      </div>

    </div>
    
    <footer class="admin-content-footer">
      <hr>
      <p class="am-padding-left"><%@ include file="../frame/Frame_bottom.jsp"%></p>
    </footer>
  </div>
</div>
<%@ include file="../frame/Frame_chat.jsp"%>
</body>
</html>
