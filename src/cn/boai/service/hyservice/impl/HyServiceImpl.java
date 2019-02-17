package cn.boai.service.hyservice.impl;

import java.sql.Connection;
import java.sql.SQLException;

import cn.boai.dao.daopack.CartDao.impl.CartDaoImpl;
import cn.boai.dao.daopack.UserDao.impl.UserDaoImpl;
import cn.boai.db.DBHelper;
import cn.boai.pojo.User;
import cn.boai.service.hyservice.HyService;

public class HyServiceImpl implements HyService{
	private UserDaoImpl ud=new UserDaoImpl();
	private CartDaoImpl cd=new CartDaoImpl();

	@Override
	public User queryUserById(String uid) {
		Connection conn = DBHelper.getConnection();
		User user = null;
		try {
			conn.setAutoCommit(false);
			user = ud.selectUserById(uid, conn);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally{
			DBHelper.closeConnection(conn);
		}
		return user;
	}

	public boolean removeCart(String uid,String pid) {
		Connection conn = DBHelper.getConnection();
		boolean flag = false;
		try {
			conn.setAutoCommit(false);
			flag = cd.deleteCart(uid,pid, conn);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally{
			DBHelper.closeConnection(conn);
		}
		return flag;
	}
}
