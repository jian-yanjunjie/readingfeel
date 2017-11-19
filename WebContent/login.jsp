<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
	session.setAttribute("root", root);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
<title>Insert title here</title>
<link rel="alternate icon" type="image/png" href="assets/i/favicon.png">
<link rel="stylesheet" href="assets/css/amazeui.min.css"/>
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
  <hr />
</div>
<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
    <h3>登录</h3>
    <hr>
    <div class="am-btn-group">
    <!--  <a href="#" class="am-btn am-btn-secondary am-btn-sm"><i class="am-icon-github am-icon-sm"></i> Github</a>-->
    <!--  <a href="#" class="am-btn am-btn-success am-btn-sm"><i class="am-icon-google-plus-square am-icon-sm"></i> Google+</a>-->
    <!--  <a href="#" class="am-btn am-btn-primary am-btn-sm"><i class="am-icon-stack-overflow am-icon-sm"></i> stackOverflow</a>-->
    </div>
    <br>
    <br>

    <form method="post" id="form" action="${root}/User/login.do" class="am-form">
      <label for="email">学号:</label>
      <input type="text" name="userinfoNum" id="userinfoNum" value="">
      <br>
      <label for="password">密码:</label>
      <input type="password" name="userinfoPwd" id="userinfoPwd" value="">
      <br>
      <label for="remember-me">
        <input id="remember-me" type="checkbox">
        记住密码
      </label>
      <br />
      <div class="am-cf">
        <input type="button" name="" value="登 录" onclick="sub()" class="am-btn am-btn-primary am-btn-sm am-fl">
        <input type="button" name="" onclick=" hre()" value="去注册^_^? " class="am-btn am-btn-default am-btn-sm am-fr">
      </div>
    </form>
    <hr>
    <p>© 2017 版权所有.  <a href="http://www.mycodes.net/" target="_blank"></a></p>
  </div>
</div>
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
	function hre(){
		location="${root}/admin-user.jsp";
	}
	function sub(){
		var userInfo = $("#form").serialize();
// 		userInfo = decodeURIComponent(userInfo,true);//序列化解码
	  	$.ajax({
             type: "POST",
           	 url:$("#form").attr("action"),
             data:userInfo,// 要提交的表单
             dataType:'json',
             success: function(ret){
    			if(null != ret){
    				location = "${root}/index.jsp";
    			}else{
    				alert("wrong!");
    			}
             }
         });
	}
</script>
</body>
</html>