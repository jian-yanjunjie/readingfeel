<%@page import="org.lanqiao.yhxxgl.entity.BookInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	List<BookInfo> bookInfos = (List<BookInfo>)request.getAttribute("bookinfos");
%>
<%
	String root = request.getContextPath();
	session.setAttribute("root", root);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">书帖</strong> / <small>信息</small></div>
    </div>

      <div class="am-u-md-6" style="align:center">
        <div class="am-panel am-panel-default">
          <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-4'}">书帖列表<span class="am-icon-chevron-down am-fr" ></span></div>
          <div id="collapse-panel-4" class="am-panel-bd am-collapse am-in">
            <ul class="am-list admin-content-task" id="bookpostList">
<!-- 			  <li> -->
<!--                 <div class="admin-task-meta"> Posted on 25/1/2120 by 呵呵呵</div> -->
<!--                 <div class="admin-task-bd"> -->
<!--                   基兰和狗熊出现在不同阵营时。基兰会获得BUFF，“装甲熊憎恨者”。狗熊会获得BUFF，“时光老人憎恨者”。 -->
<!--                 </div> -->
<!--                 <div class="am-cf"> -->
<!--                   <div class="am-btn-toolbar am-fl"> -->
<!--                     <div class="am-btn-group am-btn-group-xs"> -->
<!--                       <button type="button" class="am-btn am-btn-default"><span class="am-icon-check"></span></button> -->
                      
<!--                     </div> -->
<!--                   </div> -->
                   
<!--                 </div> -->
<!--               </li> -->
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
	$(function(){
		var type ="<%=(String)request.getParameter("bookposttype")%>";
		$.ajax({
            type: "POST",
          	url:"${root}/send/bookselect.do?bookpostType="+type,
            data:"",// 要提交的表单
            dataType:'json',
//             ansc:true,
            success: function(bookinfos){
   			if(null != bookinfos){
   				for(var i=0;i<bookinfos.length;i++){
   					var bookinfoId = bookinfos[i].bookinfoId;
   					$("#bookpostList").append($("<li>"
			    +"            <div class='admin-task-meta'> Posted on"+bookinfos[i].bookCreattime+" by "+bookinfos[i].bookUser+"</div>"
			    +"             <div class='admin-task-bd'>"
			    +        		bookinfos[i].bookTheme
			    +"             </div>"
			    +"             <div class='am-cf'>"
			    +"              <div class='am-btn-toolbar am-fl'>"
			    +"                 <div class='am-btn-group am-btn-group-xs'>"
			    +"                   <button type='button' class='am-btn am-btn-default' onclick='comen(\""+bookinfoId+"\")' bookinfoId='"+bookinfoId+"' ><span class='am-icon-check'></span></button>"
			    +"                 </div>"
			    +"               </div>"
			    +"                "
			    +"             </div>"
			    +"           </li>"));
   				}
//    				location = "${root}/list.jsp";
   			}else{
   				alert("wrong!");
   			}
            }
        });
		
	});
	
	function comen(bookinfoId){
		location = "${root}/pinglun.jsp?bookinfoId="+bookinfoId;
	}
</script>
</body>
</html>