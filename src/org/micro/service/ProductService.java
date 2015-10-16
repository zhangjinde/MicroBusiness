package org.micro.service;

import java.util.List;
import java.util.Map;

import org.micro.dao.ConfigDao;
import org.micro.dao.CustomerDao;
import org.micro.dao.PayDao;
import org.micro.dao.ProductDao;
import org.micro.pub.util.ObjectCensor;
import org.micro.pub.util.QryException;
import org.micro.pub.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class ProductService 
{
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private CustomerDao customerDao;
	
	@Autowired
	private PayDao payDao;
	
	@Autowired
	private ConfigDao configDao;
	
	public void getProductInfo(String busId , String productId , String openId , ModelAndView model)
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
					List<Map<String,String>> customerList = customerDao.getCustomer(openId, busId);
					if(ObjectCensor.checkListIsNull(customerList))
					{
						model.addObject("newUser", "N");
					}
					else
					{
						model.addObject("newUser", "Y");
					}
					List<Map<String,String>> cartList = productDao.getCartProdById(openId, null);
					if(ObjectCensor.checkListIsNull(cartList))
					{
						model.addObject("cartFlag", "Y");
					}
					else
					{
						model.addObject("cartFlag", "N");
					}
					List<Map<String,String>> provList = configDao.getProvList();
					model.addObject("provList", provList);
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
	
	public void payOrder(ModelAndView model , String busId , String orderId) throws QryException
	{
		List<Map<String,String>> list = payDao.getOrderInfo(orderId);
		if(ObjectCensor.checkListIsNull(list))
		{
			Map map = list.get(0);
			List<Map<String,String>> orderDetailList = payDao.getOrderDetailList(orderId);
			map.put("orderDetailList", orderDetailList);
			List<Map<String,String>> busDetailList = payDao.getBusDetailList(busId);
			map.put("busDetailList", busDetailList);
			List<Map<String,String>> custAddrList = payDao.getCustomerOrderAddr(orderId);
			map.put("custAddrList", custAddrList);
			model.addObject("orderInfo", map);
			List<Map<String,String>> provList = configDao.getProvList();
			model.addObject("provList", provList);
		}
		else
		{
			model.addObject("errorModel", "订单不存在请核实后重新尝试");
		}
	}
	
	public List getCartProd(String id,String telephone) throws QryException
	{
		return productDao.getCartProdById(id, telephone);
	}
	
	public List<Map<String,String>> getProductList(String busId , int pageNum , int pageSize) throws QryException
	{
		return productDao.getProductList(busId, pageNum, pageSize);
	}
	
	public int getProductListCount(String busId) throws QryException
	{
		String count = productDao.getProductListCount(busId);
		return Integer.parseInt(count);
	}
}
