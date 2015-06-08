package org.micro.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.micro.util.QryException;
import org.micro.util.StringUtil;
import org.springframework.stereotype.Repository;

@Repository
public class PayDao extends BaseDao
{
	public String addOrder(String busDetailId , String customerId , String telephone , String customerAddr , String productId , String productNum, String productPrice)
	{
		String sql = "insert into order_t(order_id,bus_detail_id,customer_id,telephone,customer_address,order_price,create_date,expire_date,state_date,sts) values (MICRO_ORDER_SEQ.nextval,?,?,?,?,?,sysdate,sysdate+1,sysdate,'A')";
		if(jdbcTemplate.update(sql, new Object[]{busDetailId,customerId,telephone,customerAddr,String.valueOf(Double.parseDouble(productNum)*Double.parseDouble(productPrice))}) > 0)
		{
			sql = "insert into order_detail_t(order_detail_id,order_id,product_id,product_num,create_date,state_date,sts) values(MICRO_ORDER_DET_SEQ.nextval,MICRO_ORDER_SEQ.currval,?,?,sysdate,sysdate,'A')";
			if(jdbcTemplate.update(sql, new Object[]{productId,productNum})>0)
			{
				sql = "insert into order_flow_t(order_flow_id,order_id,order_flow_state,create_date,state_date,is_cur_state) values(MICRO_ORDER_FLOW_SEQ.nextval,MICRO_ORDER_SEQ.currval,'A',sysdate,sysdate,'A')";
				if(jdbcTemplate.update(sql) > 0)
				{
					return "success";
				}
			}
		}
		return "∂©µ•»Îø‚ ß∞‹";
	}
	
	public List getOrderById(String wenxinId,String phone) throws QryException
	{
		String sql="select distinct(t.order_id), t.*,a.product_id,b.img_url,b.product_price,b.product_name from order_t t ,order_detail_t a,product_t b where t.order_id=a.order_id and a.product_id=b.product_id and t.sts='A' and t.telephone=?";
		ArrayList arrayList = new ArrayList();
		arrayList.add(phone);
		return qryCenter.executeSqlByMapListWithTrans(sql, arrayList);
	}
	
}
