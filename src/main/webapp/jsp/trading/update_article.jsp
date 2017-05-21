<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="xiaoyuan_jiaoyi.entity.InformationCode"%>
<%@ page import="xiaoyuan_jiaoyi.entity.Article"%>
<%@ page import="java.util.*"%>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>森林：修改</title>
  <meta name="description" content="这是一个 update 页面">
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
	  if(document.Sell.articleName.value.length < 1) {
		  articleName.focus();
		  alert("名称不能为空");
	  } else if(document.Sell.articleName.value.length > 9) {
		  articlePrice.focus();
		  alert("名称不能超过9个字符");
	  } else if(document.Sell.articlePrice.value.length > 15) {
		  articlePrice.focus();
		  alert("价格不能超过15字符");
	  } else if(document.Sell.articlePrice.value.length < 1) {
		  articlePrice.focus();
		  alert("价格不能为空");
	  } else if(document.Sell.articleDescribe.value.length < 1) {
		  articleDescribe.focus();
		  alert("描述不能为空");
	  } else if(document.Sell.articleDescribe.value.length > 450) {
		  articleDescribe.focus();
		  alert("描述在450字字符以内");
	  } else {
		  var floor = 0;
		  for(var i=0; i<document.getElementsByName("articleFloor").length; i++) {
			  if(document.getElementsByName("articleFloor")[i].checked) {
				  floor = 1;
			  }
		  }
		  if(floor == 0) {
			  alert("请选择公寓");
		  } else {
			  Sell.action="${pageContext.request.contextPath}/sell/updateArticle";
			  document.Sell.submit();
		  }
	  }
  }
  function Cancel() {
	  Sell.action="${pageContext.request.contextPath}/jsp/trading/article_information.jsp";
	  document.Sell.submit();
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">修改</strong> / <small>Update</small></div>
      </div>

      <hr/>
      
      <%
		Article ar = (Article) session.getAttribute("article");
	  %>
      <div class="am-g">
      <form action="" name="Sell" class="am-form am-form-horizontal" method="post" enctype="multipart/form-data" >
      
        <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
          	<div id="UploadPic" Col="1" Row="1" Width="100" Height="100">
          	</div>
        </div>
        
        <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">     
            <div class="am-form-group">
              <label for="articleName" class="am-u-sm-3 am-form-label">名称 / Name</label>
              <div class="am-u-sm-9">
                <input type="text" name="articleName" id="articleName" value="<%=ar.getArticleName() %>" />
              </div>
            </div>
            
            <div class="am-form-group">
              <label for="articlePrice" class="am-u-sm-3 am-form-label">价格 / Price</label>
              <div class="am-u-sm-9">
                <input type="text" name="articlePrice" id="articlePrice" placeholder="人民币" value="<%=ar.getArticlePrice() %>" />
              </div>
            </div>
            
            <%
            if (usin != null) {
            List inFloor = (List) session.getAttribute("inFloor");
            %>
            <div class="am-form-group">
            <label for="articleFloor" class="am-u-sm-3 am-form-label">楼 / Floor</label>
            <div class="am-u-sm-9">
              <div class="am-btn-group" data-am-button>
              <%
              for(int i=0; i<inFloor.size(); i++) {
              	InformationCode infc = (InformationCode) inFloor.get(i);
              	if(infc.getCodeName().equals(ar.getArticleFloor())){
              %>
                <label class="am-btn am-btn-default am-btn-xs">
                  <input type="radio" name="articleFloor" value="<%=infc.getCodeName() %>" checked> <%=infc.getCodeName() %> 
                </label>
              <%
              	} else {
              %>
                <label class="am-btn am-btn-default am-btn-xs">
                  <input type="radio" name="articleFloor" value="<%=infc.getCodeName() %>"> <%=infc.getCodeName() %> 
                </label>
              <%
              	}
              }
              %>
              </div>
            </div>
            </div>
            <%} %>
            
            <%
            String text = ar.getArticleDescribe();
			text = text.replace("<br/>", "\r\n");
            %>
            <div class="am-form-group">
              <label for="articleDescribe" class="am-u-sm-3 am-form-label">描述 / Description</label>
              <div class="am-u-sm-9">
                <textarea class="" rows="10" name="articleDescribe" id="articleDescribe" placeholder="" ><%=text %></textarea>
              </div>
            </div>

            <div class="am-form-group">
              <div class="am-u-sm-9 am-u-sm-push-3">
                <input type="button" onclick="OK()" value="修 改" class="am-btn am-btn-primary">
                <input type="button" onclick="Cancel()" value="取 消" class="am-btn am-btn-primary">
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