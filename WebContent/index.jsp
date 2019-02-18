<%@page import="cn.boai.pojo.User"%>
<%@page import="cn.boai.service.hyservice.impl.HyServiceImpl"%>
<%@page import="cn.boai.service.hyservice.HyService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
	String divid="1";
	pageContext.setAttribute("divid", divid);
 %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>博爱母婴商城首页 </title>
  <link rel="stylesheet" type="text/css" href="res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="res/layui/css/layui.css">
  <script type="text/javascript" src="res/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
  <script type="text/javascript">
  		var xmlHttp;
		function createXmlHttp(){
			if(window.XMLHttpRequest){//是火狐内核的
				xmlHttp = new XMLHttpRequest();
			}else{//IE内核
				try{
					xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
				}catch(e){
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
			} 
		}
  	    function show(id){
			//将id使用ajax传入后台，查出一个user的信息（String）
			if(!xmlHttp){
				createXmlHttp();
			}
			id = encodeURI(encodeURI(id));
			xmlHttp.open("GET","moudiv.do?divid="+id,true);
			xmlHttp.onreadystatechange=callback2;
			xmlHttp.send();
		}  
		var result;
		function callback2(){
			if(xmlHttp.readyState==4){
				if(xmlHttp.status==200){
					result= xmlHttp.responseText;//String的json
				    console.log(result);
				}
			}
		}
		
		var div;
		
		function showPosition(){
		    console.log(div+"----------");
			/* if(div){
				div.style.display="none";
			} */
			div = document.createElement("div");
			div.style.position = "absolute";
			div.style.top=event.y+5;
			div.style.left=event.x+5;
			div.style.width="111px";
			div.style.height="55px";
			div.style.color="white";
			//div.style.background="pink";
			div.style.backgroundImage="url('res/static/img/b1.jpg')";
			div.style.backgroundSize="cover";
			div.style.display="block";
			
			var msg="账户："+JSON.parse(result).user_name+"<br/>"
					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
					+"等级:"+JSON.parse(result).user_level ;
			div.innerHTML="<img src='res/static/img/b2.jpg'/>"+msg;
			document.getElementById("divp").appendChild(div);
		}
		
		function removeDiv(){
			if(div){
				div.style.display="none";
				//document.divpp.removeChild(div);
			}
		} 
		
  </script>
</head>


<body id="list-cont">
  <div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="#">首页 </a>
      </p>
      <div class="sn-quick-menu" id="divp">
        <div id="${divid}" name="divp" onmouseenter="show('${divid}')" 
    					onmouseover="showPosition()" onmouseout="removeDiv()">
    		 mousediv &nbsp;&nbsp;&nbsp;
    	</div>
        <div class="login"><a href="login.jsp">登录</a></div>
        <div class="sp-cart"><a href="shopcart.jsp">购物车</a><span>2</span></div>
      </div>
    </div>
  </div>


  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="#" title="母婴商城">
            <img src="res/static/img/logo.png">
          </a>
        </h1>
        <div class="mallSearch">
          <form action="" class="layui-form" novalidate>
            <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
            <button class="layui-btn" lay-submit lay-filter="formDemo">
                <i class="layui-icon layui-icon-search"></i>
            </button>
            <input type="hidden" name="" value="">
          </form>
        </div>
      </div>
    </div>
  </div>


  <div class="content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href="commodity.jsp" class="active">所有商品</a>
            <a href="buytoday.jsp">今日团购</a>
            <a href="information.jsp">母婴资讯</a>
            <a href="about.jsp">关于我们</a>
          </div>
        </div>
      </div>
    </div>
    <div class="category-con">
      <div class="category-inner-con w1200">
        <div class="category-type">
          <h3>全部分类</h3>
        </div>
        <div class="category-tab-content">
          <div class="nav-con">
            <ul class="normal-nav layui-clear">
              <li class="nav-item">
                <div class="title">奶粉辅食</div>
                <p><a href="#">奶粉</a><a href="#">捕食</a><a href="#">营养品</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">纸尿裤</div>
                <p><a href="#">纸尿裤</a><a href="#">婴儿湿巾</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">洗护用品</div>
                <p><a href="#">母婴洗护用品</a><a href="#">孕婴童用品</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">儿童玩具</div>
                <p><a href="#">婴幼玩具</a><a href="#">遥控玩具</a><a href="#">积木拼插</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">车窗座椅</div>
                <p><a href="#">婴儿推车</a><a href="#">儿童安全座骑</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">儿童童鞋</div>
                <p><a href="#">童装</a><a href="#">童鞋</a><a href="#">婴童内衣及配饰</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item">
                <div class="title">儿童图片</div>
                <p><a href="#">0-2岁</a><a href="#">早教启蒙</a><a href="#">孕产育儿</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              <li class="nav-item nobor">
                <div class="title">孕妈专区</div>
                <p><a href="#">孕妇装</a><a href="#">背婴带</a><a href="#">母婴服务</a></p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="category-banner">
        <div class="w1200">
          <img src="res/static/img/banner1.jpg">
        </div>
      </div>
    </div>
    <div class="floors">
      <div class="sk">
        <div class="sk_inner w1200">
          <div class="sk_hd">
            <a href="javascript:;">
              <img src="res/static/img/s_img1.jpg">
            </a>
          </div>
          <div class="sk_bd">
            <div class="layui-carousel" id="test1">
              <div carousel-item>
                <div class="item-box">
                  <div class="item">
                    <a href="javascript:;"><img src="res/static/img/s_img2.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="res/static/img/s_img3.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="res/static/img/s_img4.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="res/static/img/s_img5.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                </div>
                <div class="item-box">
                  <div class="item">
                    <a href="javascript:;"><img src="res/static/img/s_img2.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="res/static/img/s_img3.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="res/static/img/s_img4.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="res/static/img/s_img5.jpg"></a>
                    <div class="title">宝宝五彩袜棉质舒服</div>
                    <div class="price">
                      <span>￥49.00</span>
                      <del>￥99.00</del>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>    
      </div>
    </div>






    <div class="hot-recommend-con">
      <div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>
       <div class="hot-con1 w1200 layui-clear">
          <div class="item">
            <h4>热销推荐</h4>
            <div class="big-img">
              <a href="javascript:;"><img src="res/static/img/hot1.png"></a>
            </div>
            <div class="small-img">
              <a href="javascript:;"><img src="res/static/img/hot2.png" alt=""></a>
            </div>
          </div>
          <div class="item">
            <div class="top-img">
              <a href="javascript:;"><img src="res/static/img/hot5.jpg"></a>
            </div>
            <div class="bottom-img">
              <a href="javascript:;"><img src="res/static/img/hot6.jpg"></a>
              <a class="baby-cream" href="javascript:;"><img src="res/static/img/hot7.jpg"></a>
            </div>
          </div>
          <div class="item item1 margin0 padding0">
            <a href="javascript:;"><img src="res/static/img/hot8.jpg"></a>
            <a href="javascript:;"><img class="btm-img" src="res/static/img/hot9.jpg"></a>
          </div>
      </div>
    </div>
    


    <div class="product-cont w1200" id="product-cont">
      <div class="product-item product-item1 layui-clear">
        <div class="left-title">
          <h4><i>1F</i></h4>
          <img src="../res/static/img/icon_gou.png">
          <h5>宝宝服饰</h5>
        </div>
        <div class="right-cont">
          <a href="javascript:;" class="top-img"><img src="res/static/img/img12.jpg" alt=""></a>
          <div class="img-box">
            <a href="javascript:;"><img src="res/static/img/s_img7.jpg"></a>
            <a href="javascript:;"><img src="res/static/img/s_img8.jpg"></a>
            <a href="javascript:;"><img src="res/static/img/s_img9.jpg"></a>
            <a href="javascript:;"><img src="res/static/img/s_img10.jpg"></a>
            <a href="javascript:;"><img src="res/static/img/s_img11.jpg"></a>
          </div>
        </div>
      </div>
      <div class="product-item product-item2 layui-clear">
        <div class="left-title">
          <h4><i>2F</i></h4>
          <img src="../res/static/img/icon_gou.png">
          <h5>奶粉辅食</h5>
        </div>
        <div class="right-cont">
          <a href="javascript:;" class="top-img"><img src="res/static/img/img12.jpg" alt=""></a>
          <div class="img-box">
            <a href="javascript:;"><img src="res/static/img/s_img7.jpg"></a>
            <a href="javascript:;"><img src="res/static/img/s_img8.jpg"></a>
            <a href="javascript:;"><img src="res/static/img/s_img9.jpg"></a>
            <a href="javascript:;"><img src="res/static/img/s_img10.jpg"></a>
            <a href="javascript:;"><img src="res/static/img/s_img11.jpg"></a>
          </div>
        </div>
      </div>
      <div class="product-item product-item3 layui-clear">
        <div class="left-title">
          <h4><i>3F</i></h4>
          <img src="res/static/img/icon_gou.png">
          <h5>宝宝用品</h5>
        </div>
        <div class="right-cont">
          <a href="javascript:;" class="top-img"><img src="res/static/img/img12.jpg" alt=""></a>
          <div class="img-box">
            <a href="javascript:;"><img src="res/static/img/s_img7.jpg"></a>
            <a href="javascript:;"><img src="res/static/img/s_img8.jpg"></a>
            <a href="javascript:;"><img src="res/static/img/s_img9.jpg"></a>
            <a href="javascript:;"><img src="res/static/img/s_img10.jpg"></a>
            <a href="javascript:;"><img src="res/static/img/s_img11.jpg"></a>
          </div>
        </div>
      </div>
    </div>

    <div class="product-list-box" id="product-list-box">
      <div class="product-list-cont w1200">
        <h4>更多推荐</h4>
        <div class="product-item-box layui-clear">
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more1.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more2.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more3.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more1.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more2.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more3.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more1.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more2.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more3.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more1.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more2.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more3.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more1.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more2.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more3.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more1.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more2.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more3.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more1.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more2.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more3.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more1.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more2.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more3.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more1.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more2.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
          <div class="list-item">
            <a href="javascript:;"><img src="res/static/img/more3.jpg"></a>
            <p>时尚宝宝小黄鸭T恤纯棉耐脏多色可选0-2岁宝宝</p>
            <span>￥100.00</span>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="footer">
    <div class="ng-promise-box">
      <div class="ng-promise w1200">
        <p class="text">
          <a class="icon1" href="javascript:;">7天无理由退换货</a>
          <a class="icon2" href="javascript:;">满99元全场免邮</a>
          <a class="icon3" style="margin-right: 0" href="javascript:;">100%品质保证</a>
        </p>
      </div>
    </div>
    <div class="mod_help w1200">                                     
      <p>
        <a href="javascript:;">关于我们</a>
        <span>|</span>
        <a href="javascript:;">帮助中心</a>
        <span>|</span>
        <a href="javascript:;">售后服务</a>
        <span>|</span>
        <a href="javascript:;">母婴资讯</a>
        <span>|</span>
        <a href="javascript:;">关于货源</a>
      </p>
      <p class="coty">母婴商城版权所有 &copy; 2012-2020 More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
    </div>
  </div>
  <script type="text/javascript">

layui.config({
    base: 'res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','carousel'],function(){
      var carousel = layui.carousel,
     mm = layui.mm;
     var option = {
        elem: '#test1'
        ,width: '100%' //设置容器宽度
        ,arrow: 'always'
        ,height:'298' 
        ,indicator:'none'
      }
      carousel.render(option);
      // 模版引擎导入
     // var ins = carousel.render(option);
     // var html = demo.innerHTML;
     // var listCont = document.getElementById('list-cont');
     // // console.log(layui.router("#/about.html"))
     //  mm.request({
     //    url: '../json/index.json',
     //    success : function(res){
     //      console.log(res)
     //      listCont.innerHTML = mm.renderHtml(html,res)
     //      ins.reload(option);
     //    },
     //    error: function(res){
     //      console.log(res);
     //    }
     //  })
    

});
  </script>
</body>
</html>