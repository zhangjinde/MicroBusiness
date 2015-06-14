package org.micro.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.micro.util.QryException;
import org.micro.util.StringUtil;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class CustomerDao extends BaseDao
{
	public List<Map<String,String>> getCustomer(String phoneNum , String busId) throws QryException
	{
		String sql = "select * from customer_t where customer_telephone = ? and bus_id = ? and sts = 'A'";
		ArrayList paramList = new ArrayList();
		paramList.add(phoneNum);
		paramList.add(busId);
		return qryCenter.executeSqlByMapListWithTrans(sql, paramList);
	}
	
	public List<Map<String,String>> getCustomerInfo(String phoneNum , String busId) throws QryException
	{
		String sql = "select * from customer_t a,customer_address_t b where a.customer_id = b.customer_id and bus_id = ? and customer_telephone = ? and a.sts = 'A' and b.sts = 'A' and is_primary = 'A'";
		ArrayList paramList = new ArrayList();
		paramList.add(busId);
		paramList.add(phoneNum);
		return qryCenter.executeSqlByMapListWithTrans(sql, paramList);
	}
	
	@Transactional
	public String addCustomerDetail(String busId , String name , String contactNum , String provId , String cityId , String districtId , String addr , String postCode) throws QryException
	{
		String sql = "insert into customer_t(customer_id,bus_id,customer_name,customer_telephone,create_date,state_date,sts) values(MICRO_CUSM_SEQ.nextval,?,?,?,sysdate,sysdate,'A')";
		if(jdbcTemplate.update(sql, new Object[]{busId,name,contactNum}) > 0)
		{
			sql = "insert into customer_address_t(customer_detail_id,customer_id,prov_id,city_id,district_id,customer_addr,customer_postcode,is_primary,create_date,state_date,sts) values(MICRO_CUSM_DET_SEQ.nextval,MICRO_CUSM_SEQ.currval,?,?,?,?,?,'A',sysdate,sysdate,'A')";
			if(jdbcTemplate.update(sql, new Object[]{provId,cityId,districtId,addr,postCode}) > 0)
			{
				sql = "select MICRO_CUSM_SEQ.nextval-1 customer_id from dual";
				List<Map<String,String>> list = qryCenter.executeSqlByMapListWithTrans(sql, new ArrayList());
				return StringUtil.getMapKeyVal(list.get(0), "customerId");
			}
			else
			{
				throw new IllegalArgumentException("人员详细信息入库失败");
			}
		}
		else
		{
			throw new IllegalArgumentException("人员信息入库失败");
		}
	}
	
}
