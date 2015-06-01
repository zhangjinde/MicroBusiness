package org.micro.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.micro.util.QryCenter;
import org.micro.util.QryException;
import org.micro.util.StringUtil;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao {
	
	private QryCenter qryCenter;

	public QryCenter getQryCenter() {
		return qryCenter;
	}

	@Resource
	public void setQryCenter(QryCenter qryCenter) {
		this.qryCenter = qryCenter;
	}
	
	public List<Map<String , String>> qryUserInfo(String userName) throws QryException
	{
		String query = "select t.user_id,t.user_name,t.user_pass,t.user_priv,t.real_name,t.user_ip,to_char(t.last_date,'yyyy-mm-dd hh24:mi:ss') last_date,to_char(t.start_date,'yyyy-mm-dd') start_date,to_char(t.end_date,'yyyy-mm-dd') end_date,case when (sysdate>=start_date and sysdate<=end_date) then '1' else '0' end as user_valid from micro_user t where user_name = ? and user_state = '00A'";
		ArrayList paramList = new ArrayList();
		paramList.add(userName);
		return qryCenter.executeSqlByMapListWithTrans(query, paramList);
	}
	
	public int updateUserInfo(Map<String,String> userMap)
	{
		Connection conn = null;
		Statement stat = null;
		try{
			
			String userId = StringUtil.getMapKeyVal(userMap, "userId");
			String userName = StringUtil.getMapKeyVal(userMap, "userName");
			String userPass = StringUtil.getMapKeyVal(userMap, "userPass");
			String realName = StringUtil.getMapKeyVal(userMap, "realName");
			String userIp = StringUtil.getMapKeyVal(userMap, "userIp");
			String startDate = StringUtil.getMapKeyVal(userMap, "startDate");
			String endDate = StringUtil.getMapKeyVal(userMap, "endDate");
			conn = qryCenter.getDataSource().getConnection();
			stat = conn.createStatement();
			String sql = "update micro_user set user_name='"+userName+"',user_pass='"+userPass+"',user_priv='#',real_name='"+realName+"',user_ip='"+userIp+"',last_date=sysdate,start_date=to_date('"+startDate+"','yyyy-mm-dd'),end_date=to_date('"+endDate+"','yyyy-mm-dd') where user_id='"+userId+"'";
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
	
}
