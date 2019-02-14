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
<script src="js/Sellerber.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/jquery.dataTables.bootstrap.js"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/laydate/laydate.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js" type="text/javascript"></script>
<script src="js/respond.min.js"></script>
<script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<title>文章列表</title>
</head>

<body>
<div class="margin" id="page_style">
<div class="operation clearfix">
<button class="btn button_btn btn-danger" type="button" onclick=""><i class="fa fa-trash-o"></i>&nbsp;删除</button>
<span class="submenu"><a href="javascript:void(0)" name="add_Article.html" class="btn button_btn bg-deep-blue" title="添加文章"><i class="fa  fa-edit"></i>&nbsp;添加文章</a></span>
   <div class="search  clearfix">
 <label class="label_name">商品搜索：</label><input name="" type="text"  class="form-control col-xs-6"/><button class="btn button_btn bg-deep-blue " onclick=""  type="button"><i class="fa  fa-search"></i>&nbsp;搜索</button>
</div>
</div>
<!--列表展示-->
<div class="list_Exhibition margin-sx">
 <table class="table table_list table_striped table-bordered" id="sample-table">
  <thead>
  <tr>
  <th width="30"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
   <th width="80">排序</th>
   <th>文章名称</th>   
   <th width="80">分类</th>
   <th width="80">浏览次数</th>
   <th width="150">添加日期</th>
   <th width="200">操作</th>
   </tr>   
  </thead>
  <tbody>
   <tr>
   </tr>
  </tbody>
 </table>
</div>
</div>
</body>
</html>
<script>
 $(function() { 
	$("#page_style").frame({
		float : 'left',
		menu_nav:'.operation',
		color_btn:'.skin_select',
	});
});
var dataSet=[
 ['<label><input type="checkbox" class="ace"><span class="lbl"></span></label>','','为什么收货地址里面没有我的地区所在的街道？','帮助中心','45','2016-07-01','<a href="javascript:ovid()" onclick="picture_stop(this,'+10001+')" class="btn bg-green operation_btn">查看</a> <a href="javascript:ovid()" onclick="picture_edit(this,'+123+')" class="btn bg-deep-blue operation_btn">修改</a> <a href="javascript:ovid()" onclick="picture_del(this,'+10001+')" class="btn btn-danger operation_btn">删除</a>  '],
  ['<label><input type="checkbox" class="ace"><span class="lbl"></span></label>','','浏览器cookie功能如何开启？？','帮助中心','45','2016-07-01','<a href="javascript:ovid()" onclick="picture_stop(this,'+10001+')" class="btn bg-green operation_btn">查看</a> <a href="javascript:ovid()" onclick="picture_edit(this,'+123+')" class="btn bg-deep-blue operation_btn">修改</a> <a href="javascript:ovid()" onclick="picture_del(this,'+10001+')" class="btn btn-danger operation_btn">删除</a>  '],
    ['<label><input type="checkbox" class="ace"><span class="lbl"></span></label>','',' 订单状态显示商品已发货，什么时候可以给客户送达？','帮助中心','45','2016-07-01','<a href="javascript:ovid()" onclick="picture_stop(this,'+10001+')" class="btn bg-green operation_btn">查看</a> <a href="javascript:ovid()" onclick="picture_edit(this,'+123+')" class="btn bg-deep-blue operation_btn">修改</a> <a href="javascript:ovid()" onclick="picture_del(this,'+10001+')" class="btn btn-danger operation_btn">删除</a>  '],
	  ['<label><input type="checkbox" class="ace"><span class="lbl"></span></label>','',' 刚刚我下了订单，我想查询下我的订单，如何查询？','帮助中心','45','2016-07-01','<a href="javascript:ovid()" onclick="picture_stop(this,'+10001+')" class="btn bg-green operation_btn">查看</a> <a href="javascript:ovid()" onclick="picture_edit(this,'+123+')" class="btn bg-deep-blue operation_btn">修改</a> <a href="javascript:ovid()" onclick="picture_del(this,'+10001+')" class="btn btn-danger operation_btn">删除</a>  '],
	  	  ['<label><input type="checkbox" class="ace"><span class="lbl"></span></label>','','关于促销产品注意事项','新闻动态','45','2016-07-01','<a href="javascript:ovid()" onclick="picture_stop(this,'+10001+')" class="btn bg-green operation_btn">查看</a> <a href="javascript:ovid()" onclick="picture_edit(this,'+123+')" class="btn bg-deep-blue operation_btn">修改</a> <a href="javascript:ovid()" onclick="picture_del(this,'+10001+')" class="btn btn-danger operation_btn">删除</a>  '],
];
 jQuery(function($) {
				var oTable1 = $('#sample-table').dataTable( {
				"data": dataSet,
				"width":"100%",	
				"bLengthChange":false,
				"iDisplayLength": 20,
				//"columns" : _tableCols,
				"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		        "bStateSave": true,//状态保存
				"searching": false,
		        "aoColumnDefs": [{"orderable":false,"aTargets":[0,2,3,5]
				}]
		
			   });
			   	//前台添加序号
//		     oTable1.on( 'order.dt search.dt', function () {
//	       	oTable1.column(1, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
//		    cell.innerHTML = i+1;
//		       } );
//		        } ).draw();
			
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			});
	/*文章-删除*/
function picture_del(obj,id){
	layer.confirm('确认要删除吗？',{icon:0,},function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
/*********滚动事件*********/
$("body").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
});
</script>
