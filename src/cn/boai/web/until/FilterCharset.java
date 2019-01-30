package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

public class FilterCharset implements Filter{
	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest )request;
		HttpServletResponse resp=(HttpServletResponse )response;
	
		 String method=req.getMethod();  //获取传送方式
		   if("post".equalsIgnoreCase(method)){
			   req.setCharacterEncoding("utf-8");
		   }
		   if ("get".equalsIgnoreCase(method)){
			   //创建request装饰实现类
			  req=new Myservlet(req);
//			 所有参数信息
//				Map map = req.getParameterMap();
//				Collection coll = map.values();
//				Iterator it = coll.iterator();
//				while(it.hasNext()){
//					String[] strs = (String[])it.next();
//					for(int i=0;i<strs.length;i++){
//						strs[i] = new String(strs[i].getBytes("ISO8859-1"),"UTF-8");
//						 System.out.println("------------："+strs[i]);
//					}
//				}
//		   }
		   }
//		   response.setContentType("text/html;charset=utf-8");
		   response.setCharacterEncoding("utf-8");
           chain.doFilter(req, resp); //传递给下一个过滤器
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

 
}
class Myservlet extends HttpServletRequestWrapper{

	public Myservlet(HttpServletRequest request) {
		super(request);
	}
	@Override
	public String getParameter(String name) {
		// TODO Auto-generated method stub
		String value=super.getParameter(name);
		String valueLast=null;
		try {
			/*
			 * 判断value是否是null，
			 * 如果是会null，那么就给valueLast赋值null，
			 * 如果不是，就将value的内容用ISO-8859-1解码，然后用UTF-8在编码后返回一个字符串给valueLast
			 */
			valueLast = value==null?null:new String(value.getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return valueLast;
	}
	
	
	
	
	
}
