package org.micro.controller;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.micro.pub.util.MD5Util;
import org.micro.pub.util.QryException;
import org.micro.pub.util.SecurityCodeCreater;
import org.micro.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

@Controller
@RequestMapping("/login.do")
public class LoginController 
{
	@Autowired
	private LoginService loginService;
	
	@RequestMapping(params = "method=getSecurityImage")
	public void getSecurityImage(HttpServletResponse response , HttpServletRequest request)
	{
		try
		{
			HttpSession session = request.getSession();
			OutputStream os = response.getOutputStream();
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(os);
			String code = loginService.getSecurityCode();
			session.setAttribute("code", code);
			encoder.encode(SecurityCodeCreater.getImage(code)); 
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	@RequestMapping(params = "method=logout")
	public ModelAndView logout(HttpServletRequest request)
	{
		ModelAndView model = new ModelAndView("login");
		HttpSession session = request.getSession();
		Map<String,String> map = (Map<String,String>)session.getAttribute("UserInfo");
		if(map != null)
		{
			loginService.logoutUpdate(map, request);
		}
		session.removeAttribute("UserInfo");
		return model;
	}
	
	@RequestMapping(params = "method=showIndex")
	public ModelAndView showIndex()
	{
		ModelAndView model = new ModelAndView("admin");
		try 
		{
			List<Map<String, String>> list = loginService.showIndex();
			model.addObject("menuList", list);
		}
		catch (QryException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(params = "method=login")
	public void login(String username , String password , String code , HttpServletResponse response , HttpServletRequest request)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			String retVal = loginService.login(username , password , code , request);
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
	
	@RequestMapping(params = "method=menuLeft")
	public void menuLeft(String menuId , HttpServletResponse response , HttpServletRequest request)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			HttpSession session = request.getSession();
			Map<String,String> userMap = (Map<String,String>)session.getAttribute("UserInfo");
			String retVal = loginService.menuLeft(menuId , userMap);
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
	
	@RequestMapping(params = "method=updateUserInfo")
	public void updateUserInfo(String userPass , String realName , HttpServletResponse response , HttpServletRequest request)
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
				if(userPass != null)
				{
					String pass = MD5Util.getEncryptedPwd(userPass);
					userMap.put("userPass", pass);
				}
				if(realName != null)
				{
					userMap.put("realName", realName);
				}
				loginService.updateUserInfo(userMap);
				json.put("status", 1);
				json.put("info", "�û���Ϣ�޸ĳɹ�!");
				session.setAttribute("UserInfo",userMap);
			}
			out.write(json.toString());
		}
		catch(Exception err)
		{
			err.printStackTrace();
			json.put("status", 0);
			json.put("info", "�û���Ϣ�޸�ʧ��!");
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