package org.micro.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.micro.dao.PayDao;
import org.micro.util.ObjectCensor;
import org.micro.util.QryException;
import org.micro.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService 
{
	
	@Autowired
	private PayDao payDao;
	
	public String qryOrderList(String orderType , String openId , String pageNum , String pageSize) throws Exception
	{
		if(ObjectCensor.isStrRegular(orderType , openId , pageNum , pageSize) && StringUtil.checkStringIsNum(pageNum) && StringUtil.checkStringIsNum(pageSize))
		{
			List<Map<String,String>> orderList = payDao.qryOrderList(orderType, openId, Integer.parseInt(pageNum), Integer.parseInt(pageSize));
			StringBuilder sb = new StringBuilder();
			for(int i = 0,n = orderList.size();i < n;i++)
			{
				Map<String,String> map = orderList.get(i);
				if(i == n - 1)
				{
					sb.append("'").append(StringUtil.getMapKeyVal(map, "orderId")).append("'");
				}
				else
				{
					sb.append("'").append(StringUtil.getMapKeyVal(map, "orderId")).append("'").append(",");
				}
			}
			List<Map<String,String>> orderDetailList = payDao.qryOrderDetailInfo(sb.toString());
			JSONObject json = new JSONObject();
			if(ObjectCensor.checkListIsNull(orderDetailList))
			{
				JSONArray jsonArr = new JSONArray();
				for(int i = 0,n = orderList.size();i < n;i++)
				{
					Map<String,String> map = orderList.get(i);
					JSONObject obj = JSONObject.fromObject(map);
					HashMap<String,String> paramMap = new HashMap<String,String>();
					paramMap.put("orderId", StringUtil.getMapKeyVal(map, "orderId"));
					List<Map<String,String>> subList = StringUtil.getSubMapList(orderDetailList,paramMap);
					obj.put("orderDetailInfo", JSONArray.fromObject(subList));
					jsonArr.add(obj);
				}
				json.put("data", jsonArr);
//				String count = payDao.qryOrderListCnt(orderType, openId);
//				json.put("count", count);
			}
			else
			{
				json.put("data", "[]");
//				json.put("count", "0");
			}
			return json.toString();
		}
		else
		{
			return "参数有误:请核实后重新尝试";
		}
	}
	
	public String cancelOrder(String orderId)
	{
		return payDao.cancelOrder(orderId);
	}
	
	public String orderFunc(String orderId , String sts)
	{
		return payDao.orderFunc(orderId, sts);
	}
	
	public String payOrder(String orderId , String busDetailId)
	{
		return payDao.payOrder(orderId , busDetailId);
	}
	
	public String getOrderList(String orderType , String pageNum , String pageSize) throws QryException 
	{
		if(ObjectCensor.isStrRegular(pageNum , pageSize) && StringUtil.checkStringIsNum(pageNum) && StringUtil.checkStringIsNum(pageSize))
		{
			List<Map<String,String>> orderList = payDao.getOrderList(orderType, Integer.parseInt(pageNum), Integer.parseInt(pageSize));
			JSONObject json = new JSONObject();
			if(ObjectCensor.checkListIsNull(orderList))
			{
				json.put("rows", JSONArray.fromObject(orderList).toString());
				String count = payDao.getOrderListCnt(orderType);
				json.put("total", count);
			}
			else
			{
				json.put("rows", "[]");
				json.put("total", "0");
			}
			return json.toString();
		}
		else
		{
			return "参数有误:请核实后重新尝试";
		}
	}
	
	public String getOrderDetailInfo(String orderId , String pageNum , String pageSize) throws QryException 
	{
		if(ObjectCensor.isStrRegular(orderId , pageNum , pageSize) && StringUtil.checkStringIsNum(pageNum) && StringUtil.checkStringIsNum(pageSize))
		{
			List<Map<String,String>> orderList = payDao.getOrderDetailInfo(orderId, Integer.parseInt(pageNum), Integer.parseInt(pageSize));
			JSONObject json = new JSONObject();
			if(ObjectCensor.checkListIsNull(orderList))
			{
				json.put("rows", JSONArray.fromObject(orderList).toString());
				String count = payDao.getOrderDetailInfoCnt(orderId);
				json.put("total", count);
			}
			else
			{
				json.put("rows", "[]");
				json.put("total", "0");
			}
			return json.toString();
		}
		else
		{
			return "参数有误:请核实后重新尝试";
		}
	}
	
}
