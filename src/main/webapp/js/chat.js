

function closeBtn() {
	$.ajax ({
		type : "post", // 以post方式与后台沟通
		url : getRootPath() + "chat/closeMessages", // 与此页面沟通
		dataType : 'json',// 返回的值以JSON方式解释
		success : function(json) {// 如果调用成功
			if(json.flag) {
				$("#ChatBox").fadeOut("fast");
			} else {
				alert("服务器出错！请重新登录");
				window.location.href=getRootPath() + "jsp/user/login.jsp";
			}
		}
	});
	stop();
}

function getRootPath() {
	var pathName = window.location.pathname.substring(1);
	var webName = pathName == '' ? '' : pathName.substring(0, pathName
			.indexOf('/'));
	return window.location.protocol + '//' + window.location.host + '/'
			+ webName + '/';
}

var startstop3;
var startstop1;
var startstop2;
var count = 0;
var sendName = "";
var sendUser = "";
var oldUser = "";

function message() {
	getCount();
	startstop3 = setInterval("getCount()",15000);
}

function chat(obj,name) {
	$("#ChatBox").fadeIn("slow");
	var window = "";
	window = window + name + '<a href="#" title="关闭窗口" class="close_btn" onclick="closeBtn()">×</a>';
	$('#window').html(window);
	sendName = name;
	sendUser = obj;
	start();
}

function chat2(obj,name) {
	$("#ChatBox").fadeIn("slow");
	var window = "";
	window = window + name + '<a href="#" title="关闭窗口" class="close_btn" onclick="closeBtn()">×</a>';
	$('#window').html(window);
	sendName = name;
	sendUser = obj;
	showUser();
	start();
}

function chat3() {
	$("#ChatBox").fadeIn("slow");
	var window = "";
	window = window + '<a href="#" title="关闭窗口" class="close_btn" onclick="closeBtn()">×</a>';
	$('#window').html(window);
	sendName = "";
	sendUser = "";
	start2();
}

function start2() {
	showUser();
	showContent()
	startstop2 = setInterval("showUser()",8000);
	startstop3 = clearInterval(startstop3);
}

function start() {
	showUser();
	startstop1 = setInterval("showContent()",1000);
	startstop2 = setInterval("showUser()",8000);
	startstop3 = clearInterval(startstop3);
}

function stop() {
	startstop1 = clearInterval(startstop1);
	startstop2 = clearInterval(startstop2);
	getCount();
	startstop3 = setInterval("getCount()",15000);
}

function getCount() {
	$.ajax ({
		type : "post", // 以post方式与后台沟通
		url : getRootPath() + "chat/getCount", // 与此页面沟通
		dataType : 'json',// 返回的值以JSON方式解释
		success : function(json) {// 如果调用成功
			var message = "";
			count = json.count;
			if(json.count == 0) {
				message = message + '<span class="am-icon-envelope-o"></span> 消息'
						+ '<span class="am-badge am-badge-warning"></span>'
			} else {
				message = message + '<span class="am-icon-envelope-o"></span> 消息'
						+ '<span class="am-badge am-badge-warning">' + json.count + '</span>'
			}
			$('#message').html(message);
		}
	});
}

function showContent(){
	$.ajax ({
		type : "post", // 以post方式与后台沟通
		url : getRootPath() + "chat/getMessages", // 与此页面沟通
		dataType : 'json',// 返回的值以JSON方式解释
		data : 'sendUser=' + sendUser,
		success : function(json) {// 如果调用成功
			if(json.flag) {
				getMessage(json);
			}
		}
	});
}

function showUser(){
	var name = 'false';
	if(oldUser == sendUser && oldUser != "") {
		name = 'true';
	} else {
		oldUser = sendUser;
	}
	$.ajax ({
		type : "post", // 以post方式与后台沟通
		url : getRootPath() + "chat/getUser", // 与此页面沟通
		dataType : 'json',// 返回的值以JSON方式解释
		data : 'name=' + name,
		success : function(json) {// 如果调用成功
			if(json.flag) {
				getUser(json);
			}
		}
	});
}

function getMessage(json) {
	var chatText = "";
	var content = document.getElementById('chatText');
	$.each(json.message, function(idx, f) {
		if(json.sendUser==f.messageSend && json.acceptUser==f.messageAccept) {
			chatText = chatText + "<li class='content_li'><img class='chat_img content_li_img content_li_imgleft' src='http://s.amazeui.org/media/i/demos/bing-1.jpg'>"
					 + "<span class='content_li_span content_li_spanleft'>" + f.message + "</span></li>" 
		} else if(json.sendUser==f.messageAccept && json.acceptUser==f.messageSend) {
			chatText = chatText + "<li class='content_li'><img class='chat_img content_li_img content_li_imgright' src='http://s.amazeui.org/media/i/demos/bing-1.jpg'>"
			 + "<span class='content_li_span content_li_spanright'>" + f.message + "</span></li>" 
		}
	});
	$('#chatText').html(chatText);
	content.scrollTop = content.scrollHeight;
}

function getUser(json) {
	var getUser = "";
	var name = "";
	if(sendUser != "") {
		getUser = getUser + "<a href='#' disabled><div class='userNow'>" +
				sendName + '(' + sendUser + ')' +"</div></a><br/>";
	}
	if(json.flag2) {
		$.each(json.messageUser, function(idx, f) {
			if(sendUser != f.messageSend) {
				getUser = getUser + '<a href="#" onclick="chat2(' + "'" + f.messageSend + "'" + ',' + "'" + f.sendName + "'" + ')">' +
						'<div class="user">' + f.sendName + '(' + f.messageSend + ')' +'</div></a><br/>';
			}
		});
	}
	$('#getUser').html(getUser);
}

function send(){	//验证聊天信息并发送
	var text = document.getElementById("text");
	if(text.value.length < 1){
		text.setAttribute("placeholder", "发送信息不可以为空");
	} else if(text.value.length > 80) {
		alert("发送信息在80字符以内");
	} else if(sendName == "") {
		alert("请选择联系人");
	} else {
		$.ajax ({
			type : "post", // 以post方式与后台沟通
			url : getRootPath() + "chat/sendMessage", // 与此页面沟通
			dataType : 'json',// 返回的值以JSON方式解释
			data: 'text=' + text.value,
			success : function(json) {// 如果调用成功
				if(json.flag) {
					text.value = '';
				} else {
					alert("服务器出错！请重新登录");
					window.location.href=getRootPath() + "jsp/user/login.jsp";
				}
			}
		});
	}

}

