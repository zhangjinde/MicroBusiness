package org.micro.model;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import org.micro.pub.util.Configure;
import org.micro.pub.util.RandomStringGenerator;
import org.micro.pub.util.Signature;

/**
 * ����ɨ֧��API��Ҫ�ύ������
 */
public class ScanPayReqData {

    //ÿ���ֶξ������˼��鿴API�ĵ�
    private String appid = "";
    private String mch_id = "";
    private String device_info = "";
    private String nonce_str = "";
    private String sign = "";
    private String body = "";
    private String detail = "";
    private String attach = "";
    private String out_trade_no = "";
    private String fee_type = "";
    private int total_fee = 0;
    private String spbill_create_ip = "";
    private String time_start = "";
    private String time_expire = "";
    private String goods_tag = "";
    private String notify_url = "";
    private String trade_type = "";
    private String product_id = "";
    private String openid = "";

    /**
     * @param authCode �����ɨ���ն��豸���û��ֻ���ɨȡ����֧����Ȩ�ţ�������Ǹ��û�����֧�������п��󶨵ģ���Ч����1����
     * @param body Ҫ֧������Ʒ��������Ϣ���û�����֧���ɹ�ҳ���￴�������Ϣ
     * @param attach ֧���������������ĸ������ݣ�API�Ὣ�ύ�������������ԭ������
     * @param outTradeNo �̻�ϵͳ�ڲ��Ķ�����,32���ַ��ڿɰ�����ĸ, ȷ�����̻�ϵͳΨһ
     * @param totalFee �����ܽ���λΪ���֡���ֻ������
     * @param deviceInfo �̻��Լ������ɨ��֧���ն��豸�ţ�����׷����ʽ��׷�������̨�ն��豸��
     * @param spBillCreateIP �������ɵĻ���IP
     * @param timeStart ��������ʱ�䣬 ��ʽΪyyyyMMddHHmmss����2009��12 ��25 ��9 ��10 ��10 ���ʾΪ20091225091010��ʱ��ΪGMT+8 beijing����ʱ��ȡ���̻�������
     * @param timeExpire ����ʧЧʱ�䣬��ʽͬ��
     * @param goodsTag ��Ʒ��ǣ�΢��ƽ̨���õ���Ʒ��ǣ������Ż�ȯ��������ʹ��
     */
    public ScanPayReqData(String body,String detailInfo,String outTradeNo,int totalFee,String timeStart,String timeExpire,String openId){

        //΢�ŷ���Ĺ��ں�ID����ͨ���ں�֮����Ի�ȡ����
        setAppid(Configure.getAppid());

        //΢��֧��������̻���ID����ͨ���ںŵ�΢��֧������֮����Ի�ȡ����
        setMch_id(Configure.getMchid());
        
        //�̻��Լ������ɨ��֧���ն��豸�ţ�����׷����ʽ��׷�������̨�ն��豸��
        setDevice_info("WEB");
        
        //����ַ�����������32 λ
        setNonce_str(RandomStringGenerator.getRandomStringByLength(32));

        //�����ɨ���ն��豸���û��ֻ���ɨȡ����֧����Ȩ�ţ�������Ǹ��û�����֧�������п��󶨵ģ���Ч����1����
        //���Ե�ʱ�������΢���ϴ򿪡�Ǯ��������ġ�ˢ��������ɨ��ҳ�������һ��14λ���������뵽�������������ύ��֤
        //��סout_trade_no��������ſ��Խ���һ��֧�������˿�
//        setAuth_code(authCode);

        //Ҫ֧������Ʒ��������Ϣ���û�����֧���ɹ�ҳ���￴�������Ϣ
        setBody(body);
        
        //��Ʒ������ϸ�б� 
        setDetail(detailInfo);

        //֧���������������ĸ������ݣ�API�Ὣ�ύ�������������ԭ�����أ��������̻��Լ�����ע���ñ����ѵľ������ݣ������������Ӫ�ͼ�¼
        setAttach("");

        //�̻�ϵͳ�ڲ��Ķ�����,32���ַ��ڿɰ�����ĸ, ȷ�����̻�ϵͳΨһ
        setOut_trade_no(outTradeNo);

        //����ISO 4217��׼����λ��ĸ���룬Ĭ������ң�CNY
        setFee_type("CNY");
        
        //�����ܽ���λΪ���֡���ֻ������
        setTotal_fee(totalFee);

        //�������ɵĻ���IP
        setSpbill_create_ip(Configure.getIP());

        //��������ʱ�䣬 ��ʽΪyyyyMMddHHmmss����2009��12��25��9��10��10���ʾΪ20091225091010��ʱ��ΪGMT+8 beijing����ʱ��ȡ���̻�������
        setTime_start(timeStart);

        //����ʧЧʱ�䣬��ʽͬ��
        setTime_expire(timeExpire);

        //��Ʒ��ǣ�΢��ƽ̨���õ���Ʒ��ǣ������Ż�ȯ��������ʹ��
        setGoods_tag("");
        
        //����΢��֧���첽֪ͨ�ص���ַ 
        setNotify_url(Configure.getNotifyUrl());

        //ȡֵ���£�JSAPI��NATIVE��APP��WAP
        setTrade_type("JSAPI");
        
        //trade_type=NATIVE���˲����ش�����idΪ��ά���а�������ƷID���̻����ж��塣
        setProduct_id("");
        
        //trade_type=JSAPI���˲����ش����û����̻�appid�µ�Ψһ��ʶ��
        setOpenid(openId);
        
        //����API����ǩ���������ǩ��
        String sign = Signature.getSign(toMap());
        setSign(sign);//��ǩ���������õ�Sign���������

    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getMch_id() {
        return mch_id;
    }

    public void setMch_id(String mch_id) {
        this.mch_id = mch_id;
    }

    public String getDevice_info() {
        return device_info;
    }

    public void setDevice_info(String device_info) {
        this.device_info = device_info;
    }

    public String getNonce_str() {
        return nonce_str;
    }

    public void setNonce_str(String nonce_str) {
        this.nonce_str = nonce_str;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getAttach() {
        return attach;
    }

    public void setAttach(String attach) {
        this.attach = attach;
    }

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public int getTotal_fee() {
        return total_fee;
    }

    public void setTotal_fee(int total_fee) {
        this.total_fee = total_fee;
    }

    public String getSpbill_create_ip() {
        return spbill_create_ip;
    }

    public void setSpbill_create_ip(String spbill_create_ip) {
        this.spbill_create_ip = spbill_create_ip;
    }

    public String getTime_start() {
        return time_start;
    }

    public void setTime_start(String time_start) {
        this.time_start = time_start;
    }

    public String getTime_expire() {
        return time_expire;
    }

    public void setTime_expire(String time_expire) {
        this.time_expire = time_expire;
    }

    public String getGoods_tag() {
        return goods_tag;
    }

    public void setGoods_tag(String goods_tag) {
        this.goods_tag = goods_tag;
    }

    public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getFee_type() {
		return fee_type;
	}

	public void setFee_type(String feeType) {
		fee_type = feeType;
	}

	public String getNotify_url() {
		return notify_url;
	}

	public void setNotify_url(String notifyUrl) {
		notify_url = notifyUrl;
	}

	public String getTrade_type() {
		return trade_type;
	}

	public void setTrade_type(String tradeType) {
		trade_type = tradeType;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String productId) {
		product_id = productId;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public Map<String,Object> toMap(){
        Map<String,Object> map = new HashMap<String, Object>();
        Field[] fields = this.getClass().getDeclaredFields();
        for (Field field : fields) {
            Object obj;
            try {
                obj = field.get(this);
                if(obj!=null){
                    map.put(field.getName(), obj);
                }
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        return map;
    }

}
