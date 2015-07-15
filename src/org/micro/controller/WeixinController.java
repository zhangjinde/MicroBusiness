package org.micro.controller;

import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.micro.service.WeixinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/pay")
public class WeixinController 
{
    private static Log log = LogFactory.getLog(WeixinController.class);
	
	@Autowired
	private WeixinService weiXinService;
	
	@RequestMapping("/payUnifiedorder.do")
	public ModelAndView payUnifiedorder(String openid , String body , String detail , String out_trade_no , String total_fee)
	{
		ModelAndView model = new ModelAndView("view/pay/payPage");
		try {
			weiXinService.payUnifiedorder(model, openid, body, detail, out_trade_no, total_fee);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return model;
	}
	
	
	@RequestMapping("/payResultNotify.do")
	public void payRollback(HttpServletResponse response , HttpServletRequest request)
	{
		PrintWriter out = null;
		try
		{
			InputStream inputStream = request.getInputStream();
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			String inputParam = IOUtils.toString(inputStream);
			log.error(inputParam);
			String retVal = "";
			log.error(retVal);
			out.write(retVal);
		}
		catch(Exception err)
		{
			out.write("error:"+err.getMessage());
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
