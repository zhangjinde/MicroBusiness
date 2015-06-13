package org.micro.controller;

import java.io.Writer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.micro.util.HttpsUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/oauth.do")
public class OauthController 
{
	StringBuffer url= new StringBuffer("https://api.weixin.qq.com/sns/oauth2/access_token?");
	
	@RequestMapping(params = "method=getCode")
	public void getCode(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		response.setCharacterEncoding("utf-8");
		String codeId = request.getParameter("code");
		System.out.println("code:"+codeId);
		url.append("appid=wx9de1544a58642739&");
		url.append("secret=ecf3b6e35cf4dddca7e589850c23e437&");
		url.append("code="+codeId);
		url.append("grant_type=authorization_code");
		
		String ss=HttpsUtil.http(url.toString(), null, "", "");
		Writer wr = response.getWriter();
		wr.write(ss);
		wr.close();
	}
}
