<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta charset="UTF-8">
<title>森林：注册</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/registCheck.js" ></script>
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
    
    <form action="" name="regist" method="post" class="am-form">
      <label for="userAccount">账号:</label>
      <input type="text" name="userAccount" id="userAccount" oninput="checkUserAccount(this)" placeholder="请输入账号。">
      <SPAN id="userAccount_notice" >*</SPAN>
      <br>
      <label for="userPassword">密码:</label>
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
      <label for="userPassword2">确认密码:</label>
      <input type="password" id="userPassword2" oninput="checkConformPassword(this)" placeholder="请再输入一次密码。"/>
      <SPAN id="userPassword2_notice" >*</SPAN>
      <br>
      <div class="am-cf">
        <input type="button" onclick="ok()" value="确 认" name="regist" class="am-btn am-btn-primary am-btn-sm am-fl" style="float:left;"/>
        <input type="button" onclick="cancel()" value="取 消" class="am-btn am-btn-primary am-btn-sm am-fl"  style="float:left;margin-left:15px;"/>
      </div>
    </form>
    <hr>
    <p><%@ include file="../frame/Frame_bottom.jsp"%></p>
  </div>
</div>

</body>
</html>