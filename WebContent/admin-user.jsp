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
<title>Insert title here</title>
</head>
 <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar admin-header">
  <div class="am-topbar-brand">
    <strong>注册</strong> <small></small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
 
  <!-- sidebar end -->

  <!-- content start -->
  <div class="admin-content">
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人资料</strong> / <small>Personal information</small></div>
    </div>

    <hr/>

    <div class="am-g">

      <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8" style="display:none">
        <div class="am-panel am-panel-default">
          <div class="am-panel-bd">
            <div class="am-g">
              <div class="am-u-md-4">
<!--                 <img class="am-img-circle am-img-thumbnail" src="http://amui.qiniudn.com/bw-2014-06-19.jpg?imageView/1/w/1000/h/1000/q/80" alt=""/> -->
              </div>
              <div class="am-u-md-8"  >
<!--                 <p><h3>欢迎来到注册页面！</h3></p> -->
<!--                 <form class="am-form"> -->
<!--                   <div class="am-form-group"> -->
<!--                     <input type="file" id="user-pic"> -->
<!--                     <p class="am-form-help">请选择要上传的文件...</p> -->
<!--                     <button type="button" class="am-btn am-btn-primary am-btn-xs">保存</button> -->
<!--                   </div> -->
<!--                 </form> -->
              </div>
            </div>
          </div>
        </div>

        
      </div>

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <form id="form" class="am-form am-form-horizontal" action="${root}/User/register.do" method="post">
          <div class="am-form-group">
            <label for="user-name" class="am-u-sm-3 am-form-label">学号 / ID</label>
            <div class="am-u-sm-9">
              <input type="text" name="userinfoNum" id="userinfoNum" placeholder="学号 / ID">
              <small>输入你的学号，让我们记住你。</small>
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-email" class="am-u-sm-3 am-form-label">电子邮件 / Email</label>
            <div class="am-u-sm-9">
              <input type="email" name="userinfoEmail" placeholder="输入你的电子邮件 / Email">
              <small>邮箱你懂得...</small>
            </div>
          </div>
          <div class="am-form-group">
            <label for="user-QQ" class="am-u-sm-3 am-form-label">密码</label>
            <div class="am-u-sm-9">
              <input type=password id="userinfoPwd" name="userinfoPwd" placeholder="输入你的密码">
            </div>
          </div>
			
		  <div class="am-form-group">
            <label for="user-QQ" class="am-u-sm-3 am-form-label" >确认密码</label>
            <div class="am-u-sm-9">
              <input type=password id="user-pwd" onblur="check()" placeholder="请确认你的密码">
          </div>
         
          </div>
          <div class="am-form-group">
            <label for="user-weibo" class="am-u-sm-3 am-form-label">昵称 / Twitter</label>
            <div class="am-u-sm-9">
              <input type="text" name="userinfoNick" id="userinfoNick" placeholder="输入你的昵称 / Twitter">
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-intro" class="am-u-sm-3 am-form-label">简介 / Intro</label>
            <div class="am-u-sm-9">
              <textarea class="" rows="5" name="userinfoIntroduce" placeholder="输入个人简介"></textarea>
              <small>250字以内写出你的一生...</small>
            </div>
          </div>

          <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
              <button type="button" class="am-btn am-btn-primary" onclick = "sub()">保存修改</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- content end -->

</div>

<footer>
  <hr>
  <p class="am-padding-left">© 2017 AllMobilize, Inc. Licensed under MIT license. <a href="http://www.mycodes.net/" target="_blank"></a></p>
</footer>

<!--[if lt IE 9]>
<script src="assets/js/jquery1.11.1.min.js"></script>
<script src="assets/js/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<!-- <script src="js/jquery.serializejson.min.js"></script> -->
<!--<![endif]-->
<script src="assets/js/app.js"></script>
<script type="text/javascript">
	function sub(){
		if(!check()){
			
			return false;
		}
		if(null === userinfoNum || null === userinfoNick || "" === userinfoNick || "" === userinfoNum){
			alert("请将内容填写完整！");
			return false;
		}
		var userInfo = $("#form").serialize();
// 		userInfo = decodeURIComponent(userInfo,true);//序列化解码
	  	$.ajax({
             type: "POST",
           	 url:$("#form").attr("action"),
             data:userInfo,// 要提交的表单
             dataType:'json',
             success: function(ret){
    			if(ret){
    				location = "${root}/index.jsp";
    			}else{
    				alert("注册失败!");
    			}
             }
         });
	}
	function check(){
		var old = $("#userinfoPwd").val();
		var newpwd = $("#user-pwd").val();
		if(null === old || null === newpwd || "" === old || "" === newpwd){
			return false;
		}
		if(old === newpwd){
			return true;
		}
		alert("密码输入不一致！");
		return false;
	}
</script>
</body>
</html>