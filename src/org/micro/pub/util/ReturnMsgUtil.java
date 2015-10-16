package org.micro.pub.util;

import net.sf.json.JSONObject;

public class ReturnMsgUtil {

	public static String retSuccessMsgJson(String msg) {
		return msg;
	}

	public static String retSuccessMsgJson(String returnCode, String msg,
			String objName, Object obj) {
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("code", returnCode);
		jsonobj.put("msg", msg);
		jsonobj.put(objName, obj);
		return obj.toString();
	}

}
