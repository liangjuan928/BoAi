<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
			<title>评论</title>
			<meta name="keywords" content="" />
			<meta name="description" content="" />
			<link href="res/static/css/base.css" rel="stylesheet">
			<link href="res/static/css/index.css" rel="stylesheet">
			<link href="res/static/css/media.css" rel="stylesheet">
			
			<script type="text/javascript" src="res/static/js/util/time.js"></script>
			<script type="text/javascript" src="res/static/js/util/myfocus-2.0.4.min.js"></script>
			<!--[if lt IE 9]>
			<script src="res/static/js/util/modernizr.js"></script>
			<![endif]-->
			
			<script type="text/javascript" src="res/static/js/up/jquery.js"></script>
			<script type="text/javascript" src="res/static/js/up/js.js"></script>
			
			<style type="text/css">
			
				#a{
					background-color: pink;
				}
				#b{
					
					background-color: lightskyblue;
				}
				
				#a1{
					line-height: 80px;
				}
				
				body{
					background-color: white;
					
				}
				.topbg{
					font-size: 18px;
					font-family: "微软雅黑";
					
				}
				
			</style>
</head>
<body>
			<div class="comm">
				<form action="comm.do" method="post" onsubmit="return sub()">
		      		<h3><strong>发表评论:</strong></h3>
		      		<p>
				      	<span>标题：</span>
				      	<input type="text" id="comm_title" name="comm_title" class="text" onblur="check1()" onfocus="re1()">
				      	<span style="color:red" id="aaa"></span>
				    </p>
				    <p>
				      	<span>内容：</span>
				      	<textarea rows="10" id="comm_content" name="comm_content" cols="30" class="text-textarea" onblur="check2()" onfocus="re2()"></textarea>
				      	<span style="color:red" id="bbb"></span>
				    </p>
				    <p>
				      	<button class="btn">发表</button>
				    </p>
				    <span style="color:red" id="comm_msg"></span>
	      		</form>
				
			</div>
</body>
</html>