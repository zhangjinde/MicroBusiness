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
 * 1������ehcache,�����ݲ��ѯ��������档<br>
 *<p>
 * 2��SysCacheDao�������ݹ�������ʹ��@Cacheable�����ϻ��棬SysCacheDao�ṩԴ�����ݡ�<br>
 *<p>
 * 3���м�@Cacheableֻ����SysCacheDao�༰ServiceCahce��(���񻺴�)��ʹ�ã����ڻ������ݼ������ƹ���<br>
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
