package org.micro.model;

import java.lang.reflect.Field;
import java.util.LinkedHashMap;
import java.util.Map;

public class CouponData {

    private String coupon_batch_id = "";//�Ż�ȯ����ID
    private String coupon_id = ""; //�Ż�ȯID
    private String coupon_fee = "";//�����Ż�ȯ���

    public String getCoupon_batch_id() {
        return coupon_batch_id;
    }

    public void setCoupon_batch_id(String coupon_batch_id) {
        this.coupon_batch_id = coupon_batch_id;
    }

    public String getCoupon_id() {
        return coupon_id;
    }

    public void setCoupon_id(String coupon_id) {
        this.coupon_id = coupon_id;
    }

    public String getCoupon_fee() {
        return coupon_fee;
    }

    public void setCoupon_fee(String coupon_fee) {
        this.coupon_fee = coupon_fee;
    }

    public String toMap(){
        Map<String,Object> map = new LinkedHashMap<String, Object>();
        Field[] fields = this.getClass().getDeclaredFields();
        StringBuilder s=new StringBuilder("{");

        for (Field field : fields) {
            Object obj;
            try {
                obj = field.get(this);
                if(obj!=null){
                    if(s.length()>0){
                        s.append(" ");
                    }
                    s.append(field.getName());
                    s.append("=");
                    s.append(obj.toString());
//                    map.put(field.getName(), obj);
                }
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        s.append("}");
        return s.toString();
    }

}
