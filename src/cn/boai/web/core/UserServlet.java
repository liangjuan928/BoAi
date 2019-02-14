package cn.boai.web.core;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.boai.web.form.ActionForm;



public class UserServlet extends HttpServlet{
 @Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// 通过请求的名字找到对应的Action实例进行处理
			Properties config = (Properties) this.getServletContext().getAttribute("config");

			// 保证创建的Action实例不重复
			Properties actionPool = (Properties) this.getServletContext().getAttribute("actionPool");

			String uri = req.getRequestURI();
			int a = uri.lastIndexOf("/");
			int b = uri.lastIndexOf(".");
			uri = uri.substring(a + 1, b); // 得到login.do 中的login
			System.out.println("进入servlet,得到的名字" + uri);
			// 在配置文件中找到对应处理的类
			String classname = (String) config.get(uri);
			System.out.println("找到对应处理的类" + classname);

			// 判断actionpool中是否已经存在该classname的实例
			Action action = null;
			try {
				action = (Action) actionPool.get(classname);
				if (action == null) {   //如果池中不存在该类型的action，则创建一个，并且加入actionpool中
					action = (Action) Class.forName(classname).newInstance();
					actionPool.put(classname, action);
					System.out.println("创建了一个新的action");
				} 
			} catch (Exception e) {
				e.printStackTrace();
			}
			//------为了使得LoginAction更方便的取得客户端的属性值，使用LoginForm包装好login页面的数据----
			String formname=config.getProperty(uri+"Form");
			ActionForm actionform=null;
			try {
				//loginform需要不断的new出新实例，因为用户提交的数据可能每一次都不一样
				System.out.println("formname==============="+formname);
			   Class c=Class.forName(formname);
			   actionform=(ActionForm)c.newInstance();
			   
				//现在从请求中拿到所有的值
				Map<String,String[]> map=req.getParameterMap();
				Set<Entry<String,String[]>> set=map.entrySet();
				for (Entry<String, String[]> entry : set) {   //这里的key要和表单域的name以及loginform的属性名字保持相同
					String key=entry.getKey();
					String[] values=entry.getValue();
					System.out.println(key+"====="+values[0]);
					
//					Field fileclass=c.getField(key);  //拿到属性对象的类型    (因为c是LoginForm的实例，所以不能找到父类的param属性)
					
//					Field file=c.getDeclaredField(key);         //使用getDeclaredField()可以拿到父类的属性
//					file.setAccessible(true);                   //    设置访问权限  （这样可以获得私有属性）
//					System.out.println("fileclass"+file);
					
					
					String methodname="set"+key.substring(0,1).toUpperCase()+key.substring(1);
					System.out.println("拿到的set方法名"+methodname+"----------拿到的属性值"+entry.getValue()[0]);
					Method method=c.getMethod(methodname,new Class[]{String.class});
					method.invoke(actionform, entry.getValue());
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ActionResult af = action.execute(req, resp,actionform);  //这里调用的实际是子类loginaction的execute方法
//			af.forward(req, resp);
		}
		@Override
		public void init() throws ServletException {
			String path = this.getServletContext().getRealPath("/");
			path += this.getInitParameter("configLocation");
			Properties config = new Properties();
			Properties actionPool = new Properties();// 为什么这里不用加载？因为不需要初始化加载
			try {
				config.load(new FileInputStream(path));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			this.getServletContext().setAttribute("config", config);
			this.getServletContext().setAttribute("actionPool", actionPool);
		}

}
