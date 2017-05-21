var userAccount_empty = "<span style='COLOR:#ff0000'>  × 账号不能为空!</span>";
var userAccount_invalid = "<span style='COLOR:#ff0000'> - 账号只能是由字母数字以及下划线组成。";
var userAccount_can = "<span style='COLOR:#006600'> √ </span>";
var password_empty = "<span style='COLOR:#ff0000'> × 登录密码不能为空。</span>";
var password_can = "<span style='COLOR:#006600'> √ </span>";
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
	} else {
		showInfo("userAccount_notice", userAccount_can);
		name_flag = true;
		change_submit();
		return;
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
	} else {
		showInfo("userPassword_notice", password_can);
		password_flag = true;
		change_submit();
		return;
	}
	change_submit();
}

/*
 * 按钮状态设置
 */
function change_submit() {
	if (name_flag&&password_flag) {
		document.forms['login'].elements['login'].disabled = '';
	} else {
		document.forms['login'].elements['login'].disabled = 'disabled';
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
	
	document.forms['login'].action = getRootPath() + "user/login";
	document.forms['login'].submit();
}
function regist() {
	document.forms['login'].action = getRootPath() + "jsp/user/regist.jsp";
	document.forms['login'].submit();
}