package org.micro.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.micro.util.ObjectCensor;
import org.micro.util.QryException;
import org.micro.util.StringUtil;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDao extends BaseDao
{
	public List<Map<String,String>> getProductList(String busId , int pageNum , int pageSize) throws QryException
	{
		StringBuffer query = new StringBuffer();
		query.append(" SELECT * FROM (SELECT A.*, ROWNUM RN FROM (select * from ( ");
		query.append(" select * from product_t where bus_id = ? and sts = 'A' ");
		query.append(" )) A WHERE ROWNUM <= ?)  WHERE RN >= ? ");
		ArrayList paramList = new ArrayList();
		paramList.add(busId);
		paramList.add(pageNum * pageSize);
		paramList.add((pageNum - 1) * pageSize + 1);
		return qryCenter.executeSqlByMapListWithTrans(query.toString(), paramList);
	}
	
	public String getProductListCount(String busId) throws QryException
	{
		String sql = "select count(*) total from product_t where bus_id = ?";
		ArrayList paramList = new ArrayList();
		paramList.add(busId);
		List<Map<String,String>> list = qryCenter.executeSqlByMapListWithTrans(sql, paramList);
		return StringUtil.getMapKeyVal(list.get(0), "total");
	}
	
	public List<Map<String,String>> getProduct(String productId) throws QryException
	{
		String sql = "select * from product_t where product_id = ? and sts = 'A'";
		ArrayList paramList = new ArrayList();
		paramList.add(productId);
		return qryCenter.executeSqlByMapListWithTrans(sql, paramList);
	}
	
	public List<Map<String,String>> getProductWithOrder(String productId) throws QryException
	{
		String sql = "select customer_name,product_num,a.create_date from order_t a,order_detail_t b,customer_t c where a.order_id = b.order_id and a.customer_id = c.customer_id and product_id = ?";
		ArrayList paramList = new ArrayList();
		paramList.add(productId);
		return qryCenter.executeSqlByMapListWithTrans(sql, paramList);
	}
	
	/**
	 * 获取购物车记录
	 * @param id
	 * @param telephone
	 * @return
	 * @throws QryException
	 */
	public List<Map<String,String>> getCartProdById(String id,String telephone) throws QryException
	{
		ArrayList paramList = new ArrayList();
		StringBuffer sql = new StringBuffer("select t.*,A.* from cart_t t,product_t a  where t.product_id=a.product_id ");
		if(!ObjectCensor.checkObjectIsNull(id))
		{
		    sql.append("  and t.id=? ");	
		    paramList.add(id);
		}
		if(!ObjectCensor.checkObjectIsNull(telephone))
		{
			 sql.append(" and t.telephone=? ");	
			 paramList.add(telephone);
		}
		
		return qryCenter.executeSqlByMapListWithTrans(sql.toString(), paramList);
	}
}
