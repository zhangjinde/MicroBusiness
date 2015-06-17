package org.micro.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.micro.util.HttpsUtil;
import org.micro.util.JsonUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/oauth.do")
public class OauthController 
{
	
	@RequestMapping(params = "method=getCode")
	public ModelAndView getCode(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		StringBuffer url= new StringBuffer("https://api.weixin.qq.com/sns/oauth2/access_token?");
		response.setCharacterEncoding("utf-8");
		String codeId = request.getParameter("code");
		String page=request.getParameter("page");
		System.out.println(page);
		System.out.println("code:"+codeId);
		url.append("appid=wx9de1544a58642739&");
		url.append("secret=ecf3b6e35cf4dddca7e589850c23e437&");
		url.append("code="+codeId);
		url.append("&grant_type=authorization_code");
		System.out.println("url:"+url);
		String rtn = HttpsUtil.http(url.toString(), null, "", "");
		JSONObject object = JsonUtils.fromObject(rtn);
		String openId=object.getString("openid");
		System.out.println("rtn:"+rtn);
		System.out.println("openId--------------------------------:"+openId);
		ModelAndView view = new ModelAndView("view/shop/"+page);
		view.addObject("openid",openId);
		return view;
	}
	
	public static void main(String[] args) throws UnsupportedEncodingException {
		String url= "https://www.hbywzc.cn/micro/oauth.do?method=getCode&productId=10001&page=product_detail";
		String ss = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx9de1544a58642739&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect&redirect_uri=";
		
		url=java.net.URLEncoder.encode(url,   "utf-8");      
	
		System.out.println(ss+url.toLowerCase());
	}
	
}
