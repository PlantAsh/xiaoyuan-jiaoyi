var userAccount_empty = "<span style='COLOR:#ff0000'>  × 账号不能为空!</span>";
var userAccount_shorter = "<span style='COLOR:#ff0000'> × 账号长度不能少于 5个字符。</span>";
var userAccount_longer = "<span style='COLOR:#ff0000'> × 账号长度不能大于10个字符。</span>";
var userAccount_invalid = "<span style='COLOR:#ff0000'> - 账号只能是由字母数字以及下划线组成。";
var userAccount_have_register = "<span style='COLOR:#ff0000'> × 账号已经存在,请重新输入!</span>";
var userAccount_can_register = "<span style='COLOR:#006600'> √ 恭喜您！该账号可以注册!</span>";
var password_empty = "<span style='COLOR:#ff0000'> × 登录密码不能为空。</span>";
var password_shorter_s = "<span style='COLOR:#ff0000'> × 登录密码不能少于 6 个字符。</span>";
var password_shorter_m = "<span style='COLOR:#ff0000'> × 登录密码不能多于 20个字符。</span>";
var confirm_password_invalid = "<span style='COLOR:#ff0000'> × 两次输入密码不一致!</span>";
var info_can="<span style='COLOR:#006600'> √ 可以注册!</span>";
var info_right="<span style='COLOR:#006600'> √ 填写正确!</span>";
var name_flag = false;
var password_flag = false;

$(function() {
	change_submit();
});
/*
 * 获取工程的路径
 */
function getRootPath() {
	var pathName = window.location.pathname.substring(1);
	var webName = pathName == '' ? '' : pathName.substring(0, pathName
			.indexOf('/'));
	return window.location.protocol + '//' + window.location.host + '/'
			+ webName + '/';
}

/*
 * 账号检测
 */
function checkUserAccount(obj) {
	if (checks(obj.value) == false) {
		showInfo("userAccount_notice", userAccount_invalid);
	} else if (obj.value.length < 1) {
		showInfo("userAccount_notice", userAccount_empty);
	} else if (obj.value.length < 5) {
		showInfo("userAccount_notice", userAccount_shorter);
	} else if (obj.value.length > 10) {
		showInfo("userAccount_notice", userAccount_longer);
	} else {
		// 调用Ajax函数,向服务器端发送查询
		$.ajax({ // 一个Ajax过程
			type : "post", // 以post方式与后台沟通
			url : getRootPath() + "registCheck/checkUserAccount", // 与此页面沟通
			dataType : 'json',// 返回的值以 JSON方式 解释
			data : 'userAccount=' + obj.value, // 发给的数据
			success : function(json) {// 如果调用成功
				if (json.flag) {
					showInfo("userAccount_notice", userAccount_have_register);
				} else {
					showInfo("userAccount_notice", userAccount_can_register);
					name_flag = true;
					change_submit();
					return;
				}
			}
		});
	}
	name_flag = false;
	change_submit();
}

/*
 * 用户名检测是否包含非法字符
 */
function checks(t) {
	szMsg = "[#%&\'\"\\,;:=!^@]"
	for (i = 1; i < szMsg.length + 1; i++) {
		if (t.indexOf(szMsg.substring(i - 1, i)) > -1) {
			return false;
		}
	}
	return true;
}

/*
 * 密码检测
 */
function checkPassword(password) {
	if (password.value.length < 1) {
		password_flag = false;
		showInfo("userPassword_notice", password_empty);
	} else if (password.value.length < 6) {
		password_flag = false;
		showInfo("userPassword_notice", password_shorter_s);
	} else if (password.value.length > 20) {
		password_flag = false;
		showInfo("userPassword_notice", password_shorter_m);
	} else {
		showInfo("userPassword_notice", info_right);
	}
	change_submit();
}

/*
 * 密码确认检测
 */
function checkConformPassword(conform_password) {
	password = $("#userPassword").val();
	if (conform_password.value.length < 1) {
		showInfo("userPassword2_notice", password_empty);
	} else if (conform_password.value != password) {
		showInfo("userPassword2_notice", confirm_password_invalid);
	} else {
		showInfo("userPassword2_notice", info_right);
		password_flag = true;
		change_submit();
		return;
	}
	password_flag = false;
	change_submit();

}

/*
 * 检测密码强度检测
 */
function checkIntensity(pwd) {
	var Mcolor = "#FFF", Lcolor = "#FFF", Hcolor = "#FFF";
	var m = 0;

	var Modes = 0;
	for (i = 0; i < pwd.length; i++) {
		var charType = 0;
		var t = pwd.charCodeAt(i);
		if (t >= 48 && t <= 57) {
			charType = 1;
		} else if (t >= 65 && t <= 90) {
			charType = 2;
		} else if (t >= 97 && t <= 122) {
			charType = 4;
		} else
			charType = 4;
		Modes |= charType;
	}

	for (i = 0; i < 4; i++) {
		if (Modes & 1)
			m++;
		Modes >>>= 1;
	}

	if (pwd.length <= 4) {
		m = 1;
	}

	switch (m) {
	case 1:
		Lcolor = "2px solid red";
		Mcolor = Hcolor = "2px solid #DADADA";
		break;
	case 2:
		Mcolor = "2px solid #f90";
		Lcolor = Hcolor = "2px solid #DADADA";
		break;
	case 3:
		Hcolor = "2px solid #3c0";
		Lcolor = Mcolor = "2px solid #DADADA";
		break;
	case 4:
		Hcolor = "2px solid #3c0";
		Lcolor = Mcolor = "2px solid #DADADA";
		break;
	default:
		Hcolor = Mcolor = Lcolor = "";
		break;
	}
	document.getElementById("pwd_lower").style.borderBottom = Lcolor;
	document.getElementById("pwd_middle").style.borderBottom = Mcolor;
	document.getElementById("pwd_high").style.borderBottom = Hcolor;
}

/*
 * 按钮状态设置
 */
function change_submit() {
	if (name_flag&&password_flag) {
		document.forms['regist'].elements['regist'].disabled = '';
	} else {
		document.forms['regist'].elements['regist'].disabled = 'disabled';
	}
}
/*
 * 公用程序
 */
function showInfo(target, Infos) {
	document.getElementById(target).innerHTML = Infos;
}
function showclass(target, Infos) {
	document.getElementById(target).className = Infos;
}

function ok() {
	document.forms['regist'].action = getRootPath() + "user/regist ";
	document.forms['regist'].submit();
}
function cancel() {
	document.forms['regist'].action = getRootPath() + "jsp/user/login.jsp";
	document.forms['regist'].submit();
}