<%@page import="org.lanqiao.yhxxgl.entity.BookInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
	session.setAttribute("root", root);
	String bookInfo =(String)request.getParameter("bookinfoId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/semantic.css" type="text/css" />

<link rel="stylesheet" href="css/zyComment.css" type="text/css" />



<style type="text/css" media="print, screen">  

	label {

	    font-weight: bold;

	}

	

	a {

		font-family: Microsoft YaHei;

	}

	.neirong {
		width:60%;
		
		 
		margin:50px auto;
	}
	#them{
		align:center;
		margin:10px auto;
	}
	#articleComment {

		width:60%;

		height: 1500px;

		overflow: auto;
		margin:0 auto;

	}

</style> 
</head>
<body>
<div class = "neirong"  id="bookThem"><h2 id="them" align="center">fsafda</h2></div>
<div class = "neirong"  id="bookinfo"></br>
	　钱钟书先生写过一篇妙文，说从整个历史来看，古代其实相当于人类的小孩子时期，先前是幼稚的，
	经过了千百年的长进，慢慢才到了现代。时代越是古旧，它的历史就越短，时代越是在后，它积累的阅历越是深厚，
	年龄就越多。所以，总结来说，我们反而是我们祖父的前辈，上古三代反不如现代悠久古老。

　　现代人完全可以这样对待我们的历史和传统。我们的时代正在用这样的一种方式瓦解经典，
时间再也不是淘洗作品的永恒标准，因为传统无法解释现代人的经验，历史也无法应对高速变化的现实，
共识已经瓦解成了个人主义的炮灰，经典备受质疑，经典之中也许并无圣人之言，
很可能都是无用的废话——如果按照现如今大数据的标准，所有的经典都应该抛弃在垃圾堆，
因为其中撰写的都是无用之言和可疑之言，缺乏合理的大数据的论证。

　　这话说得有些滑稽，但确实是切中要害的现实概括：大数据神话正在横扫一切领域。
原本我们以为大数据只能在科学等实证领域兴风作浪，后来才发现，大数据神话的野心是掌控一切现实，
就连人文学科，也同样需要大数据的支撑，没有大数据支撑的文章都是耍流氓。以前，我们写文章会习惯性地写，
苏格拉底说过，未经省察的人生是不值得过的。现在写作就会说，根据统计数据显示，
或者根据某份权威的调查报告的统计数字，未经省察的人生幸福指数只有20%-40%左右。
我们时代最流行的阅读是别人替你读书，把书的内容划重点，归纳和总结出各种所谓的“干货”和教条，
然后塞给你，你马上就觉得自己变成了博学多知的百科全书——这就是现在“逻辑思维”正在推广的学习方式。
我们渴望的知识不再是经过时间的淘洗依然存在的经典，我们最想获得的知识是维基百科。
	</div>
	<div id="articleComment"></div>
	<input type="hidden" name="bookinfoId" id="bookinfoId" value="<%=(String)request.getParameter("bookinfoId")%>">
	<input type="hidden" name="userinfo" id="userinfo" >
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/pinglun.js"></script>
	<script type="text/javascript">
		
		var agoComment = [

// 	                  {"id":1,"userName":"游客1","time":"2014-04-04","sortID":0,"content":"第一条评论",pldx:""},
// 	                  {"id":8,"userName":"游客8","time":"2014-04-04","sortID":1,"content":"第一条评论",pldx:"1"},
// 	                  {"id":2,"userName":"游客2","time":"2014-04-04","sortID":1,"content":"第一条评论",pldx:"1"},
// 	                  {"id":7,"userName":"游客7","time":"2014-04-04","sortID":2,"content":"第一条评论",pldx:"2"},
// 	                  {"id":3,"userName":"游客3","time":"2014-04-04","sortID":2,"content":"第一条评论",pldx:"2"},
// 	                  {"id":4,"userName":"游客4","time":"2014-05-04","sortID":0,"content":"第一条评论",pldx:""},
// 	                  {"id":5,"userName":"游客5","time":"2014-05-04","sortID":1,"content":"第一条评论",pldx:"4"},
// 	                  {"id":6,"userName":"游客6","time":"2014-05-04","sortID":2,"content":"第一条评论",pldx:"5"}

	                  ];
		
		//获取页面信息
		$(function(){
			var bookinfoId = "<%=(String)request.getParameter("bookinfoId")%>";
			var userinfo = '${sessionScope.user.userinfoNick}';
			$("#userinfo").val(userinfo);
			//获取书帖内容
			$.ajax({
	             type: "POST",
	           	 url:"${root}/Comment/bookidselect.do?bookinfoId="+bookinfoId,
	             data:"",// 要提交的表单
	             dataType:'json',
	             success: function(ret){
	    			if(null != ret){
	    				$("#bookinfo").html(ret.bookWords);
	    				$("#them").html(ret.bookTheme);
	    				
	    			}else{
// 	    				alert("wrong!");
	    			}
	             }
	         });
			//获取书帖的评论信息
			 bookpinglun(bookinfoId);
			//渲染页面
			 $("#articleComment").zyComment({
					"width":"355",
					"height":"33",
					"agoComment":agoComment,
					"callback":function(comment){
						console.info("填写内容返回值：");
						console.info(comment);
						// 添加新的评论
						$("#articleComment").zyComment("setCommentAfter",comment);
					}
				});
		});
		
		function bookpinglun(bookinfoId){
			var plxx = {};
			
			//获取书帖的评论信息
			$.ajax({
	             type: "POST",
	           	 url:"${root}/Comment/selectbookcomment.do?bookinfoId="+bookinfoId,
	             data:"",// 要提交的表单
	             dataType:'json',
	             async: false,
	             success: function(ret){
	    			if(null != ret){
	    				for(var i=0;i<ret.length;i++){
							plxx = {
								"id" : ret[i].id,
								"userName" : ret[i].users,
								"time" : ret[i].answertime,
								"sortID" : ret[i].sortId,
								"content" : ret[i].words,
								 pldx : ret[i].object
							};
							agoComment.push(plxx);
						}
	    				
					} else {
// 						alert("wrong!");
					}
				}
			});
		}
		//评论操作
		function pinglun(result) {
			if("" === $("#userinfo").val() || null === $("#userinfo").val()){
				alert("你还没有登录哦！");
				return false;
			}
			if(null === result.content || "" === result.content){
				alert("你还没写东西哦！");
				return false;
			}
			var commentBook = {
				bookinfoId : result.bookinfoId,
				users : result.name,
				answertime : getnowtime(),
				object : result.pldx,
				sortId : result.sortID,
				words : result.content
			};
			//评论操作
			$.ajax({
				type : "POST",
				url : "${root}/Comment/pinglun.do",
				data : commentBook,// 要提交的表单
				dataType : 'json',
				success : function(ret) {
					if (null != ret) {
// 						alert(ret);
						//		 				$("#bookinfo").html(ret.bookWords);
					} else {
						alert("wrong!");
					}
				}
			});
			return true;
		}
		
	</script>
	
	<script type="text/javascript">
	
	</script>
</body>
</html>