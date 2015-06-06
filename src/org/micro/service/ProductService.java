package org.micro.service;

import java.util.List;
import java.util.Map;

import org.micro.dao.ProductDao;
import org.micro.util.ObjectCensor;
import org.micro.util.QryException;
import org.micro.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class ProductService 
{
	@Autowired
	private ProductDao productDao;
	
	public void getProductInfo(String productId , ModelAndView model)
	{
		boolean errorFlag = false;
		if(ObjectCensor.isStrRegular(productId) && StringUtil.checkStringIsNum(productId))
		{
			try
			{
				List productList = productDao.getProduct(productId);
				if(ObjectCensor.checkListIsNull(productList))
				{
					Map map = (Map)productList.get(0);
					List<Map<String,String>> productOrderList = productDao.getProductWithOrder(productId);
					map.put("productOrderList", productOrderList);
					model.addObject("product", map);
					errorFlag = true;
				}
				else
				{
					model.addObject("exception.message", "没有对应的产品，请核实后重新尝试");
				}
			}
			catch (QryException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			model.addObject("exception.message", "产品信息有误，请核实后重新尝试");
		}
		if(errorFlag)
		{
			model.setViewName("view/shop/product_detail");
		}
		else
		{
			model.setViewName("common/exception");
		}
	}
	
	public List getCartProd(String id,String telephone) throws QryException
	{
		return productDao.getCartProdById(id, telephone);
	}
}
