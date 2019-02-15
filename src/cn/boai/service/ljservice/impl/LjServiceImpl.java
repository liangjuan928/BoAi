package cn.boai.service.ljservice.impl;

import java.sql.Connection;
import java.util.Date;

import cn.boai.dao.daopack.ArticleDao.ArticleDao;
import cn.boai.dao.daopack.ArticleDao.impl.ArticleDaoImpl;
import cn.boai.db.DBHelper;
import cn.boai.pojo.Article;
import cn.boai.service.ljservice.LjService;
import cn.boai.web.form.ljform.AddArticleForm;

public class LjServiceImpl implements LjService{
      ArticleDao ad=new ArticleDaoImpl();

	@Override
	public boolean addArticle(AddArticleForm form) {
		Connection conn=DBHelper.getConnection();
		Article article=new Article();
		article.setArticle_title(form.getTitle());
		article.setArticle_body(form.getConent());
		article.setArticle_describe(form.getDescribe());
		Date date=new Date();
		java.sql.Date date2 =new java.sql.Date(date.getTime());
		article.setArticle_time(date2);
		boolean result=false;
		try {
			result=ad.saveArticle(article, conn);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
      
	
}
