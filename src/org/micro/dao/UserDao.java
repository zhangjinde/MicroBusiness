package org.micro.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.micro.pub.util.ObjectCensor;
import org.micro.pub.util.QryException;
import org.micro.pub.util.StringUtil;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class UserDao extends BaseDao
{
	public List<Map<String,String>>  qryUser(String telephone , String password) throws QryException
	{
		String sql="select t.* from customer_t t where customer_telephone=? and password=?";
		ArrayList paramList = new ArrayList();
    	paramList.add(telephone);
    	paramList.add(password);
    	return qryCenter.executeSqlByMapListWithTrans(sql, paramList);
	}
	
	public List<Map<String,String>> qryUserList(String page , String rows) throws QryException
	{
		String query = "SELECT * FROM (SELECT A.*, ROWNUM RN FROM (select t.user_id,t.user_name,t.user_priv,t.real_name,t.user_ip,to_char(t.create_date,'yyyy-mm-dd') create_date,to_char(t.state_date,'yyyy-mm-dd') state_date from micro_user t where user_state = '00A') A WHERE ROWNUM <= ?) WHERE RN >= ?";
		ArrayList paramList = new ArrayList();
		int pageNum = Integer.parseInt(page);
		int pageSize = Integer.parseInt(rows);
    	paramList.add(pageNum * pageSize);
    	paramList.add((pageNum - 1) * pageSize + 1);
		return qryCenter.executeSqlByMapListWithTrans(query, paramList);
	}
	
	public String qryUserListCount() throws QryException
	{
		String query = "select count(*) total from micro_user t where user_state = '00A'";
		List<Map<String,String>> list = qryCenter.executeSqlByMapListWithTrans(query, new ArrayList());
		return StringUtil.getMapKeyVal(list.get(0), "total");
	}
	
	public List<Map<String,String>> qryUserByUserId(String userId) throws QryException
	{
		String query = "select * from micro_user where user_state = '00A' and user_id = ? ";
		ArrayList paramList = new ArrayList();
		paramList.add(userId);
		return qryCenter.executeSqlByMapListWithTrans(query, paramList);
	}
	
	public List<Map<String,String>> qryUserByUserName(String userName) throws QryException
	{
		String query = "select * from micro_user where user_state = '00A' and user_name = ? ";
		ArrayList paramList = new ArrayList();
		paramList.add(userName);
		return qryCenter.executeSqlByMapListWithTrans(query, paramList);
	}
	
	public int addUser(Map<String,String> userMap)
	{
		Connection conn = null;
		Statement stat = null;
		try{
			String userName = StringUtil.getMapKeyVal(userMap, "userName");
			String userPass = StringUtil.getMapKeyVal(userMap, "userPass");
			String userPriv = StringUtil.getMapKeyVal(userMap, "userPriv");
			String realName = StringUtil.getMapKeyVal(userMap, "realName");
			String userIp = StringUtil.getMapKeyVal(userMap, "userIp");
			conn = qryCenter.getDataSource().getConnection();
			stat = conn.createStatement();
			String sql = "insert into micro_user(user_id,user_name,user_pass,user_priv,user_state,real_name,user_ip,create_date,state_date,bus_id) values(vclass_seq.nextval,'"+userName+"','"+userPass+"','"+userPriv+"','00A','"+realName+"','"+userIp+"',sysdate,sysdate,'100')";
			return stat.executeUpdate(sql);
		}catch(Exception err)
		{
			err.printStackTrace();
		}
		finally
		{
			if(stat != null)
			{
				try {
					stat.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(conn != null)
			{
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return -1;
	}
	
	public int delUser(String userId)
	{
		Connection conn = null;
		Statement stat = null;
		try{
			conn = qryCenter.getDataSource().getConnection();
			stat = conn.createStatement();
			String sql = "delete from  micro_user where user_id = '"+userId+"'";
			return stat.executeUpdate(sql);
		}catch(Exception err)
		{
			err.printStackTrace();
		}
		finally
		{
			if(stat != null)
			{
				try {
					stat.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(conn != null)
			{
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return -1;
	}
	
	@Transactional
	public String saveCustomer(String orderId , String customerId , String customerName , String customerPhone , String provId , String cityId , String districtId , String provName , String cityName , String distName , String addr , String postCode)
	{
		String sql = "update customer_address_t set is_primary='P',state_date=sysdate where customer_id = ? ";
		if(jdbcTemplate.update(sql, new Object[]{customerId}) > 0)
		{
			sql = "insert into customer_address_t(customer_detail_id,customer_id,customer_addr,customer_postcode,is_primary,prov_id,city_id,district_id,customer_name,customer_telephone,create_date,state_date,sts) values(MICRO_CUSM_DET_SEQ.nextval,?,?,?,?,?,?,?,?,?,sysdate,sysdate,'A')";
			if(jdbcTemplate.update(sql, new Object[]{customerId,addr,postCode,"A",provId,cityId,districtId,customerName,customerPhone}) > 0)
			{
//				addr = new StringBuffer().append(provName).append(cityName).append(distName).append(addr).toString();
				sql = "update customer_t set customer_name = ?,customer_telephone = ? where customer_id = ?";
				if(jdbcTemplate.update(sql,new Object[]{customerName,customerPhone,customerId}) > 0)
				{
					sql = "update order_t set telephone = ?,customer_address = ?,customer_name = ? where order_id = ?";
					if(jdbcTemplate.update(sql,new Object[]{customerPhone,addr,customerName,orderId}) > 0)
					{
						return "success";
					}
				}
			}
			return "failure";
		}
		else
		{
			return "failure";
		}
	}
	
	@Transactional
	public String updateCustomer(String orderId , String customerId , String customerDetailId , String customerName , String customerPhone , String provId , String cityId , String districtId , String provName , String cityName , String distName , String addr , String postCode) throws QryException
	{
		String sql = "update customer_address_t set customer_addr = ?,customer_postcode = ?,state_date = sysdate,prov_id = ?,city_id = ?,district_id = ?,customer_name = ?,customer_telephone = ? where customer_detail_id = ?";
		if(jdbcTemplate.update(sql, new Object[]{addr,postCode,provId,cityId,districtId,customerName,customerPhone,customerDetailId}) > 0)
		{
			sql = "select * from customer_address_t where customer_detail_id = ? and is_primary = 'A'";
			ArrayList paramList = new ArrayList();
			paramList.add(customerDetailId);
			List<Map<String,String>> list = qryCenter.executeSqlByMapListWithTrans(sql, paramList);
			if(ObjectCensor.checkListIsNull(list))
			{
//				addr = new StringBuffer().append(provName).append(cityName).append(distName).append(addr).toString();
				Map<String,String> map = list.get(0);
				sql = "update customer_t set customer_name = ?,customer_telephone = ? where customer_id = ?";
				if(jdbcTemplate.update(sql,new Object[]{customerName,customerPhone,customerId}) > 0)
				{
					sql = "update order_t set telephone = ?,customer_address = ?,customer_name = ? where order_id = ?";
					if(jdbcTemplate.update(sql,new Object[]{customerPhone,addr,customerName,orderId}) > 0)
					{
						return "success";
					}
				}
			}
			else
			{
				return "success";
			}
		}
		return "failure";
	}
	
	public String delCustomer(String customerId , String customerDetailId) throws QryException
	{
		String sql = "select * from customer_address_t where customer_detail_id = ? and is_primary = 'A'";
		ArrayList paramList = new ArrayList();
		paramList.add(customerDetailId);
		List<Map<String,String>> list = qryCenter.executeSqlByMapListWithTrans(sql, paramList);
		if(ObjectCensor.checkListIsNull(list))
		{
			return "删除失败:该地址信息正在使用";
		}
		else
		{
			sql = "delete from customer_address_t where customer_detail_id = ?";
			if(jdbcTemplate.update(sql, new Object[]{customerDetailId}) > 0)
			{
				return "success";
			}
			else
			{
				return "failure";
			}
		}
	}
	
}
