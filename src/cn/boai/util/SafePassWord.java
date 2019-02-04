package cn.boai.util;

import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class SafePassWord {
	 /**
  	 * 加密密码
  	 * @throws Exception 
  	 */
  	public static  String encodePassword(String pass ,String encodestr) throws Exception{
  		 KeyGenerator kgen = KeyGenerator.getInstance("AES");// 创建AES的Key生产者
  		
          kgen.init(128, new SecureRandom(pass.getBytes()));// 利用用户密码作为随机数初始化出
                                                                  // 128位的key生产者
            //加密没关系，SecureRandom是生成安全随机数序列，password.getBytes()是种子，只要种子相同，序列就一样，所以解密只要有password就行

            SecretKey secretKey = kgen.generateKey();// 根据用户密码，生成一个密钥

           byte[] enCodeFormat = secretKey.getEncoded();// 返回基本编码格式的密钥，如果此密钥不支持编码，则返回
           SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");// 转换为AES专用密钥

           Cipher cipher = Cipher.getInstance("AES");// 创建密码器

          byte[] byteContent = encodestr.getBytes();

           cipher.init(Cipher.ENCRYPT_MODE, key);// 初始化为加密模式的密码器

            byte[] result = cipher.doFinal(byteContent);// 加密

             return bytesToHexFun3(result);     //将加密后的字节数组转换为十六进制数
  	}
	/**
 	 * 解密密码
 	 */
 	public static String decodePassword(String pass ,String encodestr) throws Exception{
 		       KeyGenerator kgen = KeyGenerator.getInstance("AES");   // 创建AES的Key生产者
 		             kgen.init(128, new SecureRandom(pass.getBytes()));
 		             SecretKey secretKey = kgen.generateKey();    // 根据用户密码，生成一个密钥
 	                byte[] enCodeFormat = secretKey.getEncoded();    // 返回基本编码格式的密钥
 		            SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");   // 转换为AES专用密钥
 		            Cipher cipher = Cipher.getInstance("AES");   // 创建密码器
 		             cipher.init(Cipher.DECRYPT_MODE, key);       // 初始化为解密模式的密码器
 		             //将十六进制字符串转换为字节数组再解密
 		             byte[] b=toBytes(encodestr);
 		            byte[] result = cipher.doFinal(b);  
 		            return new String(result); // 明文   
 	}
 	/**
 	 * 字节数组转换为十六进制
 	 * @param bytes
 	 * @return
 	 */
 	 public static String bytesToHexFun3(byte[] bytes) {
 		StringBuffer sb = new StringBuffer();  
 	    for(int i = 0; i < bytes.length; i++) {  
 	        String hex = Integer.toHexString(bytes[i] & 0xFF);  
 	        if(hex.length() < 2){  
 	            sb.append(0);  
 	        }  
 	        sb.append(hex);   
 	    }  
 	    return sb.toString();    
     }
 	 
 	 /**
 	  * 将十六进制字符串转换为字节数组
 	  * @param str
 	  * @return
 	  */
 	public static byte[] toBytes(String str) { 
 		int hexlen = str.length();  
 	    byte[] result;  
 	    if (hexlen % 2 == 1){  
 	        //奇数  
 	        hexlen++;  
 	        result = new byte[(hexlen/2)];  
 	       str="0"+str;  
 	    }else {  
 	        //偶数  
 	        result = new byte[(hexlen/2)];  
 	    }  
 	    int j=0;  
 	    for (int i = 0; i < hexlen; i+=2){  
 	        result[j]= (byte) Integer.parseInt(str.substring(i,i+2),16);
 	        j++;  
 	    }  
 	    return result;   
 	
 		}
}
