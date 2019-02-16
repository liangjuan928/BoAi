package cn.boai.dao.ljdao;

import java.sql.Connection;
import java.util.List;

import cn.boai.pojo.Article;

public interface LjDao {
	 public int getArticleMaxPageNum(int pagesize,Connection conn)throws Exception;  //获得最大页码数
	 public List<Article> SplitArticleList(int curpage,int pagesize,Connection conn)throws Exception;  //获得最大页码数
}
