package servlet;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import pojo.User;

public class SingleSign implements HttpSessionAttributeListener {
	Map<String,HttpSession>  map=new HashMap<>();
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		System.out.println("进入属性添加方法");
		String name=event.getName();
		if("user".equals(name)){    //确保只对键名为user的属性进行操作
			 User user=(User)event.getValue();
			   if(map.get(user.getId())!=null){   //说明在其他机子上有登陆
				System.out.println("map中已经存在该用户");
				HttpSession session= map.get(user.getId()); //拿出老的那个session
			    User user2=(User)session.getAttribute("user");   //从老的那个seeion中拿到之前的ip
			    System.out.println(user2.getUsername()+ "已经登录，该登录将被迫下线。+=======================");
			    session.removeAttribute(name);
			    session.setAttribute("mesg", "您的帐号已经在其他机器上登录，您被迫下线。+==============");
			   }
			   map.put(user.getId(), event.getSession());  //放入新的session
			   System.out.println("第一次登陆已经成功");
			   System.out.println("map"+map.get(user.getId()));
		}
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		String name=event.getName();
		System.out.println("将"+name+"属性移除");
		if("user".equals(name)){
			User user=(User)event.getValue();
			map.remove(user.getId());
			System.out.println(user.getUsername()+"已经从Map中移除");
		}
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
		String name=event.getName();
		if("user".equals(name)){
			User olduser=(User)event.getValue();
			map.remove(olduser.getId());
			
			User user=(User)event.getSession().getAttribute(name);//获得最新的session
			// 也要检查新登录的帐号是否在别的机器上登录过
			if(map.get(user.getId())!=null){   //说明在其他机子上有登陆
				HttpSession session= map.get(user.getId()); //拿出老的那个session
			    User user2=(User)session.getAttribute("user");   //从老的那个seeion中拿到之前的ip
			    System.out.println(user2.getUsername()+ "已经登录，该登录将被迫下线。+--------------------");
			    session.removeAttribute(name);
			    session.setAttribute("mesg", "您的帐号已经在其他机器上登录，您被迫下线。+---------------");
			   
			}
			
		}
	
	}

}
