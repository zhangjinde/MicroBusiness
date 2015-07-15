package org.micro.service;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;

import org.micro.pub.util.Configure;

/**
 * ����Ļ���
 */
public class BaseService{

    //API�ĵ�ַ
    private String apiURL;

    //�������HTTPS������
    private IServiceRequest serviceRequest;

    public BaseService(String api) throws ClassNotFoundException, IllegalAccessException, InstantiationException {
        apiURL = api;
        Class c = Class.forName(Configure.HttpsRequestClassName);
        serviceRequest = (IServiceRequest) c.newInstance();
    }

    protected String sendPost(Object xmlObj) throws UnrecoverableKeyException, IOException, NoSuchAlgorithmException, KeyStoreException, KeyManagementException {
        return serviceRequest.sendPost(apiURL,xmlObj);
    }

    /**
     * ���̻����Զ����Լ���HTTP��������
     * @param request ʵ����IserviceRequest�ӿڵ�HttpsRequest
     */
    public void setServiceRequest(IServiceRequest request){
        serviceRequest = request;
    }
}
