<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta charset="UTF-8">
<title>森林：登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" ></script>
<script type="text/javascript" src = "${pageContext.request.contextPath}/js/loginCheck.js"></script>
<style>
.header {
	text-align: center;
}

.header h1 {
	font-size: 200%;
	color: #333;
	margin-top: 30px;
}

.header p {
	font-size: 14px;
}
</style>

</head>
<body>

<div class="header">
  <div class="am-g">
    <h1>森林</h1>
    <p>Second-hand Transactions<br/>三三两两，悠然自得，上上下下，你来我往</p>
  </div>
  <hr />
</div>

<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">   
    
    <form action="" name="login" method="post" class="am-form">
      <label for="userAccount">账号:</label>
      <input type="text" name="userAccount" id="userAccount" oninput="checkUserAccount(this)" placeholder="请输入账号。"/>
      <SPAN id="userAccount_notice" >*</SPAN>
      <br>
      <label for="userPassword">密码:</label>
      <input type="password" name="userPassword" id="userPassword" oninput="checkPassword(this)" placeholder="请输入密码。"/>
      <SPAN id="userPassword_notice" >*</SPAN>
      <br>
      <!-- <label for="remember-me">
        <input id="remember-me" type="checkbox">
                记住密码
      </label> -->
      <br />
      <div class="am-cf">
        <input type="button" onclick="ok()" name="login" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl" style="float:left;"/>
        <input type="button" onclick="regist()" value="注 册" class="am-btn am-btn-primary am-btn-sm am-fl"  style="float:left;margin-left:15px;"/>
        <!-- <input type="button" onclick="" value="忘记密码 " class="am-btn am-btn-default am-btn-sm am-fr"/> -->
      </div>
    </form>
    <hr>
    <p><%@ include file="../frame/Frame_bottom.jsp"%></p>
  </div>
</div>

</body>
</html>