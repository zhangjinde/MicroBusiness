package org.micro.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.micro.util.QryException;
import org.springframework.stereotype.Repository;

@Repository
public class ConfigDao extends BaseDao
{
	public List<Map<String,String>> getProvList() throws QryException
	{
		String sql = "select * from province_t";
		return qryCenter.executeSqlByMapListWithTrans(sql, new ArrayList());
	}
	
	public List<Map<String,String>> getCityList(String provId) throws QryException
	{
		String sql = "select * from city_t where sts = 'A' and province_id = ? ";
		ArrayList paramList = new ArrayList();
		paramList.add(provId);
		return qryCenter.executeSqlByMapListWithTrans(sql, paramList);
	}
	
	public List<Map<String,String>> getDistrictList(String cityId) throws QryException
	{
		String sql = "select * from district_t where sts = 'A' and city_id = ? ";
		ArrayList paramList = new ArrayList();
		paramList.add(cityId);
		return qryCenter.executeSqlByMapListWithTrans(sql, paramList);
	}
	
}
