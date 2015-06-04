package org.micro.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.micro.dao.LoginDao;
import org.micro.dao.UserDao;
import org.micro.util.MD5Util;
import org.micro.util.ObjectCensor;
import org.micro.util.QryException;
import org.micro.util.SysDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService 
{
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private LoginDao loginDao;
	
	public String qryUserList(String page , String rows) throws QryException
	{
		List<Map<String,String>> list =  userDao.qryUserList(page , rows);
		JSONObject result = new JSONObject();
		result.put("total", userDao.qryUserListCount());
		result.put("rows", JSONArray.fromObject(list));
		return result.toString();
	}
	
	public String updateUserInfo(String userId , String userName , String realName , String startDate , String endDate) throws QryException
	{
		JSONObject json = new JSONObject();
		List<Map<String,String>> userList = userDao.qryUserByUserId(userId);
		if(ObjectCensor.checkListIsNull(userList))
		{
			Map<String,String> map = userList.get(0);
			map.put("userName", userName);
			map.put("realName", realName);
			map.put("startDate", startDate);
			map.put("endDate", endDate);
			loginDao.updateUserInfo(map);
			json.put("success", 1);
			json.put("msg", "�޸��û���Ϣ�ɹ�");
		}
		else
		{
			json.put("success", 0);
			json.put("msg", "�޸��û���Ϣʧ��");
		}
		return json.toString();
	}
	
	public String newUser(String userName , String realName , String startDate , String endDate , String userIp) throws QryException, NoSuchAlgorithmException, UnsupportedEncodingException
	{
		JSONObject json = new JSONObject();
		List<Map<String,String>> userList = userDao.qryUserByUserName(userName);
		if(!ObjectCensor.checkListIsNull(userList))
		{
			Map<String,String> map = new HashMap<String,String>();
			map.put("userPass", MD5Util.getEncryptedPwd("123456"));
			map.put("userName", userName);
			map.put("realName", realName);
			map.put("startDate", startDate);
			map.put("endDate", endDate);
			map.put("lastDate", SysDate.getDate());
			map.put("userIp", userIp);
			map.put("userPriv", "#");
			userDao.addUser(map);
			json.put("success", 1);
			json.put("msg", "�����û��ɹ�");
		}
		else
		{
			json.put("success", 0);
			json.put("msg", "���˻���ע��");
		}
		return json.toString();
	}
	
	public String delUser(String userId)
	{
		JSONObject json = new JSONObject();
		userDao.delUser(userId);
		json.put("success", 1);
		json.put("msg", "�����û��ɹ�");
		return json.toString();
	}
	
}