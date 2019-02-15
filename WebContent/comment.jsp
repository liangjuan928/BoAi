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
			
			<script src="res/static/js/util/modernizr.js"></script>
			
			
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
				#comm{
					margin-left:20px;
				}
				
			</style>
	<script src="res/static/js/util/jquery.min.js"></script>
    <link href="res/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="res/static/css/font-awesome.min.css" rel="stylesheet">
    <script src="res/static/js/util/bootstrap.min.js"></script>
    
    <script type="text/javascript">
		function check1(){
			if(document.getElementById("comm_title").value=="")
				document.getElementById("aaa").innerHTML = "标题不能为空！";
		}
		
		function check2(){
			if(document.getElementById("comm_content").value=="")
				document.getElementById("bbb").innerHTML = "正文不能为空！";
		}
		
		function re1(){
			document.getElementById("aaa").innerHTML = "";
		}
		
		function re2(){
			document.getElementById("bbb").innerHTML = "";
		}
		
		function sub(){
			if(document.getElementById("aaa").innerHTML==""&&document.getElementById("bbb").innerHTML==""){
				alert("评论成功！");
				return true;
			}
			else{
				document.getElementById("bbb").innerHTML = "评论失败！";
				return false;
			}
		}
    </script>
</head>
<body>

	
	
			<div class="topnews">
		<h2><b>&emsp;已收到留言</b></h2>
		<br/>
	</div>
	<div id="show">
	  	<%-- <%ArrayList<Comment> list = (ArrayList<Comment>)request.getAttribute("list1"); %>
	  	<!-- 
	  	<table>
	    	<%--<%for(int i = 0;i<list.size();i++){ %>
	    		<tr>
	    			<td align="center" width="200px"><img class="media-object img-circle" img src="img/touxiang.jpeg" alt="媒体对象" width="80"></td>
		    		<td hidden="hidden"><%=list.get(i).getComm_id() %></td>
		    		<td width="500px">
			    		标题：<%=list.get(i).getComm_title() %>
			    		<p>
			    			评论：<%=list.get(i).getComm_content() %>
			    		</p>
			    	</td>
				</tr>
				<tr>
					<td align="center" height="40px"><%=list.get(i).getComm_author() %></td>
					<td hidden="hidden"></td>
					<td align="right">
					<%=list.get(i).getComm_date() %><br/>
					<hr/>
					</td>
				</tr>
	    	<%} %>
	    </table>
	     -->
	    
	    
	    <table>
	    	<%for(int i = 0;i<list.size();i++){ %>
	    		<tr>
	    			<td rowspan="2" align="center" width="150px" height="100px">
	    				<img class="media-object img-circle" img src="img/touxiang.jpeg" alt="媒体对象" width="80">
	    			</td>
	    			<td width="50px" align="right" valign="top">
	    				<b style="color:#db6d4c;">标题：</b>
	    			</td>
	    			<td align="left" valign="top">
	    				<p>
	    					<%=list.get(i).getComm_title() %>
	    				</p>
	    			</td>
				</tr>
				<tr>
	    			<td align="right" valign="top">
	    				<b style="color:#db6d4c;">评论：</b>
	    			</td>
	    			<td align="left" valign="top">
	    				<p>
	    					<%=list.get(i).getComm_content() %>
	    				</p>
	    			</td>
				</tr>
				<tr>
	    			<td align="center" height="40px">
	    				<b  style="color:#db6d4c;"><%=list.get(i).getComm_author() %></b>
	    			</td>
	    			<td colspan="2" align="right">
	    				<span style="font-size:14px; color:gray;"><%=list.get(i).getComm_date() %></span>
	    			</td>
				</tr>
				<tr>
					<td colspan="3">
						<hr/>
					</td>
				</tr>
	    	<%} %>
	    	 --%>
	    </table>
  	</div>
  	<br/>
  	<br/>
  	<br/>
  	<div class="topnews">
		<h2><b>&emsp;发布留言</b></h2>
	</div>
	<div class="form row" id="comm">
            <div class="form-horizontal">
                <form action="comm.do" method="post" onsubmit="return sub()">
                <div class="col-md-9">
                    <div class="form-group">
                       <h4 style="color:#db6d4c;">评价：</h4>
                          <input id="comm_title" name="comm_title" class="form-control required" type="text" placeholder="标题" maxlength="60" style="width: 600px;" onblur="check1()" onfocus="re1()"/><br/>
                          <input type="radio" name="comm_type" value="good">好评
                          <input type="radio" name="comm_type" value="normal">中评
                          <input type="radio" name="comm_type" value="bad">差评
                    	  <span style="color:red" id="aaa"></span>
                    </div>
                    <div class="form-group">
                            
                       <h4 style="color:#db6d4c;">评论内容：</h4>
                       <textarea id="comm_content" name="comm_content" class="form-control required" type="text" placeholder="请书写你的评论内容" style="height: 300px; width: 600px;" maxlength="800"  onblur="check2()" onfocus="re2()"></textarea><br/>
                       <span style="color:red" id="bbb"></span>
                    </div>
        
                    <div class="form-group col-md-offset-9">
                        <button class="btn">发表</button><br/>
                        <span style="color:red" id="comm_msg"></span>
                    </div>
                </div>
                </form>
    		</div>
    </div>
</body>
</html>