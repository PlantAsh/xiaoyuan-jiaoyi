<%@page import="xiaoyuan_jiaoyi.entity.InformationCode"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="xiaoyuan_jiaoyi.entity.InformationCode"%>
<%@ page import="java.util.*"%>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>森林：用户信息</title>
  <meta name="description" content="这是一个 information 页面">
  <meta name="keywords" content="information">
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
	  var userIntro = document.Information.userInfo;
	  if(userIntro.value.length > 100) {
		  userIntro.focus();
		  alert("字太多没人看的啦，100字以内就好了");
	  } else {
		  Information.action="${pageContext.request.contextPath}/information/update";
		  document.Information.submit();
	  }
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人资料</strong> / <small>Personal information</small></div>
      </div>

      <hr/>

      <div class="am-g">
      <form action="" name="Information" class="am-form am-form-horizontal" method="post" enctype="multipart/form-data" >
      
        <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
          	<!-- <div id="UploadPic" Col="1" Row="1" Width="100" Height="100"> //头像上传
          	</div> -->
        </div>
        
        <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">     
            <div class="am-form-group">
              <label for="userName" class="am-u-sm-3 am-form-label">姓名 / Name</label>
              <div class="am-u-sm-9">
                <input type="text" name="userName" id="userName" value="<%=usin.getUserName() %>"/>
              </div>
            </div>
            
            <div class="am-form-group">
            <label for="user-birthday" class="am-u-sm-3 am-form-label">生日 / Birthday</label>
            <div class="am-u-sm-9">
                <div class="am-form-group am-form-icon">
                  <i class="am-icon-calendar"></i>
                  <input type="date" name="userBirthday" id="userBirthday" value="<%=usin.getUserBirthday() %>" class="am-form-field am-input-sm"/>
                </div>
            </div>
            </div>
            
            <%
            List inFloor = (List) session.getAttribute("inFloor");
            %>
            <div class="am-form-group">
            <label for="userFloor" class="am-u-sm-3 am-form-label">楼 / Floor</label>
            <div class="am-u-sm-9">
              <div class="am-btn-group" data-am-button>
              <%
              for(int i=0; i<inFloor.size(); i++) {
              	InformationCode inf1 = (InformationCode) inFloor.get(i);
              	if(inf1.getCodeName().equals(usin.getUserFloor())){
              %>
                <label class="am-btn am-btn-default am-btn-xs">
                  <input type="radio" name="userFloor" value="<%=inf1.getCodeName() %>" checked> <%=inf1.getCodeName() %> 
                </label>
              <%
              	} else {
              %>
                <label class="am-btn am-btn-default am-btn-xs">
                  <input type="radio" name="userFloor" value="<%=inf1.getCodeName() %>"> <%=inf1.getCodeName() %> 
                </label>
              <%
              	}
              }
              %>
              </div>
            </div>
            </div>
            
            <%
            List inMajor = (List) session.getAttribute("inMajor");
            %>
            <div class="am-form-group">
            <label for="userMajor" class="am-u-sm-3 am-form-label">专业 / Major</label>
            <div class="am-u-sm-9">
              <div class="am-btn-group" data-am-button>
              <%
              for(int i=0; i<inMajor.size(); i++) {
              	InformationCode inf2 = (InformationCode) inMajor.get(i);
              	if(inf2.getCodeName().equals(usin.getUserMajor())){
              %>
                <label class="am-btn am-btn-default am-btn-xs">
                  <input type="radio" name="userMajor" value="<%=inf2.getCodeName() %>" checked> <%=inf2.getCodeName() %>
                </label>
              <%
              	} else {
              %>
                <label class="am-btn am-btn-default am-btn-xs">
                  <input type="radio" name="userMajor" value="<%=inf2.getCodeName() %>"> <%=inf2.getCodeName() %>
                </label>
              <%
              	}
              }
              %>
              </div>
            </div>
            </div>

            <div class="am-form-group">
              <label for="userEmail" class="am-u-sm-3 am-form-label">邮箱 / Email</label>
              <div class="am-u-sm-9">
                <input type="email" name="userEmail" id="userEmail" value="<%=usin.getUserEmail() %>"/>
              </div>
            </div>

            <div class="am-form-group">
              <label for="userTelephone" class="am-u-sm-3 am-form-label">电话 / Telephone</label>
              <div class="am-u-sm-9">
                <input type="tel" name="userTelephone" id="userTelephone" value="<%=usin.getUserTelephone() %>"/>
              </div>
            </div>
            
            <%
            String text = usin.getUserInfo();
            if(text != null) {
				text = text.replace("<br/>", "\r\n");
			}
            %>
            <div class="am-form-group">
              <label for="userIntro" class="am-u-sm-3 am-form-label">简介 / Info</label>
              <div class="am-u-sm-9">
                <textarea class="" rows="5" name="userInfo" id="userInfo" placeholder="100字以内"><%=text %></textarea>
              </div>
            </div>

            <div class="am-form-group">
              <div class="am-u-sm-9 am-u-sm-push-3">
                <button type="button" onclick="OK()" class	="am-btn am-btn-primary">保存修改</button>
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