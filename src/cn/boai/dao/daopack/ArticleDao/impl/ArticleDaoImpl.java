package cn.boai.dao.daopack.ArticleDao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import cn.boai.dao.daopack.ArticleDao.ArticleDao;
import cn.boai.db.DBHelper;
import cn.boai.pojo.Article;
import cn.boai.pojo.Order;
import cn.boai.pojo.Product;
import cn.boai.util.UUIDHelp;

public class ArticleDaoImpl implements ArticleDao {

	@Override
	public boolean saveArticle(Article article, Connection conn) throws Exception {
		boolean flag = false;
		String sql = "insert into article(article_id,article_title,article_time,article_body,article_defalt) values(?,?,?,?,?)";
		PreparedStatement ps = null;
		ps = conn.prepareStatement(sql);
		ps.setInt(1,article.getArticle_id());
		ps.setString(2,article.getArticle_title());
		ps.setDate(3,article.getArticle_time());
		ps.setString(4,article.getArticle_body());
		ps.setString(5,article.getArticle_def());
		int n = ps.executeUpdate();
		if (n > 0) {
			flag = true;
		}
		ps.close();
		return flag;
	}
	/**
	 * 测试插入功能(插入成功)
	 */
	@Test
	public void Test(){
		Connection conn=DBHelper.getConnection();
		Article article=new Article();
		article.setArticle_id(1);
		article.setArticle_title("baobao");
		article.setArticle_body("body");
		Date date=new Date(1200);
		article.setArticle_time(date);
		article.setArticle_def("defalut");
		try {
			if(saveArticle(article, conn)){
				System.out.println("插入成功");
			}else{
				System.out.println("插入失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	

	@Override
	public boolean updateArticle(Article article, Connection conn) throws Exception {
		boolean flag = false;
		String sql = "update article set article_title=?,article_time=?,article_body=?,article_defalt=? where article_id=?";
		PreparedStatement ps = null;
		ps = conn.prepareStatement(sql);
		ps.setString(1, article.getArticle_title());
		ps.setDate(2, article.getArticle_time());
		ps.setString(3, article.getArticle_body());
		ps.setString(4, article.getArticle_def());
		ps.setInt(5, article.getArticle_id());
		int n = ps.executeUpdate();
		if (n > 0) {
			flag = true;
		}
		ps.close();
		return flag;
	}
	
	/**
	 * 测试更新方法
	 */
	@Test
	public void testUpdate(){
		Connection conn=DBHelper.getConnection();
		Article article=new Article();
		article.setArticle_id(1);
		article.setArticle_title("munin");
		article.setArticle_body("body");
		Date date=new Date(1200);
		article.setArticle_time(date);
		article.setArticle_def("defalut");
		try {
		if(	updateArticle(article, conn)){
			System.out.println("更新成功");
		}else{
			System.out.println("更新失败");
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	

	@Override
	public boolean deleteArticle(String id, Connection conn) throws Exception {
		boolean flag = false;
		String sql = "delete from article where article_id = ?";
		PreparedStatement ps = null;
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		int n = ps.executeUpdate();
		System.out.println("nnn:"+n);
		if (n > 0) {
			flag = true;
		}
		ps.close();
		return flag;
	}
	
	/**
	 * 测试删除方法
	 */
	@Test
	public void testDelete(){
		Connection conn=DBHelper.getConnection();
		
		try {
		if(	deleteArticle("1", conn)){
			System.out.println("删除成功");
		}else{
			System.out.println("删除失败");
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	@Override
	public Article selectArticleById(String id, Connection conn) throws Exception {
		Article article = null;
		String sql = "select * from article where article_id = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		rs = ps.executeQuery();
		if (rs.next()) {
			article = new Article();
			article.setArticle_id(rs.getInt("article_id"));
			article.setArticle_title(rs.getString("article_title"));
			article.setArticle_time(rs.getDate("article_time"));
			article.setArticle_body(rs.getString("article_body"));
			article.setArticle_def(rs.getString("article_defalt"));
		}
		rs.close();
		ps.close();
		return article;
	}
	/**
	 * 测试selectArticleById方法 （成功）
	 */
	@Test
	public void  Testsa(){
		Connection conn=DBHelper.getConnection();
		try {
			if(selectArticleById("1",conn)!=null){
				System.out.println("选择成功");
			}else{
				System.out.println("选择失败");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

	@Override
	public List<Article> selectAllArticle(Connection conn) throws Exception {
		List<Article> list = new ArrayList<Article>();
		String sql = "select * from article ";
		PreparedStatement ps = null;
		ResultSet rs = null;
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		Article article=null;
		while (rs.next()) {
			article = new Article();
			article.setArticle_id(rs.getInt("article_id"));
			article.setArticle_title(rs.getString("article_title"));
			article.setArticle_time(rs.getDate("article_time"));
			article.setArticle_body(rs.getString("article_body"));
			article.setArticle_def(rs.getString("article_defalt"));
			list.add(article);
		}
		rs.close();
		ps.close();
		return list;
	}
	/**
	 * 测试selectAllOrder方法 
	 */
	@Test
	public void Testsaa(){
		Connection conn=DBHelper.getConnection();
		try {
			if(selectAllArticle(conn).size()==1){
				System.out.println("全选成功");
			}else{
				System.out.println("全选失败");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
