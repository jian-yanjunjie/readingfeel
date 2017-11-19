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
<title>主页</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet"
	type="text/css" media="screen,projection" />
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="http://www.jq22.com/jquery/bootstrap-3.3.4.css"> -->
<link rel="stylesheet" type="text/css"
	href="${root}/css/jq22/bootstrap-3.3.4.css">
	
<link href="css/bootstrap-popover-x.css" media="all" rel="stylesheet"
	type="text/css" />


<!-- <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script> -->
<script src="${root}/js/jq22/jquery-1.10.2.js"></script>

<!-- <script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script> -->
<script src="${root}/js/jq22/bootstrap-3.3.4.js"></script>

<script src="js/bootstrap-popover-x.js" type="text/javascript"></script>
</head>
<body>
<script type="text/javascript">
	function rst(){
		$("#oldpwd").val('');
		$("#newpwd").val('');
	}
	function check(){
		var oldpwd = $("#oldpwd").val();
		var rightpwd = (null === rightpwd || '' === rightpwd? '${sessionScope.user.userinfoPwd}':rightpwd);
		if(rightpwd != oldpwd){
			alert("原始密码输入错误！");
			return false;
		}
		return true;
	}
	//修改密码
	function sub(){
		if(!isregist()){
			alert("你还没有登录哦");
			location = "${root}/login.jsp";
			return false;
		}
		if(!check()){
			return false;
		}
		var modifyinfo = $("#modifypwd").serialize();
	  	$.ajax({
             type: "POST",
           	 url:$("#modifypwd").attr("action"),
             data:modifyinfo,// 要提交的表单
             dataType:'json',
             success: function(ret){
    			if(ret){
    				alert("修改成功！");
    				rightpwd = $("#newpwd").val();
    				$("#myPopover1b").hide();
    			}else{
    				alert("密码输入错误！");
    			}
             }
         });
	}
	//页面跳转
	function isregist(){
	 	var userinfo = '${sessionScope.user.userinfoNick}'; 
		if("" === userinfo){
			 return false;
		 }
		return true;
	}
	function hre(hre){
		if(isregist()){
		location = hre;
		}else{
			location = "${root}/login.jsp";
		}
	}
</script>
	<div id="templatemo_header_wrapper">
		<div id="templatemo_header">
			<div id="site_title">
				<h1>
					<a href="index.html"> <strong>读书交流网站</strong> <span>
							book reading</span>
					</a>
				</h1>
			</div>
			<div id="templatemo_menu">
				<ul>
					<li><a href="index.jsp" class="current">主页</a></li>
					<li><a href="#" onclick="hre('user-list.jsp')">我的书帖</a></li>
					<li><a href="#" onclick="hre('send.jsp')">发帖</a></li>
					<li><a href="#" data-toggle="popover-x"
						data-target="#myPopover1b" data-placement="bottom" >修改密码</a></li>
					<li><a href="admin-user.jsp">注册</a></li>
					<li><a id="user"></a></li>
				</ul>
				
			</div>
			<!-- end of templatemo_menu -->
			<!-- reset password  start -->
			<div id="myPopover1b" class="popover popover-default">
				<div class="arrow"></div>
				<h3 class="popover-title">
					<span class="close pull-right" data-dismiss="popover-x">&times;</span>修改密码
				</h3>
				<div class="popover-content">
					<p>请输入原来密码</p>
					<form class="form-vertical" id="modifypwd" action="${root}/User/updatePwd.do" method="post">
						<div class="form-group">
							<input type="password" id="oldpwd" class="form-control" placeholder="oldPassword">
						</div>
						<input type="password" id="newpwd" name="userinfoPwd" class="form-control"
							placeholder="newPassword">
					</form>
				</div>
				<div class="popover-footer">
					<button type="button" class="btn btn-sm btn-primary" onclick="sub()">Submit</button>
					<button type="reset" class="btn btn-sm btn-default" onclick="rst()">Reset</button>
				</div>
			</div>
		</div>
		<!-- reset password end  -->
		<div class="cleaner"></div>
	</div>
	<!-- end of header -->
	</div>
	<!-- end of header_wrapper -->

	<div id="templatemo_slider_wrapper">
		<div id="templatemo_slider">

			<div id="one" class="contentslider">
				<div class="cs_wrapper">
					<div class="cs_slider">

						<div class="cs_article">

							<div class="article">

								<div class="left">
									<h2>热门书帖</h2>
									<div class="cs_href" id="remenlet">
<!-- 										<p> -->
<!-- 											<a href="pinglun.jsp">《大数据时代》我们不是大数据的人质</a> -->
<!-- 										</p> -->
<!-- 										<p> -->
<!-- 											<a href="pinglun.jsp">《不公正的审判》正义也许会迟到，但从不缺席</a> -->
<!-- 										</p> -->
<!-- 										<p> -->
<!-- 											<a href="pinglun.jsp">《毒木圣经》既是寓言，也是史诗</a> -->
<!-- 										</p> -->
									</div>
									<!--  <div class="button"><a href="#">More</a></div>-->
								</div>

								<div class="right" id="remenrig">
<!-- 									<p> -->
<!-- 										<a href="pinglun.jsp">《让教育回归人性》我们到底迷失了什么</a> -->
<!-- 									</p> -->
<!-- 									<p> -->
<!-- 										<a href="pinglun.jsp">《追问》探寻落马官员的心灵史</a> -->
<!-- 									</p> -->
<!-- 									<p> -->
<!-- 										<a href="pinglun.jsp">《东北游记》外国人游居的观察记录</a> -->
<!-- 									</p> -->
<!-- 									<p> -->
<!-- 										<a href="pinglun.jsp">《地下铁道》内心藏着追求自由的种子</a> -->
<!-- 									</p> -->


									<!--    <a href="http://www.cssmoban.com/" target="_parent">-->
									<!--        <img src="images/slider/templatemo_slide01.jpg" alt="template 1" />-->
									<!--    </a>-->
								</div>

							</div>

						</div>
						<!-- End cs_article -->
					</div>
					<!-- End cs_slider -->
				</div>
				<!-- End cs_wrapper -->
			</div>
			<!-- End contentslider -->

			<!-- Site JavaScript -->
			<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
			<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
			<script type="text/javascript" src="js/jquery.ennui.contentslider.js"></script>
			<script type="text/javascript">
	        $(function() {
	        $('#one').ContentSlider({
	        width : '910px',
	        height : '210px',
	        speed : 500,
	        easing : 'easeOutQuart'
	        });
	        //
	        var userinfo = '${sessionScope.user.userinfoNick}';
	        debugger;
	        if("" === userinfo){
	        	$("#user").html("你还没有登录哦！");
	        	$("#user").attr("href","${root}/login.jsp");
	        }else{
				$("#user").html(userinfo+",welcom!");
					}
			//加载文工园地列表
			bookpostList(false,"#wengong",'1');
			//加载理工园地列表
			bookpostList(false,"#ligong",'2');
			//加载业余园地列表
			bookpostList(false,"#yeyu",'3');
			//加载热门园地列表
			bookpostList(true,"#remen",'');
	        });
	        function comen(bookinfoId){
	    		location = "${root}/pinglun.jsp?bookinfoId="+bookinfoId;
	    	}
	        function bookpostList(remen,id,postid){
	        	var url = "${root}/send/bookselect.do?bookpostType="+postid;
	        	url = remen?"${root}/send/hotPost.do":url;
	        	$.ajax({
	                type: "POST",
	              	url:url,
	                data:"",// 要提交的表单
	                dataType:'json',
	                success: function(ret){
	       			if(null != ret){
	       				
	       				if(!remen){
	       				var len = ret.length>6?6:ret.length;
	       				for(var i=0;i<len;i++){
	       					var bookinfoId = ret[i].bookinfoId;
	       					var list = $(
	       	     					+"<p>"
	       	     					+"<a href='#'  onclick='comen(\""+bookinfoId+"\")'>"+ret[i].bookTheme+"</a>"
	       	     					+"</p>"
	       	     					);
	       					$(id).append(list);
	       					}
	       				}else{
	       					var len = ret.length>7?7:ret.length;
	       					var belen = ret.length>=3?3:ret.length;
		       				for(var i=0;i<belen;i++){
		       					var bookinfoId = ret[i].bookinfoId;
		       					var list = $(
		       	     					+"<p>"
		       	     					+"<a href='#'  onclick='comen(\""+bookinfoId+"\")'>"+ret[i].bookTheme+"</a>"
		       	     					+"</p>"
		       	     					);
		       					$("#remenlet").append(list);
		       					}
		       				if(3<ret.length){
		       					for(var i=3;i<len;i++){
		       						var bookinfoId = ret[i].bookinfoId;
		       						var list = $(
			       	     					+"<p>"
			       	     					+"<a href='#'  onclick='comen(\""+bookinfoId+"\")'>"+ret[i].bookTheme+"</a>"
			       	     					+"</p>"
			       	     					);
			       					$("#remenrig").append(list);
			       					}
		       				}
	       				}
	       			}else{
	       				alert("wrong!");
	       				}
	       			  
	                }
	            });
	        }
       		</script>
			<script src="js/jquery.chili-2.2.js" type="text/javascript"></script>
			<script src="js/chili/recipes.js" type="text/javascript"></script>

		</div>
		<!-- end of slider -->
	</div>
	<!-- end of slider_wrapper -->

	<div id="templatemo_top_row_wrapper">
		<div id="templatemo_top_row">

			<div class="top_row_box" id="wengong">
				<h5>
					<a href="${root}/list.jsp?bookposttype=1" onclick="">文工园地</a>
				</h5>
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">《经济学人》经典文章集成《新经济学：解读现代经济》</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">《中国的坎》探讨如何跨越“中等收入陷阱”</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">《胡作非为》：200位银行家起底真实惊悚的金融黑幕</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">“外行”也能看懂的通俗著作《高尚的经济学》</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">《中国领导力》：全球思想领袖纵论世界大势</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">《太古之道》在京发布：解读太古管理之道</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">我可能不是最优秀的，那又怎样</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">千万不要追求理智告诉你不可能得到的东西</a> -->
<!-- 				</p> -->

				<!--  <div class="button"><a href="#">More</a></div>-->

			</div>

			<div class="top_row_box" id="ligong">
				<h5>
					<a href="${root}/list.jsp?bookposttype=2">理工园地</a>
				</h5>
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">《智能的本质》分享会：对话人工智能本质、现状及前景</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">《福尔摩斯症候群》致敬偶像：全程笑点的密室杀人</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">这个只看10w+的时代，作者还需要编辑吗？</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">《大数据时代》：我们不是大数据的人质</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">《我的天才女友》：谜一般的“天才女友”</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">《未来简史》：一部大而无当的“想象史”</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">不完满才是人生</a> -->
<!-- 				</p> -->
				<!-- <div class="button"><a href="#">More</a></div>-->
			</div>

			<div class="top_row_box last" id="yeyu">
				<h5>
					<a href="${root}/list.jsp?bookposttype=3">业余园地</a>
				</h5>
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">双城记</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">漫谈读书</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp"></a>伦敦不知道什么时候会下雨 -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">新西兰：年少轻狂时应该去的地方</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">女生要为自己的颜值负责</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">海边小镇的古怪</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">肤色中隐藏的进化秘密</a> -->
<!-- 				</p> -->
<!-- 				<p> -->
<!-- 					<a href="pinglun.jsp">进化史上那只没毛的水猿</a> -->
<!-- 				</p> -->

				<!--   <div class="button"><a href="#">More</a></div>-->
			</div>

			<div class="cleaner"></div>
		</div>
		<!-- end of top row -->
	</div>
	<!-- end of top row wrapper -->

	<div id="templatemo_content_wrapper">
		<div id="templatemo_content">

			<h1>读书静语</h1>
			<div class="image_wrapper fl_img">
				<img src="images/templatemo_image_05.jpg" alt="image" width="120"
					height="120" />
			</div>
			<p>
				<a href="#" target="_parent">Extreme Template</a> is provided by <a
					href="http://www.cssmoban.com/" target="_parent">Free CSS
					Templates</a>. This template contains total 5 different pages. Mauris
				risus magna, blandit ac suscipit at, tristique id erat. Vestibulum
				malesuada magna a nisi tempor interdum. Pellentesque quis justo
				erat. Nam malesuada bibendum metus ac faucibus.
			</p>
			<p>时光静好，与君语；细水流年，与君同。</p>
			<div class="cleaner"></div>
		</div>
		<!-- end of content -->
	</div>
	<!-- end of content_wrapper -->



	<div id="templatemo_copyright_wrapper">
		<div id="templatemo_copyright">

			Copyright © 2048 <a href="#">Your Company Name</a> | Template from <a
				href="http://www.cssmoban.com" target="_parent" title="网站模板">网站模板</a>
			| Validate XHTML &amp; CSS

		</div>
		<!-- end of templatemo_copyright -->
	</div>
	<!-- end of copyright wrapper -->
</body>
</html>