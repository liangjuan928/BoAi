package cn.boai.web.action.ljaction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	public ActionResult addArticle(HttpServletRequest request, HttpServletResponse reponse, ActionForm form)
			throws ServletException, IOException {
		AddArticleForm cf = (AddArticleForm) form;
		boolean result = ls.addArticle(cf);
		ActionResult ar = null;
		ResultContent rc = new ResultContent("add_articl", result);
		if(result){
			System.out.println("添加成功");
		}else{
			System.out.println("添加失败");
		}
		ar = new ActionResult(rc, ResultType.Redirect); // 转发到add_articl在属性文件中对应的jsp页面
		return ar;
	}
}
