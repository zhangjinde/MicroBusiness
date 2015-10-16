package org.micro.service.app;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.micro.dao.PayDao;
import org.micro.pub.annotation.ServiceType;
import org.micro.pub.util.ObjectCensor;
import org.micro.pub.util.QryException;
import org.micro.pub.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("BUS002")
public class BusinessService 
{
	@Autowired
	private PayDao payDao;
	
	@ServiceType(value="BUS0021")
	public String getBusOrderList(String busDetailId , String state , String pageNum , String pageSize)
	{
		if(ObjectCensor.isStrRegular(busDetailId , state , pageNum , pageSize) && StringUtil.checkStringIsNum(pageNum) && StringUtil.checkStringIsNum(pageSize))
		{
			JSONObject json = new JSONObject();
			String retVal = null;
			if("A".equals(state))
			{
				state = "'R','H','O','P'";
			}
			else if("R".equals(state))
			{
				state = "'R'";
			}
			else if("H".equals(state))
			{
				state = "'H'";
			}
			else if("O".equals(state))
			{
				state = "'O'";
			}
			else if("P".equals(state))
			{
				state = "'P'";
			}
			try {
				List<Map<String,Object>> list = payDao.getBusDetailList(busDetailId, state, Integer.parseInt(pageNum), Integer.parseInt(pageSize));
				if(ObjectCensor.checkListIsNull(list))
				{
					for(int i = 0,n = list.size();i < n;i++)
					{
						Map<String,Object> map = list.get(i);
						String orderId = StringUtil.getMapKeyVal(map, "orderId");
						List<Map<String,String>> orderDetailList = payDao.getOrderDetail(orderId);
						map.put("orderDetailList", orderDetailList);
					}
				}
				json.put("orderList", list);
				String listSize = payDao.getBusDetailListCnt(busDetailId, state);
				json.put("orderSize", listSize);
				return json.toString();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				retVal = e.getMessage();
			}
			return retVal;
		}
		else
		{
			return "入参有误,请核实后重新尝试";
		}
	}
	
	@ServiceType(value="BUS0022")
	public String hasNewBusOrder(String busDetailId)
	{
		if(ObjectCensor.isStrRegular(busDetailId) && StringUtil.checkStringIsNum(busDetailId))
		{
			String retVal = null;
			try {
				return payDao.hasNewBusOrder(busDetailId);
			} catch (QryException e) {
				retVal = e.getMessage();
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return retVal;
		}
		else
		{
			return "入参有误,请核实后重新尝试";
		}
	}
	
	@ServiceType(value="BUS0023")
	public String adjustOrderState(String orderId , String state)
	{
		if(ObjectCensor.isStrRegular(orderId,state))
		{
			return payDao.orderFunc(orderId, state);
		}
		else
		{
			return "入参有误,请核实后重新尝试";
		}
	}
	
	@ServiceType(value = "BUS0024")
	public String operNewBusOrder(String busDetailId , String orderIds)
	{
		if(ObjectCensor.isStrRegular(busDetailId , orderIds) && StringUtil.checkStringIsNum(busDetailId))
		{
			String retVal = "failure";
			try {
				StringBuffer sb = new StringBuffer();
				String[] orderIdArr = orderIds.split(",");
				for(int i = 0,n = orderIdArr.length;i < n;i++)
				{
					sb.append("'");
					sb.append(orderIdArr[i]);
					if(i == n-1)
					{
						sb.append("'");
					}
					else
					{
						sb.append("',");
					}
				}
				return payDao.operNewBusOrder(busDetailId, sb.toString());
			} catch (Exception e) {
				retVal = e.getMessage();
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return retVal;
		}
		else
		{
			return "入参有误,请核实后重新尝试";
		}
	}
	
}
