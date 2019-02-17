package cn.boai.web.action.zwtaction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.boai.service.zwtservice.ZwtService;
import cn.boai.service.zwtservice.impl.ZwtServiceImpl;
import cn.boai.web.core.ActionResult;
import cn.boai.web.core.DispatcherAction;
import cn.boai.web.core.ResultContent;
import cn.boai.web.core.ResultType;
import cn.boai.web.form.ActionForm;
import cn.boai.web.form.zwtform.AddProductForm;

public class AddProductAction extends DispatcherAction {
	ZwtService zs = new ZwtServiceImpl();

	public ActionResult addProduct(HttpServletRequest request, HttpServletResponse reponse, ActionForm form)
	 		throws ServletException, IOException {
		System.out.println("aaaaaaaaa");
		AddProductForm af = (AddProductForm) form;
		boolean result = zs.addProduct(af);
		ActionResult ar = null;
		ResultContent rc = new ResultContent("add_product_jsp", result);
		if(result){
			System.out.println("添加产品成功");
		}else{
			System.out.println("添加产品失败");
		}
		ar = new ActionResult(rc, ResultType.Redirect);
		return ar;
	}
}
