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
	public ModelAndView getProduct(HttpServletRequest request , String busId , String productId , String phoneNum)
	{
		ModelAndView model = new ModelAndView();
		productService.getProductInfo(busId, productId, phoneNum, model);
		return model;
	}
	
	@RequestMapping(params = "method=payOrder")
	public ModelAndView payOrder(HttpServletRequest request , String busId , String productId , String phoneNum)
	{
		ModelAndView model = new ModelAndView("view/shop/payPage");
		return model;
	}
	
}
