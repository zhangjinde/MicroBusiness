package org.micro.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.micro.service.PubService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pub.do")
public class PubController 
{
	@Autowired
	private PubService pubService;
	
	@RequestMapping(params = "method=getAreaInfo")
	public void getAreaInfo(HttpServletRequest request , HttpServletResponse response , String areaFlag , String areaValue)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			String retVal = pubService.getAreaInfo(areaFlag, areaValue);
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
