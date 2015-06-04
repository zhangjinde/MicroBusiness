package org.micro.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
		String sql = "select product_name,product_price,product_num from order_detail_t a,product_t b where a.product_id = b.product_id and b.product_id = ?";
		ArrayList paramList = new ArrayList();
		paramList.add(productId);
		return qryCenter.executeSqlByMapListWithTrans(sql, paramList);
	}
	
	
}