package org.micro.service.app;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.micro.dao.BussinessDao;
import org.micro.pub.annotation.ServiceType;
import org.micro.pub.util.ObjectCensor;
import org.micro.pub.util.QryException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("BUS001")
public class AuthService 
{
	@Autowired
	private BussinessDao bussinessDao;
	
	
	@ServiceType(value="BUS0011")
	public String login(String busAccount , String busPassword)
	{
		if(ObjectCensor.isStrRegular(busAccount , busPassword))
		{
			String retVal = null;
			try 
			{
				List<Map<String, String>>  list = bussinessDao.validLogin(busAccount, busPassword);
				if(ObjectCensor.checkListIsNull(list))
				{
					retVal = JSONObject.fromObject(list.get(0)).toString();
				}
				else
				{
					retVal = "false";
				}
			}
			catch (QryException e) 
			{
				retVal = e.getMessage();
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return retVal;
		}
		else
		{
			return "入参有误,请核实后再次尝试";
		}
	}
}
