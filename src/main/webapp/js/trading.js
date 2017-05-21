function getRootPath() {
	var pathName = window.location.pathname.substring(1);
	var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
	return window.location.protocol + '//' + window.location.host + '/' + webName + '/';
}

function trading(articleId) {
	var check = window.confirm("请确认是否交易");
	if(check == true) {
		$.ajax ({
			type : "post", // 以post方式与后台沟通
			url : getRootPath() + "trading/addTrading", // 与此页面沟通
			dataType : 'json',// 返回的值以JSON方式解释
			data : 'articleId=' + articleId,
			success : function(json) {// 如果调用成功
				if(json.flag) {
					var jiaoyi = "";
					jiaoyi = jiaoyi + '<input class="am-btn am-btn-default" type="button" value="等待确认" disabled="disabled" />';
					$('#jiaoyi').html(jiaoyi);
				}
			}
		});
	}
}

function getState(articleId,articleState,ar_userAccount,userAccount,userLevel) {
	var jiaoyi = "";
	if(articleState == '未交易' && userAccount != ar_userAccount && userLevel == 'user_level1') {
		$.ajax ({
			type : "post", // 以post方式与后台沟通
			url : getRootPath() + "trading/getState", // 与此页面沟通
			dataType : 'json',// 返回的值以JSON方式解释
			data : 'articleId=' + articleId,
			success : function(json) {// 如果调用成功
				if(json.flag) {
					jiaoyi = jiaoyi + '<input class="am-btn am-btn-default" type="button" value="等待确认" disabled="disabled" />';
					$('#jiaoyi').html(jiaoyi);
				} else {
					jiaoyi = jiaoyi + '<input class="am-btn am-btn-default" type="button" onclick="trading(' + "'" + articleId + "'" + ')" value="发起交易" />';
					$('#jiaoyi').html(jiaoyi);
				}
			}
		});
	} else if(userAccount == ar_userAccount) {
		$('#jiaoyi').html(jiaoyi);
	} else {
		jiaoyi = jiaoyi + '<input class="am-btn am-btn-default" type="button" value="已被交易" disabled="disabled" />';
		$('#jiaoyi').html(jiaoyi);
	}
}

var startstop;

function trading_ifm_start() {
	trading_ifm();
	startstop = setInterval("trading_ifm()",15000);
}

function trading_ifm() {
	$.ajax ({
		type : 'post',
		url : getRootPath() + 'trading/trading_ifm',
		dataType : 'json',
		success : function(json) {
			information(json);
		}
	});
}

function information(json) {
	var jiaoyi_ifm = '';
	var jiaoyi_history = '';
	var jiaoyi_lose = '';
	var userAccount = json.userAccount;
	var div = '<div class="am-dropdown">';
	var button = '<span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>';
	var number = 1;
	$.each(json.trading_ifm, function(idx, f) {
		var all = '<tr><td>' + f.articleName + '(' + f.articleFloor + ')</td>'+
				'<td>' + f.userName + '(' + f.userAccount + ')</td>' + '<td>' + f.tradingName + '(' + f.tradingAccount + ')</td>' +
				'<td><span class="am-badge am-badge-success">' + f.tradingPrice + '</span></td><td>' + f.tradingState + '</td><td>';
		if(f.tradingState == '待同意' || f.tradingState == '正在交易') {
			if(f.userAccount == userAccount && f.tradingState == '待同意') {
				jiaoyi_ifm = jiaoyi_ifm + all + div + '<button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" onclick="xiala(' + number + ')">' + button 
							+ '<ul class="am-dropdown-content" id="xiala' + number + '">'
							+ '<li><a href="#" onclick="choose(' + "'正在交易'" + ",'" + f.tradingId + "'" + ",'" + f.articleId + "'" + ')">交易</a></li>'
							+ '<li><a href="#" onclick="choose(' + "'卖方取消'" + ",'" + f.tradingId + "'" + ",'" + f.articleId + "'" + ')">拒绝</a></li></ul></div></td></tr>';
			} else if(f.tradingAccount == userAccount && f.tradingState == '待同意') {
				jiaoyi_ifm = jiaoyi_ifm + all + div + '<button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" onclick="xiala(' + number + ')">' + button 
							+ '<ul class="am-dropdown-content" id="xiala' + number + '">'
							+ '<li><a href="#" onclick="choose(' + "'买方取消'" + ",'" + f.tradingId + "'" + ",'" + f.articleId + "'" + ')">取消交易</a></li></ul></div></td></tr>';
			} else if(f.userAccount == userAccount && f.tradingState == '正在交易') {
				jiaoyi_ifm = jiaoyi_ifm + all + div + '<button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" >' + button 
							+ '</div></td></tr>';
			} else if(f.tradingAccount == userAccount && f.tradingState == '正在交易') {
				jiaoyi_ifm = jiaoyi_ifm + all + div + '<button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" onclick="xiala(' + number + ')">' + button 
							+ '<ul class="am-dropdown-content" id="xiala' + number + '">'
							+ '<li><a href="#" onclick="choose(' + "'交易完成'" + ",'" + f.tradingId + "'" + ",'" + f.articleId + "'" + ')">交易完成</a></li></ul></div></td></tr>';
			}
		} else if(f.tradingState == '交易完成') {
			jiaoyi_history = jiaoyi_history + all + div + '<button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" onclick="xiala(' + number + ')">' + button 
							+ '<ul class="am-dropdown-content" id="xiala' + number + '">'
							+ '<li><a href="#" onclick="getEstimate(' + "'" + f.tradingId + "'" + ')">评价</a></li></ul></div></td></tr>';
		} else {
			jiaoyi_lose = jiaoyi_lose + all
							+ '</td></tr>';
		}
		number += 1;
	});
	if(jiaoyi_ifm == '') {
		jiaoyi_ifm = jiaoyi_ifm + '<tr><td>无记录</td><td>无记录</td><td>无记录</td>'
					+ '<td>无记录</td><td>无记录</td><td></td></tr>';
	}
	if(jiaoyi_history == '') {
		jiaoyi_history = jiaoyi_history + '<tr><td>无记录</td><td>无记录</td><td>无记录</td>'
						+ '<td>无记录</td><td>无记录</td><td></td></tr>';
	}
	if(jiaoyi_lose == '') {
		jiaoyi_lose = jiaoyi_lose + '<tr><td>无记录</td><td>无记录</td><td>无记录</td>'
					+ '<td>无记录</td><td>无记录</td></tr>';
	}
	$('#jiaoyi_ifm').html(jiaoyi_ifm);
	$('#jiaoyi_history').html(jiaoyi_history);
	$('#jiaoyi_lose').html(jiaoyi_lose);
}

function xiala(number) {
	var ul = document.getElementById('xiala' + number);
	ul.style.display = ul.style.display == "block" ? "none" : "block";
}

function choose(obj, tradingId, articleId) {
	$.ajax({
		type : 'post',
		url : getRootPath() + 'trading/update_trd',
		dataType : 'json',
		data : {'state' : obj, 'tradingId' : tradingId, 'articleId' : articleId},
		success : function(json) {
			if(!json.flag) {
				alert("服务器错误");
			}
			trading_ifm();
		}
	});
}

function getEstimate(tradingId) {
	$.ajax({
		type : 'post',
		url : getRootPath() + 'trading/getEstimate',
		dataType : 'json',
		data : 'tradingId=' + tradingId,
		success : function(json) {
			window.location.href = getRootPath() + "jsp/trading/estimate.jsp";
		}
	});
}

function get_allEstimate(otherAccount) {
	$.ajax({
		type : 'post',
		url : getRootPath() + 'trading/get_allEstimate',
		dataType : 'json',
		data : 'otherAccount=' + otherAccount,
		success : function(json) {
			window.location.href = getRootPath() + "jsp/trading/other_allEstimate.jsp?otherAccount=" + otherAccount;
		}
	});
}

function load_allEstimate(otherAccount) {
	$.ajax({
		type : 'post',
		url : getRootPath() + 'trading/get_allEstimate',
		dataType : 'json',
		data : 'otherAccount=' + otherAccount,
		success : function(json) {
			var other_ifm = '';
			if(json.flag) {
				$.each(json.allEstimate, function(idx, f) {
					if(json.otherAccount == f.userAccount) {
						other_ifm = other_ifm + '<tr><td>' + f.articleName + '</td>'+ '<td>' + f.tradingName +
								'</td>' + '<td><span class="am-badge am-badge-success">' + f.tradingPrice + '</span></td><td>' + f.buyEstimate + '</td></tr>';
					} else if(json.otherAccount == f.tradingAccount) {
						other_ifm = other_ifm + '<tr><td>' + f.articleName + '</td>'+ '<td>' + f.userName +
								'</td>' + '<td><span class="am-badge am-badge-success">' + f.tradingPrice + '</span></td><td>' + f.sellEstimate + '</td></tr>';
					}
				});
			} else {
				other_ifm = other_ifm + '<tr><td>无记录</td><td>无记录</td><td>无记录</td><td>无记录</td></tr>';
			}
			$('#other_ifm').html(other_ifm);
		}
	});
}