package org.micro.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.micro.util.HttpUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/oauth.do")
public class OauthController 
{
	String url="https://api.weixin.qq.com/sns/oauth2/access_token?";
	
	@RequestMapping(params = "method=getCode")
	public void getCode(HttpServletRequest request) throws Exception
	{
		String codeId = request.getParameter("code");
		System.out.println("code:"+codeId);
		Map param=new HashMap();
		param.put("appid","wx9de1544a58642739");
		param.put("secret","ecf3b6e35cf4dddca7e589850c23e437");
		param.put("code","0418ff143c161ebb75ed664403ab8daC");
		param.put("grant_type","authorization_code");
		System.out.println(HttpUtil.http(url, param,"","",""));
	}
	
}
