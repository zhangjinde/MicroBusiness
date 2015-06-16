package org.micro.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.micro.service.PayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pay.do")
public class PayController 
{
	@Autowired
	private PayService payService;
	
	@RequestMapping(params = "method=addOrder")
	public void addOrder(HttpServletRequest request , HttpServletResponse response , String busId , String openId , String productId , String productNum , String productPrice , String xPos , String yPos , String name , String contactNum , String provId , String cityId , String districtId , String addr , String postCode)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			String retVal = payService.addOrder(busId, openId, productId, productNum, productPrice, xPos, yPos, name, contactNum, provId, cityId, districtId, addr, postCode);
			out.write(retVal);
		}
		catch(Exception err)
		{
			err.printStackTrace();
		}
		finally
		{
			if(out != null)
			{
				out.close();
			}
		}
	}
	
}
