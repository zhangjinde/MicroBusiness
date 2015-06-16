package org.micro.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.micro.service.UserService;
import org.micro.util.QryException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user.do")
public class UserController 
{

	@Autowired
	private UserService userService;
	
	@RequestMapping(params = "method=login")
	public ModelAndView userLogin(HttpServletResponse response , HttpServletRequest request) throws QryException
	{
		ModelAndView model = new ModelAndView("/view/shop/shopCart");
		response.setCharacterEncoding("utf-8");
		String telephone=request.getParameter("phone");
		String password=request.getParameter("password");
		Map user = userService.userLogin(telephone, password);
		model.addObject("telephone", telephone);
		return model;
	}
	
	@RequestMapping(params = "method=qryUserList")
	public void qryUserList(HttpServletResponse response , HttpServletRequest request)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			HttpSession session = request.getSession();
			Map<String,String> userMap = (Map<String,String>)session.getAttribute("UserInfo");
			String page = request.getParameter("page");
			String rows = request.getParameter("rows");
			String retVal = userService.qryUserList(page , rows);
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
	
	@RequestMapping(params = "method=newUser")
	public void newUser(String userName , String realName , String startDate , String endDate , HttpServletResponse response , HttpServletRequest request)
	{
		PrintWriter out = null;
		JSONObject json = new JSONObject();
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			HttpSession session = request.getSession();
			Map<String,String> userMap = (Map<String,String>)session.getAttribute("UserInfo");
			if(userMap != null)
			{
				String userIp = request.getRemoteAddr();
				out.write(userService.newUser(userName, realName, startDate, endDate, userIp));
			}
			else
			{
				json.put("success", 0);
				json.put("msg", "新增用户失败");
				out.write(json.toString());
			}
		}
		catch(Exception err)
		{
			err.printStackTrace();
			json.put("success", 0);
			json.put("msg", err.getMessage());
			out.write(json.toString());
		}
		finally
		{
			if(out != null)
			{
				out.close();
			}
		}
	}
	
	@RequestMapping(params = "method=updateUser")
	public void updateUser(String userId , String userName , String realName , String startDate , String endDate , HttpServletResponse response , HttpServletRequest request)
	{
		PrintWriter out = null;
		JSONObject json = new JSONObject();
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			HttpSession session = request.getSession();
			Map<String,String> userMap = (Map<String,String>)session.getAttribute("UserInfo");
			if(userMap != null)
			{
				out.write(userService.updateUserInfo(userId, userName, realName, startDate, endDate));
			}
			else
			{
				json.put("success", 0);
				json.put("msg", "修改用户失败");
				out.write(json.toString());
			}
		}
		catch(Exception err)
		{
			err.printStackTrace();
			json.put("success", 0);
			json.put("msg", err.getMessage());
			out.write(json.toString());
		}
		finally
		{
			if(out != null)
			{
				out.close();
			}
		}
	}
	
	@RequestMapping(params = "method=delUser")
	public void delUser(String userId , HttpServletResponse response , HttpServletRequest request)
	{
		PrintWriter out = null;
		JSONObject json = new JSONObject();
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			HttpSession session = request.getSession();
			Map<String,String> userMap = (Map<String,String>)session.getAttribute("UserInfo");
			if(userMap != null)
			{
				out.write(userService.delUser(userId));
			}
			else
			{
				json.put("success", 0);
				json.put("msg", "删除用户失败");
				out.write(json.toString());
			}
		}
		catch(Exception err)
		{
			err.printStackTrace();
			json.put("success", 0);
			json.put("msg", err.getMessage());
			out.write(json.toString());
		}
		finally
		{
			if(out != null)
			{
				out.close();
			}
		}
	}
	
	@RequestMapping(params = "saveCustomer")
	public void saveCustomer(HttpServletRequest request , HttpServletResponse response , String customerId , String customerName , String customerPhone , String provId , String cityId , String districtId , String addr , String postCode)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			String retVal = userService.saveCustomer(customerId, customerName, customerPhone, provId, cityId, districtId, addr, postCode);
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
	
	@RequestMapping(params = "updateCustomer")
	public void updateCustomer(HttpServletRequest request , HttpServletResponse response , String customerId , String customerDetailId , String customerName , String customerPhone , String provId , String cityId , String districtId , String addr , String postCode)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			String retVal = userService.updateCustomer(customerId, customerDetailId, customerName, customerPhone, provId, cityId, districtId, addr, postCode);
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
	
	@RequestMapping(params = "delCustomer")
	public void delCustomer(HttpServletRequest request , HttpServletResponse response , String customerId , String customerDetailId)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			String retVal = userService.delCustomer(customerId, customerDetailId);
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
