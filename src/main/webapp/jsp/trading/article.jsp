<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>森林：物品界面</title>
  <meta name="description" content="这是一个 article 页面">
  <meta name="keywords" content="article">
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
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" ></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/article.js" ></script>
</head>

<%
if( request.getParameter("articleFloor") != null) {
	session.setAttribute("articleFloor", request.getParameter("articleFloor"));
}
%>
<body onload="floor('<%=session.getAttribute("articleFloor") %>');message()">
<%@ include file="../frame/Frame_top.jsp"%>

<div class="am-cf admin-main">
  <%@ include file="../frame/Frame_left.jsp"%>

  <div class="admin-content">

    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf">
          <strong class="am-text-primary am-text-lg">交易区</strong> / <small>Trade district</small>
        </div>
      </div>

      <hr>
      
      <form action="" name="article-top">
      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
          <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
              <button type="button" class="am-btn am-btn-default" onclick="sell()"><span class="am-icon-plus"></span> 售卖</button>
            </div>
          </div>
        </div>
        <!-- <div class="am-u-sm-12 am-u-md-3">
          <div class="am-input-group am-input-group-sm">
            <input type="text" class="am-form-field">
          <span class="am-input-group-btn">
            <button class="am-btn am-btn-default" type="button">搜索</button>
          </span>
          </div>
        </div> -->
      </div>
      </form>
        
      <ul id="article" class="am-avg-sm-2 am-avg-md-4 am-avg-lg-6 am-margin gallery-list">
      
      </ul>

      <div class="am-cf">
        <hr/>
        <div class="am-fr">
        <ul class="am-pagination" id="page">
          
        </ul>
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