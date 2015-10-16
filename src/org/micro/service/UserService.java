package org.micro.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.micro.dao.CustomerDao;
import org.micro.dao.LoginDao;
import org.micro.dao.PayDao;
import org.micro.dao.UserDao;
import org.micro.pub.base.SysDate;
import org.micro.pub.util.MD5Util;
import org.micro.pub.util.ObjectCensor;
import org.micro.pub.util.QryException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService 
{
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private LoginDao loginDao;
	
	@Autowired
	private CustomerDao customerDao;
	
	@Autowired
	private PayDao payDao;
	
	public Map userLogin(String telephone,String password) throws QryException
	{
		List list = userDao.qryUser(telephone, password);
		if(ObjectCensor.checkListIsNull(list))
		{
			return (Map) list.get(0);
		}
		return null;
	}
	
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
			json.put("msg", "修改用户信息成功");
		}
		else
		{
			json.put("success", 0);
			json.put("msg", "修改用户信息失败");
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
			json.put("msg", "新增用户成功");
		}
		else
		{
			json.put("success", 0);
			json.put("msg", "该账户已注册");
		}
		return json.toString();
	}
	
	public String delUser(String userId)
	{
		JSONObject json = new JSONObject();
		userDao.delUser(userId);
		json.put("success", 1);
		json.put("msg", "新增用户成功");
		return json.toString();
	}
	
	public String saveCustomer(String busId , String openId , String orderId , String customerId , String customerName , String customerPhone , String provId , String cityId , String districtId  , String provName , String cityName , String distName , String addr , String postCode) throws QryException
	{
		if(ObjectCensor.isStrRegular(customerName , customerPhone , addr))
		{
			if(validPhone(customerPhone))
			{
				if(ObjectCensor.isStrRegular(customerId))
				{
					return userDao.saveCustomer(orderId, customerId, customerName, customerPhone, provId, cityId, districtId, provName, cityName, distName, addr, postCode);
				}
				else
				{
					customerId = customerDao.addCustomerDetail(busId, openId, customerName, customerPhone, addr, postCode, provId, cityId, districtId);
//				addr = new StringBuffer().append(provName).append(cityName).append(distName).append(addr).toString();
					return payDao.saveNewUserOrder(orderId, customerPhone, addr, customerName, customerId);
				}
			}
			else
			{
				return "新增收货人联系电话不正确";
			}
		}
		else
		{
			return "新增收货人信息有误，请核实后重新尝试";
		}
	}
	
	public String updateCustomer(String orderId , String customerId , String customerDetailId , String customerName , String customerPhone , String provId , String cityId , String districtId , String provName , String cityName , String distName , String addr , String postCode) throws QryException
	{
		if(ObjectCensor.isStrRegular(customerName , customerPhone , addr))
		{
			if(validPhone(customerPhone))
			{
				return userDao.updateCustomer(orderId, customerId, customerDetailId, customerName, customerPhone, provId, cityId, districtId, provName, cityName, distName, addr, postCode);
			}
			else
			{
				return "修改联系电话不正确";
			}
		}
		else
		{
			return "修改联系电话有误，请核实后重新尝试";
		}
	}
	
	private boolean validPhone(String contactNum)
	{
		if(contactNum.length() == 8 || contactNum.length() == 11)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public String delCustomer(String customerId , String customerDetailId) throws QryException
	{
		return userDao.delCustomer(customerId, customerDetailId);
	}
	
}
