package org.micro.pub.cache;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.micro.util.ObjectCensor;
import org.micro.util.QryException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

 
/**
 * 
 * @author Lapland_Alone
 *
 */
@Component
public class CacheManager
{
	private static Log log = LogFactory.getLog(CacheManager.class);
	
	@Autowired
	private SysCacheDao sysCacheDao;

	public int getPageSize() throws QryException
	{
		List prods= sysCacheDao.getProducts();
		return prods.size();
		
	}
	
	public List getProdsByPage(int pageNum) throws QryException
	{
		int i=1;
		List prodsList = new ArrayList();
		List prods= sysCacheDao.getProducts();
		if(ObjectCensor.checkListIsNull(prods))
		{
			int prodsTotal=prods.size();
			if(prodsTotal<10)
			{
				return prods;
			}
			if (pageNum < 2)
			{      
				 for (i = pageNum; i < 10;i++)     
				 {
					 prodsList.add(prods.get(i));
				 }
		    } else
		     {  
		    	int count =10 + (pageNum-1) * 10 + 1;
		    	if(prodsTotal< 10 + (pageNum-1) * 10 + 1)
		    	{
		    		count=prodsTotal;
		    	}
		    	for (i = (pageNum-1) * 10 + 1; i < count;i++)              
			 	{
		    		 prodsList.add(prods.get(i));
			 	}
			 }
		}
		return prodsList;
	}
}
