package org.micro.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.micro.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user.do")
public class UserController 
{

	@Autowired
	private UserService userService;
	
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
				json.put("msg", "�����û�ʧ��");
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
				json.put("msg", "�޸��û�ʧ��");
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
				json.put("msg", "ɾ���û�ʧ��");
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
	
}