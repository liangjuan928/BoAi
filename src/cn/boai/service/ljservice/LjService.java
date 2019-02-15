package cn.boai.service.ljservice;

import java.util.List;

import com.mysql.jdbc.Connection;

import cn.boai.pojo.Address;
import cn.boai.pojo.Article;
import cn.boai.web.form.ljform.AddArticleForm;

public interface LjService {
	public boolean addArticle(AddArticleForm form);
	public List<Article> selectAllActicle();
}
