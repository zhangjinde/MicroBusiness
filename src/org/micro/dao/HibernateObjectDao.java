package org.micro.dao;

import java.util.List;

import org.micro.model.CartT;
import org.springframework.stereotype.Repository;

@Repository
public class HibernateObjectDao extends org.micro.pub.base.BaseDao
{
	public List<CartT> getCartById(String weixinId,String productId,String customerId)
	{
		String hql=" from CartT as model from where model.state='A' and model.weixinId=? and model.productId=?";
		return this.find(hql, new String[]{ weixinId,productId});
	}
	
}
