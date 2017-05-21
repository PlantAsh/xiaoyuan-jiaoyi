<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="${pageContext.request.contextPath}/jsp/user/<%=session.getAttribute("userLevel") %>.jsp"><span class="am-icon-home"></span> 首页</a></li>
        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 页面模块 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
            <li><a href="${pageContext.request.contextPath}/jsp/trading/article.jsp?articleFloor=明德"><span class="am-icon-th"></span> 明德</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/trading/article.jsp?articleFloor=幕贤"><span class="am-icon-th"></span> 幕贤</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/trading/article.jsp?articleFloor=尚雅"><span class="am-icon-th"></span> 尚雅</a></li>
          </ul>
        </li>
      </ul>

      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p><span class="am-icon-bookmark"></span> 公告</p>
          <p>愿你一世快乐。 —— sen</p>
        </div>
      </div>

    </div>
  </div>
</body>
</html>