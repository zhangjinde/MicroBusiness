package org.micro.pub.cache;

import java.util.ArrayList;
import java.util.List;

import org.micro.dao.BaseDao;
import org.micro.util.QryCenter;
import org.micro.util.QryException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


/**
*<p>
 * 1、利用ehcache,将数据层查询结果集缓存。<br>
 *<p>
 * 2、SysCacheDao缓存数据管理器，使用@Cacheable将集合缓存，SysCacheDao提供源表数据。<br>
 *<p>
 * 3、切忌@Cacheable只能在SysCacheDao类及ServiceCahce类(服务缓存)类使用，便于缓存数据集中配制管理。<br>
 * @author RHQ
 */
@Repository
public class SysCacheDao extends BaseDao
{
	@Autowired
	private QryCenter qryCenter;
	
	public List getProducts() throws QryException
	{
		String sql="select * from product_t where sts = 'A'";
		ArrayList paramList = new ArrayList();
		return qryCenter.executeSqlByMapListWithTrans(sql, paramList);
	}
	 
}
