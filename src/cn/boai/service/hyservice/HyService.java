package cn.boai.service.hyservice;

import cn.boai.pojo.Order1;
import cn.boai.pojo.User;

public interface HyService {
	public User queryUserById(String uid);
	public boolean removeCart(String uid,String pid);
	public boolean addOrder(Order1 users);
}
