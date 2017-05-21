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
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/modifyCheck.js" ></script>
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
      			
      			<%String userLevel = (String) session.getAttribute("userLevel"); %>
     		 	<div class="am-g">
      				<form action="" name="modify_password" class="am-form am-form-horizontal" method="post" enctype="multipart/form-data" >
      					<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
        				</div>
        				
      					<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
      						<div class="am-form-group">
              					<label for="articleDescribe" class="am-u-sm-3 am-form-label">原密码</label>
              					<div class="am-u-sm-9">
              					<input type="password" name="oldPassword" oninput="checkOld(this)" placeholder="请输入原密码。"/>
              					<SPAN id="oldPassword_notice" >*</SPAN>
              					</div>
            				</div>
            				
            				<div class="am-form-group">
              					<label for="articleDescribe" class="am-u-sm-3 am-form-label">新密码</label>
              					<div class="am-u-sm-9">
                				<input type="password" name="userPassword" id="userPassword" oninput="checkPassword(this)" onkeyup="checkIntensity(this.value)" placeholder="请输入1-20个字符的密码。"/>
                				<SPAN id="userPassword_notice" >*</SPAN>
                				<br>
       						    <TD align=right><STRONG>密码强度:</STRONG></TD>
        						<TD><TABLE cellSpacing=0 cellPadding=1 width=145 border=0>
          						<TBODY>  
            					<TR align=middle>  
             					 <TD id=pwd_lower width="33%">弱</TD>  
             					 <TD id=pwd_middle width="33%">中</TD>  
             					 <TD id=pwd_high width="33%">强</TD>  
            					</TR>  
          						</TBODY>  
        						</TABLE></TD>
      							<br>
              					</div>
            				</div>
            				
            				<div class="am-form-group">
              					<label for="articleDescribe" class="am-u-sm-3 am-form-label">确认密码</label>
              					<div class="am-u-sm-9">
                				<input type="password" id="userPassword2" oninput="checkConformPassword(this)" placeholder="请再输入一次密码。"/>
      							<SPAN id="userPassword2_notice" >*</SPAN>
              					</div>
            				</div>

            				<div class="am-form-group">
              					<div class="am-u-sm-9 am-u-sm-push-3">
                					<input type="button" onclick="ok()" name="modify" value="修 改" class="am-btn am-btn-primary">
                					<input type="button" onclick="cancel('<%=userLevel %>')" value="取 消" class="am-btn am-btn-primary">
              					</div>
            				</div>
        				</div>
      				</form>
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