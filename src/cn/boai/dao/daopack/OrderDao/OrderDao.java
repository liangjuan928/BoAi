package cn.boai.dao.daopack.OrderDao;

import java.sql.Connection;
import java.util.List;

import cn.boai.pojo.Order;
import cn.boai.pojo.Product;

public interface OrderDao {
	public boolean saveOrder(Order user,Connection conn) throws Exception;
	public boolean updateOrder(Order user,Connection conn) throws Exception;
	public boolean deleteOrder(String id,Connection conn) throws Exception;
	public Order selectOrderById(String id,Connection conn) throws Exception;
	public List<Order> selectAllOrder(Connection conn) throws Exception;
}
