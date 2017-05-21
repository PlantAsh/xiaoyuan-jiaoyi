<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/chat.js" ></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat.css">
</head>
<body>

<div class="ChatBox" id="ChatBox">
	<div class="left">
		<ul class="leftContent" id="getUser">
		
		</ul>
	</div>
	<div class="row1" id="window">
		
	</div>
	<ul class="content" id="chatText"></ul>
	<div class="footer">
		<input class="footer_input" id="text" name="text" type="text" value="" placeholder="说点什么吧..." />
		<span class="footer_span" id="btn" onclick="send()">发送</span>
	</div>
</div>

</body>
</html>