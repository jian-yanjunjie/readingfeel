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
<meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar admin-header">
  <div class="am-topbar-brand">
    <strong></strong> <small>我的书帖</small>
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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">我的</strong> / <small>书帖</small></div>
    </div>

    <ul class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list ">
      <li><a href="#" class="am-text-success"><span class="am-icon-btn am-icon-file-text"></span><br/>我的昵称<br/>${sessionScope.user.userinfoNick}</a></li>
      <li id="ft"></li>
<!--       <li><a href="#" class="am-text-danger"><span class="am-icon-btn am-icon-recycle"></span><br/>浏览量<br/>80082</a></li> -->
     <!-- <li><a href="#" class="am-text-secondary"><span class="am-icon-btn am-icon-user-md"></span><br/>在线用户<br/>3000</a></li>-->
    </ul>

    

    
      <div class="am-u-md-6" style="align:center">
        <div class="am-panel am-panel-default">
          <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-4'}">发过的书帖<span class="am-icon-chevron-down am-fr" ></span></div>
          <div id="collapse-panel-4" class="am-panel-bd am-collapse am-in">
            <ul class="am-list admin-content-task" id="bookpostList">
            </ul>
          </div>
        </div>
		<!---------------------------------------------------------------------------------------------->
        
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
<!--<![endif]-->
<script src="assets/js/app.js"></script>
<script type="text/javascript">
	var num  = 0;
	$(function(){
		init();
		
	});
	//初始化页面
	function init(){
		$.ajax({
            type: "POST",
          	url:"${root}/send/userPost.do",
            data:"",// 要提交的表单
            dataType:'json',
//             ansc:true,
            success: function(bookinfos){
   			if(null != bookinfos){
   				num = bookinfos.length;
   				var fatie = $(
   				"<a href='#' class='am-text-warning' ><span class='am-icon-btn am-icon-briefcase'></span><br/>发帖<br/>"+num.toString()+"</a>"	
   				);
   				debugger;
   				$("#ft").html('');
   				$("#ft").append(fatie);
   				$("#bookpostList").html('');
   				for(var i=0;i<bookinfos.length;i++){
   					var bookinfoId = bookinfos[i].bookinfoId;
   					var bookPostid = 1 == bookinfos[i].bookPostid?"文工园地":2 == bookinfos[i].bookPostid?"理工园地":"业余园地";
   					$("#bookpostList").append($("<li>"
			    +"            <div class='admin-task-meta'> 书帖类型:"+bookPostid+";发帖时间："+bookinfos[i].bookCreattime+" 发帖人: "+bookinfos[i].bookUser+"</div>"
			    +"             <div class='admin-task-bd'>"
			    +        		bookinfos[i].bookTheme
			    +"             </div>"
			    +"             <div class='am-cf'>"
			    +"              <div class='am-btn-toolbar am-fl'>"
			    +"                 <div class='am-btn-group am-btn-group-xs'>"
			    +"                   <button type='button' class='am-btn am-btn-default' onclick='comen(\""+bookinfoId+"\")' ><span class='am-icon-check'></span></button>"
			    +"                 </div>"
			    +"               </div>"
			    +" 				<div class='am-fr'>"
			    +"					<button type='button' class='am-btn am-btn-default am-btn-xs' onclick='deletbook(\""+bookinfoId+"\")' >删除</button>"
			    +" 				</div> "
			    +"             </div>"
			    +"           </li>"));
   				}
//    				location = "${root}/list.jsp";
   			}else{
   				alert("wrong!");
   			}
            }
        });
	}
	//查看书帖详细信息
	function comen(bookinfoId){
		location = "${root}/pinglun.jsp?bookinfoId="+bookinfoId;
	}
	//删除书帖信息
	function deletbook(bookinfoId){
		$.ajax({
            type: "POST",
          	 url:"${root}/send/deleteBookPost.do?bookinfoId="+bookinfoId,
            data:'',// 要提交的表单
            dataType:'json',
            success: function(ret){
   			if(ret){
   				init();
   			}else{
   				alert("操作错误！");
   			}
            }
        });
	}
</script>
</body>
</html>