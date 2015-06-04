package org.micro.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.micro.pub.cache.CacheManager;
import org.micro.service.ProductService;
import org.micro.util.QryException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product.do")
public class ProductController 
{
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CacheManager cacheManager;
	
	@RequestMapping(params = "method=getProduct")
	public ModelAndView logout(HttpServletRequest request , String productId)
	{
		ModelAndView model = new ModelAndView();
		productService.getProductInfo(productId,  model);
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
}
