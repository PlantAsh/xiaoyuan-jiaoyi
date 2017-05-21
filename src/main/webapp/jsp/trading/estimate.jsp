<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="xiaoyuan_jiaoyi.entity.TradingInformation"%>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>森林：评价</title>
  <meta name="description" content="这是一个 estimate 页面">
  <meta name="keywords" content="sell">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
  <link href="${pageContext.request.contextPath}/js/upload/UploadPic.css" rel="stylesheet" type="text/css"> 
  <script src="${pageContext.request.contextPath}/js/upload/jquery-2.2.1.js"></script>
  <script src="${pageContext.request.contextPath}/js/upload/UploadPic.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
  <script type="text/javascript">
  function OK() {
	  if(document.Estimate.estimate.value.length > 90) {
		  articleDescribe.focus();
		  alert("评价请在90字以内");
	  } else {
		  Estimate.action = '${pageContext.request.contextPath}/trading/estimate';
		  document.Estimate.submit();
	  }
  }
  function Cancel() {
	  Estimate.action="${pageContext.request.contextPath}/jsp/user/user_level1.jsp";
	  document.Estimate.submit();
  }
  </script>
</head>
<body>
	<%@ include file="../frame/Frame_top.jsp"%>

	<div class="am-cf admin-main">
  	<%@ include file="../frame/Frame_left.jsp"%>
  		<div class="admin-content">
   			<div class="admin-content-body">
      			<div class="am-cf am-padding am-padding-bottom-0">
        			<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">评价</strong> / <small>estimate</small></div>
      			</div>

      			<hr/>
      			
      			<%if (usin != null) { 
      				TradingInformation tr = (TradingInformation) session.getAttribute("estimate");
      			%>
     		 	<div class="am-g">
      				<form action="" name="Estimate" class="am-form am-form-horizontal" method="post" enctype="multipart/form-data" >
      					<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
          					<!-- <div id="UploadPic" Col="1" Row="1" Width="100" Height="100"> //头像上传
          					</div> -->
        				</div>
        				
      					<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
      						<div class="am-form-group">
              					<label for="articleDescribe" class="am-u-sm-3 am-form-label">对方评价</label>
              					<div class="am-u-sm-9">
              					<%
              					String buyEstimate = tr.getBuyEstimate();
              					String sellEstimate = tr.getSellEstimate();
              					if(tr.getBuyEstimate() == null) {
              						tr.setBuyEstimate("");
              					}
              					if(tr.getSellEstimate() == null) {
              						tr.setSellEstimate("");
              					}
              					if(tr.getUserAccount().equals(usin.getUserAccount())) { %>
                					<textarea class="" rows="10" placeholder="对方未评价" disabled><%=tr.getBuyEstimate() %></textarea>
              					<%} else if(tr.getTradingAccount().equals(usin.getUserAccount())) { %>
              						<textarea class="" rows="10" placeholder="对方未评价" disabled><%=tr.getSellEstimate() %></textarea>
              					<%} %>
              					</div>
            				</div>
            				
            				<div class="am-form-group">
              					<label for="articleDescribe" class="am-u-sm-3 am-form-label">评价</label>
              					<div class="am-u-sm-9">
                				<%if(tr.getUserAccount().equals(usin.getUserAccount())) { %>
                					<textarea class="" rows="10" name="sellEstimate" id="estimate" placeholder="请写下您的感受" ><%=tr.getSellEstimate() %></textarea>
              					<%} else if(tr.getTradingAccount().equals(usin.getUserAccount())) { %>
              						<textarea class="" rows="10" name="buyEstimate" id="estimate" placeholder="请写下您的感受" ><%=tr.getBuyEstimate() %></textarea>
              					<%} %>
              					</div>
            				</div>

            				<div class="am-form-group">
              					<div class="am-u-sm-9 am-u-sm-push-3">
                					<input type="button" onclick="OK()" value="确 认" class="am-btn am-btn-primary">
                					<input type="button" onclick="Cancel()" value="取 消" class="am-btn am-btn-primary">
              					</div>
            				</div>
        			</div>
      				</form>
      			</div>
      			<%} %>
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