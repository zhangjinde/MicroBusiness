package org.micro.service;

import org.micro.model.ScanPayReqData;
import org.micro.pub.util.Configure;

public class ScanPayService extends BaseService{

    public ScanPayService() throws IllegalAccessException, InstantiationException, ClassNotFoundException {
        super(Configure.PAY_API);
    }

    /**
     * ����֧������
     * @param scanPayReqData ������ݶ������������APIҪ���ύ�ĸ��������ֶ�
     * @return API���ص�����
     * @throws Exception
     */
    public String request(ScanPayReqData scanPayReqData) throws Exception {

        //--------------------------------------------------------------------
        //����HTTPS��Post����API��ַ
        //--------------------------------------------------------------------
        String responseString = sendPost(scanPayReqData);

        return responseString;
    }
}
