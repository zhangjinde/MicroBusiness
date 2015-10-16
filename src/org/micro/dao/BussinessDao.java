package org.micro.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.micro.pub.util.QryException;
import org.springframework.stereotype.Repository;

@Repository
public class BussinessDao extends BaseDao
{
	
	public List<Map<String,String>> getBusDetailList(String busId) throws QryException
	{
		String sql = "select * from business_detail_t where bus_id = ? and sts = 'A'";
		ArrayList paramList = new ArrayList();
		paramList.add(busId);
		return qryCenter.executeSqlByMapListWithTrans(sql, paramList);
	}
	
	public List<Map<String,String>> getBusDetailInfo(String busDetailId) throws QryException
	{
		String sql = "select * from business_detail_t where bus_detail_id = ? and sts = 'A'";
		ArrayList paramList = new ArrayList();
		paramList.add(busDetailId);
		return qryCenter.executeSqlByMapListWithTrans(sql, paramList);
	}
	
	public List<Map<String,String>> validLogin(String busAccount , String busPassword) throws QryException
	{
		String sql = "select bus_detail_id,bus_id,bus_detail_name,bus_addr,bus_telephone,bus_longitude,bus_latitude,to_char(create_date,'yyyy-mm-dd hh24:mi:ss') create_date,to_char(state_date,'yyyy-mm-dd hh24:mi:ss') state_date,bus_account from business_detail_t where bus_account = ? and bus_password = ? and sts = 'A'";
		ArrayList paramList = new ArrayList();
		paramList.add(busAccount);
		paramList.add(busPassword);
		return qryCenter.executeSqlByMapListWithTrans(sql, paramList);
	}
}
