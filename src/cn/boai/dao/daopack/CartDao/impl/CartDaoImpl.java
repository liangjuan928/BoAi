package cn.boai.dao.daopack.CartDao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import cn.boai.dao.daopack.CartDao.CartDao;
import cn.boai.pojo.Cart;

public class CartDaoImpl implements CartDao{
	public boolean deleteCart(String uid, String pid, Connection conn) throws Exception {
		boolean flag = false;
		String sql = "delete from cart where user_id = ? and pro_id = ?";
		PreparedStatement ps = null;

		ps = conn.prepareStatement(sql);
		ps.setString(1, uid);
		ps.setString(2, pid);
		int n = ps.executeUpdate();
		if (n > 0) {
			flag = true;
		}
		ps.close();
		return flag;
	}

	public boolean saveCart(Cart c, Connection conn) throws Exception {
		return false;
	}

	@Override
	public boolean updateCart(Cart c, Connection conn) throws Exception {
		// TODO 自动生成的方法存根
		return false;
	}

	@Override
	public Cart selectCartById(String uid, String pid, Connection conn) throws Exception {
		// TODO 自动生成的方法存根
		return null;
	}

	@Override
	public List<Cart> selectAllCart(Connection conn) throws Exception {
		// TODO 自动生成的方法存根
		return null;
	}

}
