<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="css/shop.css" type="text/css" rel="stylesheet" />
<link href="css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/common.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js" type="text/javascript"></script>
<script src="js/respond.min.js"></script>
<script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<title>单页面</title>
</head>

<body>
<div class="margin" id="page_style">
 <div class="Single_page">
  <div class="Prompt"><b>提示：</b>本管理项目中的界面为静态单界面,可作为活动页,紧急通知等短期界面使用。</div>
  <div class="operation margin-sx">
<button class="btn button_btn btn-danger" type="button" onclick=""><i class="fa fa-trash-o"></i>&nbsp;删除</button>
<span class="submenu"><a href="javascript:void(0)" name="add_Singlepag.jsp" class="btn button_btn bg-deep-blue" title="添加单页"  onclick="add_columns()"><i class="fa  fa-edit"></i>&nbsp;添加单页</a></span>
</div>
  <div class="Single_page_list margin-sx">
    <ul>
     <li class="page_list_content">
      <a href="#" class="link_name"></a>
     <a  href="javascript:void()" onclick="page_delete(this,'2')" class="page_delete fa fa-times display"></a>
     <a  href="javascript:void()" onclick="page_modify(this,'2')" class="page_modify fa fa-edit display"></a>
       <div class="title_name">2016年秋季大促最新活动</div>
       <div class="page_info">
       基本简介就是为了促进某种商品或服务的销售而进行降价或是赠送礼品等的行为活动，能在短期内达到促进销售，提升业绩，增加收益。促销活动种类1、限时折扣
       </div>
       <div class="time">2016-05-12 12:23:34</div>
     </li>
      <li class="page_list_content">
     <a  href="javascript:void()" onclick="page_delete(this,'2')" class="page_delete fa fa-times display"></a>
     <a  href="javascript:void()" onclick="page_modify(this,'2')" class="page_modify fa fa-edit display"></a>
       <div class="title_name">2016年秋季大促最新活动</div>
       <div class="page_info">
       基本简介就是为了促进某种商品或服务的销售而进行降价或是赠送礼品等的行为活动，能在短期内达到促进销售，提升业绩，增加收益。促销活动种类1、限时折扣
       </div>
       <div class="time">2016-05-12 12:23:34</div>
     </li>
      <li class="page_list_content">
     <a  href="javascript:void()" onclick="page_delete(this,'2')" class="page_delete fa fa-times display"></a>
     <a  href="javascript:void()" onclick="page_modify(this,'2')" class="page_modify fa fa-edit display"></a>
       <div class="title_name">2016年秋季大促最新活动</div>
       <div class="page_info">
       基本简介就是为了促进某种商品或服务的销售而进行降价或是赠送礼品等的行为活动，能在短期内达到促进销售，提升业绩，增加收益。促销活动种类1、限时折扣
       </div>
       <div class="time">2016-05-12 12:23:34</div>
     </li>
      <li class="page_list_content">
     <a  href="javascript:void()" onclick="page_delete(this,'2')" class="page_delete fa fa-times display"></a>
     <a  href="javascript:void()" onclick="page_modify(this,'2')" class="page_modify fa fa-edit display"></a>
       <div class="title_name">2016年秋季大促最新活动</div>
       <div class="page_info">
       基本简介就是为了促进某种商品或服务的销售而进行降价或是赠送礼品等的行为活动，能在短期内达到促进销售，提升业绩，增加收益。促销活动种类1、限时折扣
       </div>
       <div class="time">2016-05-12 12:23:34</div>
     </li>
      <li class="page_list_content">
     <a  href="javascript:void()" onclick="page_delete(this,'2')" class="page_delete fa fa-times display"></a>
     <a  href="javascript:void()" onclick="page_modify(this,'2')" class="page_modify fa fa-edit display"></a>
       <div class="title_name">20 16年秋季大促最新活动</div>
       <div class="page_info">
       基本简介就是为了促进某种商品或服务的销售而进行降价或是赠送礼品等的行为活动，能在短期内达到促进销售，提升业绩，增加收益。促销活动种类1、限时折扣
       </div>
       <div class="time">2016-05-12 12:23:34</div>
     </li>
    </ul>  
  </div>
 </div>
</div>
</body>
</html>
<script>
//设置框架
 $(function() { 
	$("#page_style").frame({
		hover_btn:'.Single_page_list li',
		menu_nav:'.operation',
		minStatue : false,
	});
});
/*******滚动条*******/
$("body").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
});
</script>
