package org.micro.pub.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.Map;
import java.util.Map.Entry;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class HttpsUtil 
{
	public static Log log = LogFactory.getLog(HttpsUtil.class);
	public static String http(String url, Map<String, String> params, String logStr, String flag) throws Exception
	{
		StringBuffer sb = new StringBuffer();
		if (params != null)
		{
			for (Entry<String, String> e : params.entrySet())
			{
				sb.append(e.getKey());
				sb.append("=");
				sb.append(e.getValue());
				sb.append("&");
			}
			sb.replace(0, sb.length(), sb.substring(0, sb.length() - 1));
		}
		log.error("send_url:" + url);
		log.error("send_data:" + sb.toString());
		// 尝试发送请求
		HttpsURLConnection conn = null;
		try
		{
			// 创建SSLContext对象，并使用我们指定的信任管理器初始化
			TrustManager[] tm = { new AuthTrustManager() };
			SSLContext sslContext = SSLContext.getInstance("TLS");
			sslContext.init(null, tm, new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象
			SSLSocketFactory ssf = sslContext.getSocketFactory();
			// 创建URL对象
			URL u = new URL(null,url,new sun.net.www.protocol.https.Handler());
			HostnameVerifier hv = new HostnameVerifier() {
				public boolean verify(String urlHostName, SSLSession session) {
					return urlHostName.equals(session.getPeerHost());
				}
		    };
		    HttpsURLConnection.setDefaultHostnameVerifier(hv);
			conn = (HttpsURLConnection) u.openConnection();
			conn.setSSLSocketFactory(ssf);
	        conn.setRequestMethod("POST");
	        conn.setDoOutput(true);
	        conn.setDoInput(true);
	        conn.setUseCaches(false);
	        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			OutputStreamWriter osw = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
			osw.write(sb.toString());
			osw.flush();
			osw.close();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally
		{
			if (conn != null)
			{
				conn.disconnect();
			}
		}
		// 读取返回内容
		StringBuffer buffer = new StringBuffer();
		BufferedReader br = null;
		try
		{
			br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String temp;
			while ((temp = br.readLine()) != null)
			{
				buffer.append(temp);
				buffer.append("\n");
			}
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(br != null)
			{
				br.close();
			}
		}
		return buffer.toString();
	}

	public static void main(String[] args)
	{
//		String url = "https://ebspay.boc.cn/PGWPortal/RefundOrder.do";
//		Map<String, String > params = new HashMap<String, String>();
//		params.put("merchantNo", "104420148140194");
//		params.put("mRefundSeq", "100000000386");
//		params.put("curCode", "001");
//		params.put("refundAmount", "100.00");
//		params.put("orderNo", "100100000000642");
//		params.put("signData", "");
		String url="https://111.205.122.16/pay/merchant_salreturn.html?customerId=305010601399998&reqStr=El8P7BvC52GW%2FOVLOO1Rn0%2BuXVKRF29jr8eQnxpVHxYxIqNxj%2FzMevo9hdOveo1BgpbcBXG%2BzRk6ZeJCC7aAwUOKe8cNN0faNGqGj8sf%2FZRB6ASucuoXMN9Zdx7oNYaxvWwRunnH4AX5%2BgDr0vjdSgUDvMnlDX%2BX7L7lvmXpixM%3D%2CSkzivHe%2BP2Vja0jE3SrArMEKg8a0o3v5PmtMvPS%2FYSOLbRh%2FZkZHGudcUfx8SgJuwz20KHALLKBaJb95FlbddZAqBt9wTywdWe8QJYVfL82o3FbZd801AxTo%2FKSC4NClCdjqOnKx0Sd8APCiFC1KuheDQ%2FD9TYmPEHmt3F9WvNg%3D";
//		Map params=new HashMap();
//		params.put("bankName", "BOC");
		try 
		{
			String retVal = HttpsUtil.http(url, null, "", "bank");
			System.err.println(retVal);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}
