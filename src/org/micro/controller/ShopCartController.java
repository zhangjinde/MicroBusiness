package org.micro.controller;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.micro.pub.exception.JsonException;
import org.micro.service.ShopCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cart.do")
public class ShopCartController 
{
	@Autowired
	private ShopCartService shopCartService ;
	
	@RequestMapping(params = "method=addCart")
	public void addCart(HttpServletResponse response , String  cart) 
	{
		System.out.println(cart);
		try {
			shopCartService.addShopCart(cart);
		} catch (JsonException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}