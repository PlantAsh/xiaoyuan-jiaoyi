<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="xiaoyuan_jiaoyi.entity.UserInformation"%>
<html class="no-js fixed-layout">
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/chat.js" ></script>
</head>
<body onload="message()">
<%
UserInformation usin = (UserInformation) session.getAttribute("userInformation");
if (usin != null) {
%>

<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <strong>森林</strong>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li><a href="#" id="message" onclick="chat3()"></a></li>
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span> <%=usin.getUserName() %><span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li><a href="${pageContext.request.contextPath}/information/userinfo">
          <span class="am-icon-user"></span> 资料</a>
          </li>
          <li><a href="${pageContext.request.contextPath}/jsp/user/modify_password.jsp">
          <span class="am-icon-user"></span> 修改密码</a>
          </li>
          <li><a href="${pageContext.request.contextPath}/user/cancel">
          <span class="am-icon-power-off"></span> 注销</a>
          </li>
        </ul>
      </li>
      <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

<%} else {
%>
<script type="text/javascript">
	alert("请先登录");
	window.location.href="${pageContext.request.contextPath}/jsp/user/login.jsp";
</script>
<%} %>

</body>
</html>