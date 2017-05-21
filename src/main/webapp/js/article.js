function getRootPath() {
	var pathName = window.location.pathname.substring(1);
	var webName = pathName == '' ? '' : pathName.substring(0, pathName
			.indexOf('/'));
	return window.location.protocol + '//' + window.location.host + '/'
			+ webName + '/';
}

function backPage() {
	$.ajax({ // 一个Ajax过程
		type : "post", // 以post方式与后台沟通
		url : getRootPath() + "article/backPage", // 与此页面沟通
		dataType : 'json',// 返回的值以JSON方式解释
		success : function(json) {// 如果调用成功
			common(json);
		}
	});
}

function nextPage() {
	$.ajax({ // 一个Ajax过程
		type : "post", // 以post方式与后台沟通
		url : getRootPath() + "article/nextPage", // 与此页面沟通
		dataType : 'json',// 返回的值以JSON方式解释
		success : function(json) {// 如果调用成功
			common(json);
		}
	});
}

function somePage(obj) {
	$.ajax({ // 一个Ajax过程
		type : "post", // 以post方式与后台沟通
		url : getRootPath() + "article/somePage", // 与此页面沟通
		dataType : 'json',// 返回的值以JSON方式解释
		data : 'somePage=' + obj, // 发给的数据
		success : function(json) {// 如果调用成功
			common(json);
		}
	});
}

function floor(obj) {
	$.ajax({ // 一个Ajax过程
		type : "post", // 以post方式与后台沟通
		url : getRootPath() + "article/floor", // 与此页面沟通
		dataType : 'json',// 返回的值以JSON方式解释
		data : 'articleFloor=' + obj, // 发给的数据
		success : function(json) {// 如果调用成功
			common(json);
		}
	});
}

function common(json) {
	var article = "";
	var page = "";
	if (json.flag) {
		$.each(json.article, function(idx, f) {
			var articlePicture;
			if(f.articlePicture == null || f.articlePicture == '') {
				articlePicture = 'http://omuumyd2p.bkt.clouddn.com/xiaoyuanjiaoyi.png';
			} else {
				articlePicture = getRootPath() + f.articlePicture;
			}
			article = article + "<li><a href='"
					+ getRootPath() + "sell/getArticle?articleId="
					+ f.articleId + "'>" + "<img class='image-article am-img-bdrs' src='"
					+ articlePicture + "' alt=''/>" + "<div class='gallery-title'>" + f.articleName + "(" +  f.date + ")"
					+ "</div>" + "<div class='gallery-desc'>" + f.userName + "(" + f.userAccount + ") </div></a></li>";
		});
		var pagenumber = json.pagenumber;
		var now = json.now;
		if (now == 1) {
			page = "<li class='am-disabled'><a href='#' onclick='backPage()'>«</a></li>";
		} else {
			page = "<li><a href='#' onclick='backPage()'>«</a></li>";
		}
		var a = 1;
		if (pagenumber > 5 & now > 2) {
			if (pagenumber - now >= 2) {
				a = now - 2;
				pagenumber = now + 2;
			} else {
				a = pagenumber - 4;
			}
		} else if (pagenumber > 5) {
			pagenumber = 5;
		}
		for (var i = a; i <= pagenumber; i++) {
			if (i == now) {
				page = page + "<li class='am-active'><a href='#' onclick='somePage(" + i + ")' >" + i + "</a></li>";
			} else {
				page = page + "<li><a href='#' onclick='somePage(" + i + ")' >" + i
						+ "</a></li>";
			}
		}
		if (now == pagenumber) {
			page = page + "<li class='am-disabled'><a href='#' onclick='nextPage()'>»</a></li>";
		} else {
			page = page + "<li><a href='#' onclick='nextPage()'>»</a></li>";
		}
	} else {
		article = "<li><img class='image-article am-img-bdrs' " +
				"src='http://omuumyd2p.bkt.clouddn.com/xiaoyuanjiaoyi.png' alt=''/>" + "<div class='gallery-title'>暂无"
			+ "</div>" + "<div class='gallery-desc'>2017.3.25</div></li>";
	}
	$('#article').html(article);
	$('#page').html(page);
}

function sell() {
	document.forms['article-top'].action = getRootPath() + "article/sell";
	document.forms['article-top'].submit();
}

function cancle() {
	document.forms['ifm_top'].action = getRootPath() + "jsp/trading/article.jsp";
	document.forms['ifm_top'].submit();
}

function updateArticle() {
	document.forms['ifm_top'].action = getRootPath() + "jsp/trading/update_article.jsp";
	document.forms['ifm_top'].submit();	
}

function deleteArticle(articleId) {
	var check = window.confirm("请确认是否删除！");
	if(check == true) {
		document.forms['ifm_top'].action = getRootPath() + "sell/deleteArticle";
		document.forms['ifm_top'].submit();	
	}
	
}
