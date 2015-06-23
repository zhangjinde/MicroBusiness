package org.micro.service;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.micro.dao.BussinessDao;
import org.micro.dao.CustomerDao;
import org.micro.dao.PayDao;
import org.micro.util.ObjectCensor;
import org.micro.util.QryException;
import org.micro.util.Rad;
import org.micro.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PayService 
{
	@Autowired
	public BussinessDao businessDao;
	
	@Autowired
	public CustomerDao customerDao;
	
	@Autowired
	public PayDao payDao;
	
	public String addOrder(String busId , String openId , String productId , String productNum , String productPrice , String xPos , String yPos , String name , String contactNum , String addr , String postCode , String provId , String cityId , String districtId) throws QryException
	{
		if(ObjectCensor.isStrRegular(busId , openId , productId , productNum))
		{
			Map<String,String> busDetailMap = getBusDetail(busId, xPos, yPos);
			String busDetailId = null;
			if(busDetailMap != null)
			{
				busDetailId = StringUtil.getMapKeyVal(busDetailMap, "busDetailId");
			}
			else
			{
				return "商家详细信息有误，请核实后重新尝试";
			}
			String customerId = null;
			if(ObjectCensor.isStrRegular(name , contactNum , addr , provId , cityId , districtId))
			{
				customerId = customerDao.addCustomerDetail(busId, openId, name, contactNum, addr, postCode, provId , cityId , districtId);
				if(!StringUtil.checkStringIsNum(customerId))
				{
					return "人员信息有误，请核实后重新尝试";
				}
			}
			else
			{
				List<Map<String,String>> customerList = customerDao.getCustomerInfo(openId, busId);
				if(ObjectCensor.checkListIsNull(customerList))
				{
					Map<String,String> customerMap = customerList.get(0);
					contactNum = StringUtil.getMapKeyVal(customerMap, "customerTelephone");
					customerId = StringUtil.getMapKeyVal(customerMap, "customerId");
				}
				else
				{
					customerId = "";
				}
			}
			return payDao.addOrder(busDetailId, customerId, contactNum, addr, productId, productNum, productPrice);
		}
		else
		{
			return "入参有误,请核实后重新尝试";
		}
	}
	
	public String addOrder(String busId , String openId , String productInfo , String xPos , String yPos , String name , String contactNum , String addr , String postCode , String provId , String cityId , String districtId , String totalPrice) throws QryException
	{
		if(ObjectCensor.isStrRegular(busId , openId , productInfo))
		{
			Map<String,String> busDetailMap = getBusDetail(busId, xPos, yPos);
			String busDetailId = null;
			if(busDetailMap != null)
			{
				busDetailId = StringUtil.getMapKeyVal(busDetailMap, "busDetailId");
			}
			else
			{
				return "商家详细信息有误，请核实后重新尝试";
			}
			String customerId = null;
			if(ObjectCensor.isStrRegular(name , contactNum , addr , provId , cityId , districtId))
			{
				customerId = customerDao.addCustomerDetail(busId, openId, name, contactNum, addr, postCode, provId , cityId , districtId);
				if(!StringUtil.checkStringIsNum(customerId))
				{
					return "人员信息有误，请核实后重新尝试";
				}
			}
			else
			{
				List<Map<String,String>> customerList = customerDao.getCustomerInfo(openId, busId);
				if(ObjectCensor.checkListIsNull(customerList))
				{
					Map<String,String> customerMap = customerList.get(0);
					contactNum = StringUtil.getMapKeyVal(customerMap, "customerTelephone");
					customerId = StringUtil.getMapKeyVal(customerMap, "customerId");
				}
				else
				{
					customerId = "";
				}
			}
			return payDao.addOrder(busDetailId, customerId, contactNum, addr, productInfo, totalPrice);
		}
		else
		{
			return "入参有误,请核实后重新尝试";
		}
	}
	
	public Map<String,String> getBusDetail(String busId , String xPos , String yPos) throws QryException
	{
		List<Map<String,String>> list = businessDao.getBusDetailList(busId);
		if(ObjectCensor.isStrRegular(xPos , yPos) && StringUtil.checkStringIsNum(xPos) && StringUtil.checkStringIsNum(yPos))
		{
			Map<String,String> dataMap = null;
			Double dataFloat = null;
			for(int i = 0,n = list.size();i < n;i++)
			{
				Map<String,String> map = list.get(i);
				double newLong = Double.parseDouble(StringUtil.getMapKeyVal(map, "busLongitude"));
				double newLat = Double.parseDouble(StringUtil.getMapKeyVal(map, "busLatitude"));
				double xPosFloat = Double.parseDouble(yPos);
				double yPosFloat = Double.parseDouble(xPos);
				double dist = Math.abs(Rad.GetDistance(newLong, newLat, xPosFloat, yPosFloat));
				if(dataMap == null || dist < dataFloat)
				{
					dataMap = map;
					dataFloat = dist;
				}
			}
			return dataMap;
		}
		else
		{
			if(ObjectCensor.checkListIsNull(list))
			{
				return list.get(0);
			}
			else
			{
				return null;
			}
		}
	}
	
	public String setOrderAddr(String customerId , String customerDetailId , String orderId) throws QryException
	{
		if(ObjectCensor.isStrRegular(customerId , customerDetailId , orderId) && StringUtil.checkStringIsNum(customerId) && StringUtil.checkStringIsNum(customerDetailId) && StringUtil.checkStringIsNum(orderId))
		{
			return payDao.setOrderAddr(customerId, customerDetailId, orderId);
		}
		else
		{
			return "参数有误,请核实后重新尝试";
		}
	}
	 
}
