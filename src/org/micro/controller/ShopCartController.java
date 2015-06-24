package org.micro.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.micro.pub.exception.JsonException;
import org.micro.service.ShopCartService;
import org.micro.util.QryException;
import org.micro.util.WeixinAuth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cart.do")
public class ShopCartController 
{
	@Autowired
	private ShopCartService shopCartService ;
	
	@RequestMapping(params = "method=addCart")
	public void addCart(HttpServletResponse response , String  cart) 
	{
		try {
			shopCartService.addShopCart(cart);
		} catch (JsonException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(params = "method=gotoShopCart")
	public ModelAndView gotoShopCart(HttpServletResponse response ,HttpServletRequest request ,String openid ,String busId)
	{
		ModelAndView model = new ModelAndView("view/shop/shopCart");
		try 
		{
			shopCartService.gotoShopCart(model, openid, busId);
		}
		catch (QryException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(params = "method=getOrder")
	public ModelAndView getOrderById(HttpServletResponse response ,HttpServletRequest request) throws Exception 
	{
		String codeId = request.getParameter("code");
		String phone = request.getParameter("phone");
		String openId=WeixinAuth.getOpenId(codeId);
		ModelAndView model = new ModelAndView("view/shop/pay_history");
		response.setCharacterEncoding("utf-8");
		List list = null;
		try
		{
			list = shopCartService.getOrderById(openId, phone);
		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addObject("list", list);
		return model;
	}
	
}