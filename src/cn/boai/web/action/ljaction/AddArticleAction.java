package cn.boai.web.action.ljaction;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import cn.boai.pojo.Article;
import cn.boai.service.ljservice.LjService;
import cn.boai.service.ljservice.impl.LjServiceImpl;
import cn.boai.web.core.ActionResult;
import cn.boai.web.core.DispatcherAction;
import cn.boai.web.core.ResultContent;
import cn.boai.web.core.ResultType;
import cn.boai.web.form.ActionForm;
import cn.boai.web.form.ljform.AddArticleForm;

public class AddArticleAction extends DispatcherAction {
	LjService ls = new LjServiceImpl();

	public ActionResult showAllArticle(HttpServletRequest request, HttpServletResponse reponse)
	 		throws ServletException, IOException {
			List<Article> list=ls.selectAllActicle();
			ActionResult ar = null;
			if(list!=null){   //选择正确
				ResultContent rc = new ResultContent("add_articl_jsp",list);
				ar = new ActionResult(rc, ResultType.Forward); // 转发到add_articl在属性文件中对应的jsp页面
			}else{   //全选错误
				ResultContent rc = new ResultContent("add_articl_jsp",list);
				ar = new ActionResult(rc, ResultType.Forward); // 转发到add_articl在属性文件中对应的jsp页面
			}
			
			
			
		
		return ar;
	   
	}
}
