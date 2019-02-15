package cn.boai.web.action.ljaction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.boai.web.core.ActionResult;
import cn.boai.web.core.DispatcherAction;
import cn.boai.web.form.ActionForm;
import cn.boai.web.form.ljform.AddArticleForm;

public class AddArticleAction extends DispatcherAction {
	public ActionResult addArticle(HttpServletRequest request,
			HttpServletResponse reponse, ActionForm form)
			throws ServletException, IOException {
		System.out.println("加");
		AddArticleForm cf  = (AddArticleForm)form;
//		request.setAttribute("result", Integer.parseInt(cf.getFirst())+Integer.parseInt(cf.getSecond()));
//		return new ActionForward("show");
		return null;
	}
}
