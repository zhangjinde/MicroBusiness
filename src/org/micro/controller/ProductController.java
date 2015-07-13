package org.micro.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.micro.pub.cache.CacheManager;
import org.micro.pub.util.ObjectCensor;
import org.micro.pub.util.QryException;
import org.micro.pub.util.WeixinAuth;
import org.micro.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/product.do")
public class ProductController 
{
	public static Log log =LogFactory.getLog(ProductController.class);
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CacheManager cacheManager;
	
	@RequestMapping(params = "method=getProduct")
	public ModelAndView getProduct(HttpServletRequest request) throws Exception
	{
		 ModelAndView model = new ModelAndView();
		 String busId =request.getParameter("busId");
		 String productId=request.getParameter("productId"); 
		 String openId=request.getParameter("openId");/*已经存在*/
		 
		 if(ObjectCensor.checkObjectIsNull(openId))/*第一次获取*/
		 {
			  String codeId=request.getParameter("code");
			  log.error("code:"+codeId);
			  if(!ObjectCensor.checkObjectIsNull(codeId))/*第一次获取*/
			  {
				  	openId=WeixinAuth.getOpenId(codeId);
			  }
			  log.error("openid:"+openId);
		 }
		
		 productService.getProductInfo(busId, productId, openId, model);
		 return model;
	}
	
	@RequestMapping(params = "method=payOrder")
	public ModelAndView payOrder(HttpServletRequest request , String busId , String orderId , String openId)
	{
		ModelAndView model = new ModelAndView("view/shop/payPage");
		try {
			productService.payOrder(model, busId, orderId);
		} catch (QryException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addObject("errorModel", e.getMessage());
		}
		return model;
	}
	
	/**
	 * 获取所有商品
	 * @param request
	 * @param productId
	 * @return
	 */
	@RequestMapping(params = "method=getProds")
	public void getProdsAll(HttpServletResponse response , int page)
	{
		List list=null;
		PrintWriter out = null;
		response.setCharacterEncoding("UTF-8");
		int size=0;
		try 
		{
			out = response.getWriter();
			list =	cacheManager.getProdsByPage(page);
			size = cacheManager.getPageSize();
			} 
			catch (QryException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JSONObject object = new JSONObject();
			JSONArray prods= JSONArray.fromObject(list);
			
			object.put("prods", prods);
			object.put("size", size);
			out.println(object);
	}
	
	
	@RequestMapping(params = "method=getCartProds")
	public void getCartProds(HttpServletResponse response , String id,String telephone)
	{
		List list=null;
		PrintWriter out = null;
		response.setCharacterEncoding("UTF-8");
		int size=0;
		try 
		{
			out = response.getWriter();
			list = productService.getCartProd(id, telephone);
			} 
			catch (QryException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JSONObject object = new JSONObject();
			JSONArray prods= JSONArray.fromObject(list);
			
			object.put("prods", prods);
			object.put("size", prods.size());
			out.println(object);
	}
}
