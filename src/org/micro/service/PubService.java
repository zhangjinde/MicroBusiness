package org.micro.service;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.micro.dao.ConfigDao;
import org.micro.util.ObjectCensor;
import org.micro.util.QryException;
import org.micro.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PubService 
{
	
	@Autowired
	private ConfigDao configDao;

	public String getAreaInfo(String areaFlag , String areaValue) throws QryException
	{
		if(ObjectCensor.isStrRegular(areaFlag , areaValue))
		{
			List<Map<String,String>> list = null; 
			if("city".equals(areaFlag))
			{
				list = configDao.getCityList(areaValue);
			}
			else
			{
				list = configDao.getDistrictList(areaValue);
			}
			JSONArray json = new JSONArray();
			for(int i = 0,n = list.size();i < n;i++)
			{
				JSONObject obj = new JSONObject();
				Map<String , String> map = list.get(i);
				String key = areaFlag+"Id";
				String value = areaFlag+"Name";
				obj.put("areaFlag", StringUtil.getMapKeyVal(map, key));
				obj.put("areaValue", StringUtil.getMapKeyVal(map, value));
				json.add(obj);
			}
			return json.toString();
		}
		else
		{
			return "入参有误,请检查入参";
		}
	}
	
}
