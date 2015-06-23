package org.micro.service;

import java.util.List;

import org.micro.dao.HibernateObjectDao;
import org.micro.dao.PayDao;
import org.micro.model.CartT;
import org.micro.pub.base.SysDate;
import org.micro.pub.exception.JsonException;
import org.micro.pub.sequence.SysId;
import org.micro.util.JsonUtils;
import org.micro.util.ObjectCensor;
import org.micro.util.QryException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopCartService 
{
	@Autowired
	private HibernateObjectDao hibernateObjectDao;
    
	@Autowired
	private PayDao payDao;
	
	@Autowired
	private SysId sysId;
	
	public void addShopCart(String cart) throws JsonException
	{
		CartT cartT =(CartT) JsonUtils.toBean(cart, CartT.class);
		cartT.setState("A");
		cartT.setCreateDate(SysDate.getSysDate());
		
		String weixinId=cartT.getWeixinId();
		String productId = cartT.getProductId();
		List<CartT> cartTs = hibernateObjectDao.getCartById(weixinId,productId, "");
		if(ObjectCensor.checkListIsNull(cartTs))
		{
			CartT cartT2 = cartTs.get(0);
			String num = cartT2.getNum();
			String n=cartT.getNum();
			int i= Integer.parseInt(num)+Integer.parseInt(n);
			cartT2.setNum(i+"");
			hibernateObjectDao.update(cartT2);
			return;
		}
		cartT.setCartId(sysId.getSeqId("MICRO_CART_SEQ")+"");
		hibernateObjectDao.save(cartT);
	}
	 
	public List getOrderById(String wenxinId,String phone) throws QryException
	{
		return payDao.getOrderById(wenxinId, phone);
	}
}
