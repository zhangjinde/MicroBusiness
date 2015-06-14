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
	public String addOrder(String busDetailId , String customerId , String telephone , String customerAddr , String productId , String productNum, String productPrice) throws QryException
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
					sql = "select MICRO_ORDER_SEQ.nextval-1 order_val from dual";
					List list = qryCenter.executeSqlByMapListWithTrans(sql, new ArrayList());
					return StringUtil.getMapKeyVal((Map)list.get(0), "orderVal");
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
	
	public List<Map<String,String>> getOrderInfo(String orderId) throws QryException
	{
		String sql = "select a.order_id,b.bus_id,a.bus_detail_id,c.bus_name,a.customer_id,e.customer_detail_id,d.customer_name,a.telephone,a.customer_address,a.order_price,b.bus_detail_name,b.bus_addr,b.bus_telephone from order_t a,business_detail_t b,business_t c,customer_t d,customer_address_t e where a.bus_detail_id = b.bus_detail_id and b.bus_id = c.bus_id and d.customer_id = a.customer_id and d.customer_id = e.customer_id and is_primary='A' and a.order_id = ?";
		ArrayList arrayList = new ArrayList();
		arrayList.add(orderId);
		return qryCenter.executeSqlByMapListWithTrans(sql, arrayList);
	}
	
	public List<Map<String,String>> getCustomerOrderAddr(String orderId) throws QryException
	{
		String sql = "select a.customer_id,b.customer_detail_id,a.customer_name,a.customer_telephone,b.prov_id,b.city_id,b.district_id,c.customer_address,b.customer_postcode,b.is_primary from customer_t a,customer_address_t b,order_t c where a.customer_id = b.customer_id and c.customer_id = a.customer_id and c.order_id =?";
		ArrayList arrayList = new ArrayList();
		arrayList.add(orderId);
		return qryCenter.executeSqlByMapListWithTrans(sql, arrayList);
	}
	
	public List<Map<String,String>> getOrderDetailList(String orderId) throws QryException
	{
		String sql = "select a.order_detail_id,a.product_id,b.product_name,b.product_price,a.product_num,b.img_url,b.product_desc from order_detail_t a,product_t b where a.product_id = b.product_id and a.order_id = ?";
		ArrayList arrayList = new ArrayList();
		arrayList.add(orderId);
		return qryCenter.executeSqlByMapListWithTrans(sql, arrayList);
	}
	
	public List<Map<String,String>> getBusDetailList(String busId) throws QryException
	{
		String sql = "select * from business_detail_t where bus_id = ?";
		ArrayList arrayList = new ArrayList();
		arrayList.add(busId);
		return qryCenter.executeSqlByMapListWithTrans(sql, arrayList);
	}
	
}
