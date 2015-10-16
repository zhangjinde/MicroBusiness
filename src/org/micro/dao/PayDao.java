package org.micro.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.micro.pub.util.ObjectCensor;
import org.micro.pub.util.QryException;
import org.micro.pub.util.StringUtil;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class PayDao extends BaseDao
{
	@Transactional
	public String addOrder(String busDetailId , String customerId , String telephone , String customerAddr , String productId , String productNum, String productPrice, String openId, String name) throws Exception
	{
		String prefix = generateOrderIdPrefix();
		String sql = "insert into order_t(order_id,bus_detail_id,customer_id,telephone,customer_address,order_price,create_date,expire_date,state_date,sts,weixin_id,customer_name) values (?||MICRO_ORDER_SEQ.nextval,?,?,?,?,?,sysdate,sysdate+1,sysdate,'A',?,?)";
		if(jdbcTemplate.update(sql, new Object[]{prefix,busDetailId,customerId,telephone,customerAddr,String.valueOf(Double.parseDouble(productNum)*Double.parseDouble(productPrice)),openId,name}) > 0)
		{
			sql = "insert into order_detail_t(order_detail_id,order_id,product_id,product_num,create_date,state_date,sts) values(MICRO_ORDER_DET_SEQ.nextval,?||MICRO_ORDER_SEQ.currval,?,?,sysdate,sysdate,'A')";
			if(jdbcTemplate.update(sql, new Object[]{prefix,productId,productNum})>0)
			{
				sql = "insert into order_flow_t(order_flow_id,order_id,order_flow_state,create_date,state_date,is_cur_state) values(MICRO_ORDER_FLOW_SEQ.nextval,?||MICRO_ORDER_SEQ.currval,'A',sysdate,sysdate,'A')";
				if(jdbcTemplate.update(sql, new Object[]{prefix}) > 0)
				{
					sql = "select MICRO_ORDER_SEQ.nextval-1 order_val from dual";
					List list = qryCenter.executeSqlByMapListWithTrans(sql, new ArrayList());
					return prefix+StringUtil.getMapKeyVal((Map)list.get(0), "orderVal");
				}
			}
		}
		throw new IllegalArgumentException("订单入库失败");
	}
	
	//购物车
	@Transactional
	public String addOrder(String busDetailId , String customerId , String telephone , String customerAddr , String productInfo , String totalPrice, String openId, String name) throws Exception
	{
		String prefix = generateOrderIdPrefix();
		JSONArray json = JSONArray.fromObject(productInfo);
		String sql = "insert into order_t(order_id,bus_detail_id,customer_id,telephone,customer_address,order_price,create_date,expire_date,state_date,sts,weixin_id,customer_name) values (?||MICRO_ORDER_SEQ.nextval,?,?,?,?,?,sysdate,sysdate+1,sysdate,'A',?,?)";
		if(jdbcTemplate.update(sql, new Object[]{prefix,busDetailId,customerId,telephone,customerAddr,totalPrice,openId,name}) > 0)
		{
			sql = "insert into order_flow_t(order_flow_id,order_id,order_flow_state,create_date,state_date,is_cur_state) values(MICRO_ORDER_FLOW_SEQ.nextval,?||MICRO_ORDER_SEQ.currval,'A',sysdate,sysdate,'A')";
			if(jdbcTemplate.update(sql, new Object[]{prefix}) > 0)
			{
				for(int i = 0,n = json.size();i < n;i++)
				{
					JSONObject obj = json.getJSONObject(i);
					sql = "insert into order_detail_t(order_detail_id,order_id,product_id,product_num,create_date,state_date,sts) values(MICRO_ORDER_DET_SEQ.nextval,?||MICRO_ORDER_SEQ.currval,?,?,sysdate,sysdate,'A')";
					String productId = StringUtil.getJSONObjectKeyVal(obj, "productId");
					String productNum = StringUtil.getJSONObjectKeyVal(obj, "productNum");
					jdbcTemplate.update(sql, new Object[]{prefix,productId,productNum});
				}
				sql = "delete from cart_t t where weixin_id = ?";
				jdbcTemplate.update(sql, new Object[]{openId});
				sql = "select MICRO_ORDER_SEQ.nextval-1 order_val from dual";
				List list = qryCenter.executeSqlByMapListWithTrans(sql, new ArrayList());
				return prefix+StringUtil.getMapKeyVal((Map)list.get(0), "orderVal");
			}
		}
		throw new IllegalArgumentException("订单入库失败");
	}
	
	private String generateOrderIdPrefix()
	{
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		return String.format("E%s", sdf.format(date));
	}
	
	public List getOrderById(String wenxinId,String phone) throws QryException
	{
		StringBuffer sql= new StringBuffer("select distinct(t.order_id), t.*,a.product_id,b.img_url,b.product_price,b.product_name from order_t t ,order_detail_t a,product_t b where t.order_id=a.order_id and a.product_id=b.product_id and t.sts='A' and b.sts = 'A' and a.sts = 'A' ");
		ArrayList arrayList = new ArrayList();
		if(!ObjectCensor.checkObjectIsNull(wenxinId))
		{
			sql.append("and t.weixin_id=? ");
			arrayList.add(wenxinId);
		}
		if(!ObjectCensor.checkObjectIsNull(phone))
		{
			sql.append("and t.telephone=? ");
			arrayList.add(phone);
		}
		return qryCenter.executeSqlByMapListWithTrans(sql.toString(), arrayList);
	}
	
	public List<Map<String,String>> getOrderInfo(String orderId) throws QryException
	{
		String sql = "select m.order_id,m.bus_id,m.bus_detail_id,m.bus_name,m.customer_id,n.customer_detail_id,m.customer_name,m.telephone,m.customer_address,m.order_price,m.bus_detail_name,m.bus_addr,m.bus_telephone from (select a.order_id,b.bus_id,a.bus_detail_id,c.bus_name,a.customer_id,a.customer_name,a.telephone,a.customer_address,a.order_price,b.bus_detail_name,b.bus_addr,b.bus_telephone from order_t a,business_detail_t b,business_t c where b.sts = 'A' and c.sts = 'A' and a.bus_detail_id = b.bus_detail_id and b.bus_id = c.bus_id and a.order_id = ?) m,(select d.customer_id,e.customer_detail_id,d.customer_name from customer_t d,customer_address_t e where d.sts = 'A' and e.sts = 'A' and d.customer_id = e.customer_id and is_primary='A') n where m.customer_id = n.customer_id(+)";
		ArrayList arrayList = new ArrayList();
		arrayList.add(orderId);
		return qryCenter.executeSqlByMapListWithTrans(sql, arrayList);
	}
	
	public List<Map<String,String>> getCustomerOrderAddr(String orderId) throws QryException
	{
		String sql = "select a.customer_id,b.customer_detail_id,b.customer_name,b.customer_telephone,b.prov_id,b.city_id,b.district_id,b.customer_addr customer_address,b.customer_postcode,b.is_primary from customer_t a,customer_address_t b,order_t c where a.customer_id = b.customer_id and c.customer_id = a.customer_id and c.order_id = ?";
		ArrayList arrayList = new ArrayList();
		arrayList.add(orderId);
		return qryCenter.executeSqlByMapListWithTrans(sql, arrayList);
	}
	
	public List<Map<String,String>> getOrderDetailList(String orderId) throws QryException
	{
		String sql = "select a.order_detail_id,a.product_id,b.product_name,b.product_price,a.product_num,b.img_url,b.product_desc from order_detail_t a,product_t b where a.product_id = b.product_id and a.order_id = ? and a.sts = 'A' and b.sts = 'A' ";
		ArrayList arrayList = new ArrayList();
		arrayList.add(orderId);
		return qryCenter.executeSqlByMapListWithTrans(sql, arrayList);
	}
	
	public List<Map<String,String>> getBusDetailList(String busId) throws QryException
	{
		String sql = "select * from business_detail_t where bus_id = ? and sts = 'A'";
		ArrayList arrayList = new ArrayList();
		arrayList.add(busId);
		return qryCenter.executeSqlByMapListWithTrans(sql, arrayList);
	}
	
	@Transactional
	public String setOrderAddr(String customerId , String customerDetailId , String orderId) throws QryException
	{
		String sql = "update customer_address_t set is_primary='P',state_date=sysdate where customer_id = ? ";
		jdbcTemplate.update(sql, new Object[]{customerId});
		sql = "update customer_address_t set is_primary='A',state_date=sysdate where customer_detail_id = ?";
		jdbcTemplate.update(sql, new Object[]{customerDetailId});
		sql = "select * from customer_address_t where customer_detail_id = ? and sts = 'A'";
		ArrayList arrayList = new ArrayList();
		arrayList.add(customerDetailId);
		List list = qryCenter.executeSqlByMapListWithTrans(sql, arrayList);
		if(ObjectCensor.checkListIsNull(list))
		{
			Map map = (Map)list.get(0);
			String provName = StringUtil.getMapKeyVal(map, "provinceName");
			String cityName = StringUtil.getMapKeyVal(map, "cityName");
			String districtName = StringUtil.getMapKeyVal(map, "districtName");
			String customerName = StringUtil.getMapKeyVal(map, "customerName");
			String customerPhone = StringUtil.getMapKeyVal(map, "customerTelephone");
			String addr = StringUtil.getMapKeyVal(map, "customerAddr");
//			addr = new StringBuffer().append(provName).append(cityName).append(districtName).append(addr).toString();
			sql = "update customer_t set customer_name = ?,customer_telephone = ? where customer_id = ?";
			if(jdbcTemplate.update(sql,new Object[]{customerName,customerPhone,customerId}) > 0)
			{
				sql = "update order_t set telephone = ?,customer_address = ? where order_id = ?";
				if(jdbcTemplate.update(sql,new Object[]{customerPhone,addr,orderId}) > 0)
				{
					return "success";
				}
			}
		}
		else
		{
			sql = "select * from customer_address_t where customer_detail_id = ?";
			arrayList = new ArrayList();
			arrayList.add(customerDetailId);
			list = qryCenter.executeSqlByMapListWithTrans(sql, arrayList);
			if(ObjectCensor.checkListIsNull(list))
			{
				Map map = (Map)list.get(0);
				String customerName = StringUtil.getMapKeyVal(map, "customerName");
				String customerPhone = StringUtil.getMapKeyVal(map, "customerTelephone");
				String addr = StringUtil.getMapKeyVal(map, "customerAddr");
				sql = "update customer_t set customer_name = ?,customer_telephone = ? where customer_id = ?";
				if(jdbcTemplate.update(sql,new Object[]{customerName,customerPhone,customerId}) > 0)
				{
					sql = "update order_t set telephone = ?,customer_address = ? where order_id = ?";
					if(jdbcTemplate.update(sql,new Object[]{customerPhone,addr,orderId}) > 0)
					{
						return "success";
					}
				}
			}
		}
		return "success";
	}
	
	public String saveNewUserOrder(String orderId , String customerPhone , String addr , String customerName , String customerId)
	{
		String sql = "update order_t set telephone = ?,customer_address = ?,customer_id = ?,customer_name = ? where order_id = ?";
		if(jdbcTemplate.update(sql,new Object[]{customerPhone,addr,customerId,customerName,orderId}) > 0)
		{
			return "success";
		}
		else
		{
			return "failure";
		}
	}
	
	public List<Map<String,String>> qryOrderList(String orderType , String openId , int pageNum , int pageSize) throws QryException
	{
		StringBuffer sb = new StringBuffer("SELECT * FROM (SELECT A.*, ROWNUM RN FROM (select a.order_id,a.order_price,a.sts from order_t a where a.weixin_id = ? ");
		ArrayList paramList = new ArrayList();
		paramList.add(openId);
		if(!"F".equals(orderType))
		{
			sb.append(" and a.sts = ? ");
			paramList.add(orderType);
		}
		sb.append(" order by a.state_date desc) A WHERE ROWNUM <= ?) WHERE RN >= ?");
    	paramList.add(pageNum * pageSize);
    	paramList.add((pageNum - 1) * pageSize + 1);
    	return qryCenter.executeSqlByMapListWithTrans(sb.toString(), paramList);
	}
	
	public List<Map<String,String>> qryOrderDetailInfo(String orderIds) throws QryException
	{
		if(ObjectCensor.isStrRegular(orderIds))
		{
			StringBuffer sb = new StringBuffer("select a.order_id,c.product_id,c.product_name,c.product_price,b.product_num,c.img_url from order_t a,order_detail_t b,product_t c where a.sts='A' and b.sts='A' and c.sts='A' and a.order_id = b.order_id and b.product_id = c.product_id and a.order_id in (");
			sb.append(orderIds);
			sb.append(")");
			return qryCenter.executeSqlByMapListWithTrans(sb.toString() , new ArrayList());
		}
		else
		{
			return new ArrayList<Map<String,String>>();
		}
	}
	
	public String qryOrderListCnt(String orderType , String openId) throws QryException
	{
		StringBuffer sb = new StringBuffer("select count(*) total from order_t a where a.weixin_id = ?");
		ArrayList paramList = new ArrayList();
		paramList.add(openId);
		if(!"F".equals(orderType))
		{
			sb.append(" and a.sts = ?");
			paramList.add(orderType);
		}
		List<Map<String,String>> list = qryCenter.executeSqlByMapListWithTrans(sb.toString(), paramList);
		return StringUtil.getMapKeyVal(list.get(0), "total");
	}
	
	public String cancelOrder(String orderId)
	{
		String sql = "update order_t set sts = 'P',state_date = sysdate where order_id = ?";
		if(jdbcTemplate.update(sql,new Object[]{orderId}) > 0)
		{
			return "success";
		}
		else
		{
			return "failure";
		}
	}
	
	public String orderFunc(String orderId , String sts)
	{
		String sql = "update order_t set sts = ?,state_date = sysdate where order_id = ?";
		if(jdbcTemplate.update(sql,new Object[]{sts,orderId}) > 0)
		{
			return "success";
		}
		else
		{
			return "failure";
		}
	}
	
	public String payOrder(String orderId , String busDetailId)
	{
		String sql = "update order_t set sts = 'R',state_date = sysdate,bus_detail_id = ?,is_new = 'Y' where order_id = ?";
		if(jdbcTemplate.update(sql,new Object[]{busDetailId,orderId}) > 0)
		{
			return "success";
		}
		else
		{
			return "failure";
		}
	}
	
	public List<Map<String,String>> getOrderList(String orderType , int pageNum , int pageSize) throws QryException
	{
		StringBuffer sb = new StringBuffer("SELECT * FROM (SELECT A.*, ROWNUM RN FROM (select a.order_id,a.customer_name,a.telephone,a.customer_address,a.order_price,a.sts,case a.sts when 'A' then '待付款' when 'R' then '待发货' when 'H' then '已发货' when 'O' then '已完成' when 'P' then '已取消' end sts_name,to_char(a.create_date,'yyyy-mm-dd hh24:mi:ss') create_date,to_char(a.state_date,'yyyy-mm-dd hh24:mi:ss') state_date,b.bus_detail_name,b.bus_addr from order_t a,business_detail_t b where a.bus_detail_id = b.bus_detail_id and b.sts = 'A' ");
		ArrayList paramList = new ArrayList();
		if(ObjectCensor.isStrRegular(orderType))
		{
			sb.append(" and a.sts = ? ");
			paramList.add(orderType);
		}
		sb.append(" order by a.state_date desc) A WHERE ROWNUM <= ?) WHERE RN >= ?");
    	paramList.add(pageNum * pageSize);
    	paramList.add((pageNum - 1) * pageSize + 1);
    	return qryCenter.executeSqlByMapListWithTrans(sb.toString(), paramList);
	}
	
	public String getOrderListCnt(String orderType) throws QryException
	{
		StringBuffer sb = new StringBuffer("select count(*) total from order_t a where 1=1 ");
		ArrayList paramList = new ArrayList();
		if(ObjectCensor.isStrRegular(orderType))
		{
			sb.append(" and a.sts = ? ");
			paramList.add(orderType);
		}
		List<Map<String,String>> list = qryCenter.executeSqlByMapListWithTrans(sb.toString(), paramList);
		return StringUtil.getMapKeyVal(list.get(0), "total");
	}
	
	public List<Map<String,String>> getOrderDetailInfo(String orderId , int pageNum , int pageSize) throws QryException
	{
		String sql = "SELECT * FROM (SELECT A.*, ROWNUM RN FROM (select b.product_name,b.product_price,a.product_num from order_detail_t a,product_t b where a.product_id = b.product_id and a.sts='A' and b.sts='A' and a.order_id=?) A WHERE ROWNUM <= ?) WHERE RN >= ?";
		ArrayList paramList = new ArrayList();
		paramList.add(orderId);
    	paramList.add(pageNum * pageSize);
    	paramList.add((pageNum - 1) * pageSize + 1);
		return qryCenter.executeSqlByMapListWithTrans(sql, paramList);
	}
	
	public String getOrderDetailInfoCnt(String orderId) throws QryException
	{
		String sql = "select count(*) total from order_detail_t a where a.order_id=?";
		ArrayList paramList = new ArrayList();
		paramList.add(orderId);
		List<Map<String,String>> list = qryCenter.executeSqlByMapListWithTrans(sql, paramList);
		return StringUtil.getMapKeyVal(list.get(0), "total");
	}
	
	public List<Map<String,Object>> getBusDetailList(String busDetailId , String state , int pageNum , int pageSize) throws QryException
	{
		StringBuffer sql = new StringBuffer("SELECT * FROM (SELECT A.*, ROWNUM RN FROM (select order_id,bus_detail_id,customer_id,telephone,customer_address,order_price,to_char(create_date,'yyyy-mm-dd hh24:mi:ss') create_date,to_char(expire_date,'yyyy-mm-dd hh24:mi:ss') expire_date,to_char(state_date,'yyyy-mm-dd hh24:mi:ss') state_date,sts,case sts when 'R' then '待发货' when 'H' then '已发货' when 'O' then '已完成' when 'P' then '已取消' end sts_name,customer_name,is_new,case is_new when 'Y' then '新订单' when 'N' then '老订单' end is_new_name from order_t where sts in (");
		sql.append(state);
		sql.append(") and bus_detail_id = ? order by state_date desc) A WHERE ROWNUM <= ?) WHERE RN >= ?");
		ArrayList paramList = new ArrayList();
		paramList.add(busDetailId);
    	paramList.add(pageNum * pageSize);
    	paramList.add((pageNum - 1) * pageSize + 1);
		return qryCenter.executeSqlByMapListWithTrans(sql.toString(), paramList);
	}
	
	public List<Map<String,String>> getOrderDetail(String orderId) throws QryException
	{
		String sql = "select b.product_name,b.product_price,a.product_num from order_detail_t a,product_t b where a.product_id = b.product_id and a.sts='A' and b.sts='A' and a.order_id=?";
		ArrayList paramList = new ArrayList();
		paramList.add(orderId);
		return qryCenter.executeSqlByMapListWithTrans(sql, paramList);
	}
	
	public String getBusDetailListCnt(String busDetailId , String state) throws QryException
	{
		StringBuffer sql = new StringBuffer("select count(*) total from order_t where sts in (");
		sql.append(state);
		sql.append(") and bus_detail_id = ?");
		ArrayList paramList = new ArrayList();
		paramList.add(busDetailId);
		List<Map<String,String>> list = qryCenter.executeSqlByMapListWithTrans(sql.toString(), paramList);
		return StringUtil.getMapKeyVal(list.get(0), "total");
	}
	
	public String hasNewBusOrder(String busDetailId) throws QryException
	{
		String sql = "select * from order_t where is_new = 'Y' and bus_detail_id = ?";
		ArrayList paramList = new ArrayList();
		paramList.add(busDetailId);
		List<Map<String,String>> list = qryCenter.executeSqlByMapListWithTrans(sql.toString(), paramList);
		if(ObjectCensor.checkListIsNull(list))
		{
			return "true";
		}
		else
		{
			return "false";
		}
	}
	
	public String operNewBusOrder(String busDetailId , String orderIds)
	{
		StringBuffer sql = new StringBuffer("update order_t set is_new = 'N' where is_new = 'Y' and bus_detail_id = ? ");
		if(ObjectCensor.isStrRegular(orderIds))
		{
			sql.append(" and order_id in (");
			sql.append(orderIds);
			sql.append(")");
		}
		jdbcTemplate.update(sql.toString(),new Object[]{busDetailId});
		return "success";
	}
	
}
