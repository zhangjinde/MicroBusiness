package org.micro.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.micro.util.QryException;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDao extends BaseDao
{
	
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
