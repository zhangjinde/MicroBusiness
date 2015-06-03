package org.micro.dao;

import javax.annotation.Resource;

import org.micro.util.QryCenter;
import org.springframework.stereotype.Repository;

@Repository
public class BaseDao 
{
	protected QryCenter qryCenter;

	public QryCenter getQryCenter() {
		return qryCenter;
	}

	@Resource
	public void setQryCenter(QryCenter qryCenter) {
		this.qryCenter = qryCenter;
	}
}
