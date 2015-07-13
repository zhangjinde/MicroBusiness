package org.micro.pub.util;

import net.sf.json.JSONObject;

public class WeixinAuth 
{
	public static String getOpenId(String codeId) throws Exception
	{
		StringBuffer url= new StringBuffer("https://api.weixin.qq.com/sns/oauth2/access_token?");
		url.append("appid=wx9de1544a58642739&");
		url.append("secret=ecf3b6e35cf4dddca7e589850c23e437&");
		url.append("code="+codeId);
		url.append("&grant_type=authorization_code");
		String rtn = HttpsUtil.http(url.toString(), null, "", "");
		JSONObject object = JsonUtils.fromObject(rtn);
		String openId=object.getString("openid");
		return openId;
	}
}
