package org.micro.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.micro.model.ScanPayReqData;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class WeixinService 
{
	private ScanPayService scanPayService;

	public ScanPayService getScanPayService() throws IllegalAccessException, InstantiationException, ClassNotFoundException 
	{
		if(scanPayService == null)
		{
			scanPayService = new ScanPayService();
		}
		return scanPayService;
	}
	
	public void payUnifiedorder(ModelAndView model , String openid , String body , String detail , String out_trade_no , String total_fee) throws Exception
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		long dateCha = 30*60*1000;
		String timeStart = sdf.format(date);
		date.setTime(date.getTime()+dateCha);
		String timeExpire = sdf.format(date);
		int totalFee = Integer.parseInt(total_fee);
		ScanPayReqData scanPayReqData = new ScanPayReqData(body, detail, out_trade_no, totalFee, timeStart, timeExpire, openid);
		String responseString = scanPayService.request(scanPayReqData);
	}
}
