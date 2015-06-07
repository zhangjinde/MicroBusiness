package org.micro.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.micro.dao.LoginDao;
import org.micro.dao.MenuDao;
import org.micro.pub.base.SysDate;
import org.micro.util.MD5Util;
import org.micro.util.ObjectCensor;
import org.micro.util.QryException;
import org.micro.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService 
{
	@Autowired
	private LoginDao loginDao;
	
	@Autowired
	private MenuDao menuDao;
	
	public String getSecurityCode()
	{
		int randNum = (int)(Math.random()*9000)+1000;
		return String.valueOf(randNum%10000);
	}
	
	public String login(String username , String password , String code , HttpServletRequest request) throws QryException, NoSuchAlgorithmException, UnsupportedEncodingException
	{
		HttpSession session = request.getSession();
		JSONObject json = new JSONObject();
		String sysCode = (String)session.getAttribute("code");
		session.removeAttribute("code");
		if(code.equals(sysCode))
		{
			List<Map<String,String>> list = loginDao.qryUserInfo(username);
			if(ObjectCensor.checkListIsNull(list))
			{
				Map<String,String> map = list.get(0);
				String userPass = StringUtil.getMapKeyVal(map, "userPass");
				if(MD5Util.validPassword(password, userPass))
				{
					String userValid = StringUtil.getMapKeyVal(map, "userValid");
					String userPriv = StringUtil.getMapKeyVal(map, "userPriv");
					if("#".equals(userPriv) || "1".equals(userValid))
					{
						json.put("status", 1);
						json.put("info", "��¼�ɹ�");
						json.put("url", "/login.do?method=showIndex");
						session.setAttribute("UserInfo", map);
					}
					else
					{
						json.put("status", 0);
						json.put("info", "�˻��ѹ��ڣ�����ϵ����Ա");
						json.put("url", "");
					}
				}
				else
				{
					json.put("status", 0);
					json.put("info", "�������");
					json.put("url", "");
				}
			}
			else
			{
				json.put("status", "0");
				json.put("info", "�û���������");
				json.put("url", "");
			}
		}
		else
		{
			json.put("status", 0);
			json.put("info", "��֤�����");
			json.put("url", "");
		}
		return json.toString();
	}
	
	public List<Map<String,String>> showIndex() throws QryException
	{
		List<Map<String,String>> menuList = menuDao.getMainMenu();
		return menuList;
	}
	
	public String menuLeft(String menuId , Map<String,String> userMap) throws QryException
	{
		JSONArray json = new JSONArray();
		List<Map<String,String>> menuList = menuDao.getSubMenuItem(menuId);
		for(int i = 0,n = menuList.size();i < n;i++)
		{
			Map map = menuList.get(i);
			String parentMenuId = StringUtil.getMapKeyVal(map, "parentMenuId");
			if(menuId.equals(parentMenuId))
			{
				JSONObject node = new JSONObject();
				String menuSubId = StringUtil.getMapKeyVal(map, "menuId");
				String menuName = StringUtil.getMapKeyVal(map, "menuName");
				node.put("name", menuName);
				JSONArray nodeArr = new JSONArray();
				for(int j = 0;j < n;j++)
				{
					Map subMap = menuList.get(j);
					String parentItemId = StringUtil.getMapKeyVal(subMap, "parentMenuId");
					if(menuSubId.equals(parentItemId))
					{
						JSONObject item = new JSONObject();
						String itemId = StringUtil.getMapKeyVal(subMap, "menuId");
						String itemName = StringUtil.getMapKeyVal(subMap, "menuName");
						String pageUrl = StringUtil.getMapKeyVal(subMap, "pageUrl");
						item.put("text", itemName);
						item.put("id", itemId);
						item.put("url", pageUrl);
						nodeArr.add(item);
					}
				}
				node.put("son", nodeArr);
				json.add(node);
			}
		}
		return json.toString();
	}
	
	public void updateUserInfo(Map<String,String> map)
	{
		loginDao.updateUserInfo(map);
	}
	
	public void logoutUpdate(Map<String,String> map , HttpServletRequest request)
	{
		String ip = request.getRemoteAddr();
		String currentDate = SysDate.getDate();
		map.put("userIp", ip);
		map.put("lastDate", currentDate);
		loginDao.updateUserInfo(map);
	}
}
