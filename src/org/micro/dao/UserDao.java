package org.micro.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.micro.util.ObjectCensor;
import org.micro.util.QryCenter;
import org.micro.util.QryException;
import org.micro.util.StringUtil;
import org.springframework.stereotype.Repository;

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
		String query = "SELECT * FROM (SELECT A.*, ROWNUM RN FROM (select t.user_id,t.user_name,t.user_priv,t.real_name,t.user_ip,to_char(t.start_date,'yyyy-mm-dd') start_date,to_char(t.end_date,'yyyy-mm-dd') end_date from vclass_user t where user_state = '00A' and user_priv != '#') A WHERE ROWNUM <= ?) WHERE RN >= ?";
		ArrayList paramList = new ArrayList();
		int pageNum = Integer.parseInt(page);
		int pageSize = Integer.parseInt(rows);
    	paramList.add(pageNum * pageSize);
    	paramList.add((pageNum - 1) * pageSize + 1);
		return qryCenter.executeSqlByMapListWithTrans(query, paramList);
	}
	
	public String qryUserListCount() throws QryException
	{
		String query = "select count(*) total from vclass_user t where user_state = '00A'";
		List<Map<String,String>> list = qryCenter.executeSqlByMapListWithTrans(query, new ArrayList());
		return StringUtil.getMapKeyVal(list.get(0), "total");
	}
	
	public List<Map<String,String>> qryUserByUserId(String userId) throws QryException
	{
		String query = "select * from vclass_user where user_state = '00A' and user_id = ? ";
		ArrayList paramList = new ArrayList();
		paramList.add(userId);
		return qryCenter.executeSqlByMapListWithTrans(query, paramList);
	}
	
	public List<Map<String,String>> qryUserByUserName(String userName) throws QryException
	{
		String query = "select * from vclass_user where user_state = '00A' and user_name = ? ";
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
			String lastDate = StringUtil.getMapKeyVal(userMap, "lastDate");
			String startDate = StringUtil.getMapKeyVal(userMap, "startDate");
			String endDate = StringUtil.getMapKeyVal(userMap, "endDate");
			conn = qryCenter.getDataSource().getConnection();
			stat = conn.createStatement();
			String sql = "insert into vclass_user(user_id,user_name,user_pass,user_priv,user_state,real_name,user_ip,last_date,start_date,end_date) values(vclass_seq.nextval,'"+userName+"','"+userPass+"','"+userPriv+"','00A','"+realName+"','"+userIp+"',to_date('"+lastDate+"','yyyy-mm-dd hh24:mi:ss'),to_date('"+startDate+"','yyyy-mm-dd'),to_date('"+endDate+"','yyyy-mm-dd'))";
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
			String sql = "delete from  vclass_user where user_id = '"+userId+"'";
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
	
	public String saveCustomer(String customerId , String customerName , String customerPhone , String provId , String cityId , String districtId , String addr , String postCode)
	{
		String sql = "insert into customer_address_t(customer_detail_id,customer_id,customer_addr,customer_postcode,is_primary,prov_id,city_id,district_id,customer_name,customer_telephone,create_date,state_date,sts) values(MICRO_CUSM_DET_SEQ.nextval,?,?,?,?,?,?,?,?,?,sysdate,sysdate,'A')";
		if(jdbcTemplate.update(sql, new Object[]{customerId,addr,postCode,'P',provId,cityId,districtId,customerName,customerPhone}) > 0)
		{
			return "success";
		}
		else
		{
			return "failure";
		}
	}
	
	public String updateCustomer(String customerId , String customerDetailId , String customerName , String customerPhone , String provId , String cityId , String districtId , String addr , String postCode)
	{
		String sql = "update customer_address_t set customer_addr = ?,customer_postcode = ?,state_date = sysdate,prov_id = ?,city_id = ?,district_id = ?,customer_name = ?,customer_telephone = ? where customer_detail_id = ?";
		if(jdbcTemplate.update(sql, new Object[]{addr,postCode,provId,cityId,districtId,customerName,customerPhone,customerDetailId}) > 0)
		{
			return "success";
		}
		else
		{
			return "failure";
		}
	}
	
	public String delCustomer(String customerId , String customerDetailId)
	{
		String sql = "delete from customer_address_t where customer_detail_id = ?";
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
