package org.micro.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.micro.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order.do")
public class OrderController 
{
	public static Log log =LogFactory.getLog(OrderController.class);
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(params = "method=qryOrderList")
	public void qryOrderList(HttpServletResponse response , String orderType , String openId , String pageNum , String pageSize)
	{
		PrintWriter out = null;
		try{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			String retVal = orderService.qryOrderList(orderType, openId, pageNum, pageSize);
			out.write(retVal);
		}catch(Exception err){
			err.printStackTrace();
		}
		finally{
			if(out != null)
			{
				out.close();
			}
		}
	}
	
	@RequestMapping(params = "method=cancelOrder")
	public void cancelOrder(HttpServletResponse response , String orderId)
	{
		PrintWriter out = null;
		try{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			String retVal = null;
			out.write(retVal);
		}catch(Exception err){
			err.printStackTrace();
		}
		finally{
			if(out != null)
			{
				out.close();
			}
		}
	}
	
}
