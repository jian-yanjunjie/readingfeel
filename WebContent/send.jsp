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
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="description" content="">
 <meta name="author" content="">
<title>发帖</title>
  <!-- logo icon -->
    <link rel=" shortcut icon" href="">
    <!-- css files -->
    <link rel="stylesheet" href="">
    <!-- css style -->
	
	<link href="src/ui-choose.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/default.css">
    <link rel="stylesheet" type="text/css" href="css/set2.css" />
<!-- 	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script> -->
	<script src="${root}/js/jq22/jquery-1.10.2.js"></script>
	<style>
		body{padding: 20px}
	</style>
    <style>
        .textarea-wrapper{width:70%;margin:10px auto;}
        .textarea-block{position:relative;}
        .textarea-item{width:100%;height:400px;border:1px solid #ccc;padding:10px;resize:none;color:#aaa;}
        .textarea-count{position:absolute;bottom:10px;right:0;color:#000;}
        .textarea-btn{margin-top:10px;}
    </style>
	<style>
    .demo-box {
        margin: 10px auto;
        width: 70%;
        padding: 20px;
        border: 5px solid #ccc;
    }
    
    .demo-table {
        border-collapse: collapse;
        width: 100%;
    }
    
    .demo-table caption {
        border-bottom: 1px dashed #ccc;
        height: 40px;
        margin-bottom: 20px;
        font: 18px/1.2 normal 'microsoft yahei';
    }
    
    .demo-table tr td {
        padding: 8px 10px;
        font: 16px/1.8 normal 'microsoft yahei';
        vertical-align: top;
    }
    
    .ui-input {
        vertical-align: top;
        height: 18px;
        font-size: 16px;
        line-height: 20px;
        border: 1px solid #aaa;
        padding: 6px 8px;
        border-radius: 3px;
    }
		.jq22-header h1{ text-align: center; font-size: 16px; }
    </style>
</head>
<body>

    <!-- 页面内容 -->
    <h3>说说读书的感悟吧</h3>
		<form action="${root}/send/sendbookfeel.do" method="post" id="form">
		<div class="demo-box">
			<table style="width:100%">
				<tr><td>
					<label> 书帖主题：</label>
					<span class="input input--yoshiko">
					<input name="bookTheme" class="input__field input__field--yoshiko" type="text" id="input-11" />
					<label class="input__label input__label--yoshiko" for="input-11">
						<span class="input__label-content input__label-content--yoshiko" data-content="书帖主题">书帖主题</span>
					</label>
					</span>
				</td></tr>
				<tr><td>
				     <label> 书帖类型：</label>
					 <select class="ui-choose" id="uc_02" name="bookPostid">
	                        <option value="1">文工园地</option>
	                        <option value="2">理工园地</option>
	                        <option value="3">业余园地</option>
					</select>
				</td></tr>
			</table>
	    </div>
	 	<div class='textarea-wrapper'>
	        <div class='textarea-block'>
	            <textarea class="textarea-item" name="bookWords" placeholder="请输入内容，不超过1000字。" maxlength="1000" spellcheck="false"></textarea>
	            <div class="textarea-count">
	                <span class="textareaInput">0</span>/<span class="textareaTotal">1000</span>
	            </div>
	        </div>
	        <button type="button" class='textarea-btn' onclick="sub()" disabled="">提交</button>
	    </div>
	
	</form>
<!-- 	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script> -->
	<script src="src/ui-choose.js"></script>
	<script>
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
	// 将所有.ui-choose实例化
	$('.ui-choose').ui_choose();

	// uc_02 select 单选
	var uc_02 = $('#uc_02').data('ui-choose');
	uc_02.click = function(value, item) {
	    console.log('click', value);
	};
	uc_02.change = function(value, item) {
	    console.log('change', value);
	};

	</script>
	 <script src="js/classie.js"></script>
    <script>
        (function () {
            if (!String.prototype.trim) {
                (function () {
                    // Make sure we trim BOM and NBSP
                    var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
                    String.prototype.trim = function () {
                        return this.replace(rtrim, '');
                    };
                })();
            }

            [ ].slice.call(document.querySelectorAll('input.input__field')).forEach(function (inputEl) {
                // in case the input is already filled..
                if (inputEl.value.trim() !== '') {
                    classie.add(inputEl.parentNode, 'input--filled');
                }

                // events:
                inputEl.addEventListener('focus', onInputFocus);
                inputEl.addEventListener('blur', onInputBlur);
            });

            function onInputFocus(ev) {
                classie.add(ev.target.parentNode, 'input--filled');
            }

            function onInputBlur(ev) {
                if (ev.target.value.trim() === '') {
                    classie.remove(ev.target.parentNode, 'input--filled');
                }
            }
        })();
    </script>
	
   
    



    <!-- js files -->
<!--     <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script> -->
    <!-- js scripts -->
    <script>
        $(document).ready(function(){

            var lenInput = $('.textarea-item').val().length;

            $(".textarea-item").keyup(function(){
                lenInput = $(this).val().length;
                if(lenInput>0 && lenInput<=1000){
                    $('.textareaInput').html(lenInput);
                    $('.textarea-btn').attr('disabled',false);
                }else{
                    $('.textarea-btn').attr('disabled',true);
                }
            });
        });
    </script>
</body>
</html>