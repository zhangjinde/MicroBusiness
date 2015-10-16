package org.micro.controller;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.micro.model.JoinParams;
import org.micro.model.ServiceRetMsg;
import org.micro.pub.resolve.MultiServiceMethodAdapter;
import org.micro.pub.resolve.ServiceMsgConverter;
import org.micro.pub.util.ReturnMsgUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AppController 
{
	@RequestMapping(value = "/commorder.do")
	public void commorder(HttpServletRequest request , HttpServletResponse response,String param)
	{
		ServiceRetMsg msg = new ServiceRetMsg();
		PrintWriter out = null;
		String retMsg = "";
		try 
		{
			out = response.getWriter();
			param = URLDecoder.decode(param, "utf-8");
			JoinParams joinParam = (JoinParams) ServiceMsgConverter.jsonToBeanConverter(param, JoinParams.class);
			Object rstObj = MultiServiceMethodAdapter.invoke(joinParam);
			retMsg = checkXmlChar(rstObj.toString());
			if (rstObj instanceof List)
			{
				msg.setReturnMsgType("JSONArray");
			}
			else
			{
				msg.setReturnMsgType("JSONObject");
			}
			msg.setServiceCode(joinParam.getServiceType());
			msg.setReturnMsg(retMsg);
			response.setCharacterEncoding("utf-8");
			out.write(ServiceMsgConverter.beanToJsonConverter(msg));
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			msg.setExecuteType("failure");
			msg.setExceptionMsg(e.getMessage());
			retMsg = ReturnMsgUtil.retSuccessMsgJson("接口内部异常");	
			msg.setReturnMsg(retMsg);
			try
			{
				out.write(ServiceMsgConverter.beanToJsonConverter(msg));
			} 
			catch (Exception e1)
			{
				e1.printStackTrace();
			}
		}finally{
			if(out != null)
			{
				out.close();
			}
		}
	}
	
	private static String checkXmlChar(String data) 
	{ 
		StringBuffer appender = new StringBuffer("");  
		if (StringUtils.isNotBlank(data)) 
		{
			appender = new StringBuffer(data.length());  
			for (int i = 0; i < data.length(); i++) 
			{
				char ch = data.charAt(i);  
				if ((ch == 0x9) || (ch == 0xA) || (ch == 0xD)  
						|| ((ch >= 0x20) && (ch <= 0xD7FF))  
						|| ((ch >= 0xE000) && (ch <= 0xFFFD))  
						|| ((ch >= 0x10000) && (ch <= 0x10FFFF)))  
					appender.append(ch);  
			}
		}
		String result = appender.toString();  
		return result.replaceAll("]]>", "");  
	}
}
