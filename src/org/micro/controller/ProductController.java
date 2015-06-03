package org.micro.controller;

import javax.servlet.http.HttpServletRequest;

import org.micro.service.ProductService;
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
	
	@RequestMapping(params = "method=getProduct")
	public ModelAndView logout(HttpServletRequest request , String productId)
	{
		ModelAndView model = new ModelAndView();
		productService.getProductInfo(productId,  model);
		return model;
	}
}
