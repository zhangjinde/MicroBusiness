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
	
}
