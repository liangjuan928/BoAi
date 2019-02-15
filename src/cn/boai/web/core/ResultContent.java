package cn.boai.web.core;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

public class ResultContent {
	 private String url;  //表示要跳转或重定向到的资源的URL
	 private Object obj;  //将响应数据封装为对象
	 private  AttrType attrType;   //响应数据要放在哪个作用域
	      
	    public ResultContent(String url) {  
	        this.url = url;  
	    }  
	      
	    public ResultContent(Object obj) {  
	        this.obj = obj;  
	    }  
	    public ResultContent(String url,Object obj) {  
	    	this.url = url; 
	        this.obj = obj;  
	    }  
	    public ResultContent(Object obj,AttrType attrType) {  
	        this.obj = obj;  
	        this.attrType=attrType;
	    } 
	    public ResultContent(String url,Object obj,AttrType attrType) {  
	    	this.attrType=attrType;
	    	this.url = url; 
	        this.obj = obj;  
	    }  
	      
	    public String getUrl() {  
	        return url;  
	    }  
	      //将响应对象转换为json格式
	    public String getJson() { 
	    	return new Gson().toJson(obj);
	    }

		public AttrType getAttrType() {
			return attrType;
		}  
}
