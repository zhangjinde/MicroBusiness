package org.micro.pub.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
  *  ����������  ����������֤��ͼƬ��������Ҫ�����������������ó���static<br/>
 */
public class SecurityCodeCreater
{ 
  
    //ͼƬ�Ŀ�� 
    private final static int IMAGEWIDTH = 20; 
    //ͼƬ�ĸ߶� 
    private final static int IMAGEHEIGHT = 22;
    
    //�����С
    private final static int FONTSIZE = 18;
    
    //�ַ������� 
    private final static int CODE_LENGTH = 4; 
    
    //����ַ���Χ 
    private final static char[] CHAR_RANGE = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
                    'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
                    'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 
                    'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
                    'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
                    'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7',
                    '8', '9'
    };  
    
//    public static  void main(String[] args)throws Exception 
//    {
//  
//	     //��main���������������ɵ���֤��ͼ��
//	     
//	     FileOutputStream fos = new FileOutputStream("c://test.jpg");
//	     JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(fos);
//	     encoder.encode(getImage(getRandString()));     
//    }
    
     
    private static Random random = new Random();  
     
    /** 
     * ��������ַ��� 
     * @return ����ַ���  
     */ 
    public  static String getRandString()
    { 
        StringBuilder sb = new StringBuilder(); 
        for (int i = 0; i < CODE_LENGTH; i++)
        {
            sb.append(CHAR_RANGE[random.nextInt(CHAR_RANGE.length)]); 
        }	 
        return sb.toString(); 
    } 
     
    /** 
     * ���������ɫ 
     * @param ll ������ɫֵ����(lower limit) 
     * @param ul ������ɫֵ����(upper limit) 
     * @return ���ɵ������ɫ���� 
     */ 
    private static Color getRandColor(int ll, int ul)
    { 
        if (ll > 255) ll = 255; 
        if (ll < 1) ll = 1; 
        if (ul > 255) ul = 255; 
        if (ul < 1) ul = 1; 
        if (ul == ll) ul = ll + 1; 
        int r = random.nextInt(ul - ll) + ll; 
        int g = random.nextInt(ul - ll) + ll; 
        int b = random.nextInt(ul - ll) + ll; 
        Color color = new Color(r,g,b); 
        return color; 
    } 
     
    /** 
     * ����ָ���ַ�����ͼ������ 
     * @param verifyCode ��������ӡ������ַ��� 
     * @return ���ɵ�ͼ������ 
     * */ 
    public static BufferedImage getImage(String verifyCode)
    { 
         
     //���ɻ���
        BufferedImage image = new BufferedImage(IMAGEWIDTH * CODE_LENGTH, IMAGEHEIGHT, BufferedImage.TYPE_INT_RGB); 
         
        //��ȡͼ�������� �����ɻ��ʣ�
        Graphics graphics = image.getGraphics(); 
         
        //���ñ���ɫ���� 
        graphics.setColor(getRandColor(1,50));
        
        //���������� ����Ϊ����
        graphics.fillRect(0, 0, IMAGEWIDTH * 4, IMAGEHEIGHT); 
         
        //���ñ߿���ɫ 
        graphics.setColor(new Color(0,0,0));
        
        //�����߿� 
        for (int i=0; i<2; i++) 
            graphics.drawRect(i, i, IMAGEWIDTH * CODE_LENGTH - i * 2+1, IMAGEHEIGHT - i * 2+1); 
         
        //�����������������ɫ 
        graphics.setColor(getRandColor(50,100)); 
        
        //����50���������� 
        for (int i=0; i<50; i++)
        { 
            int x1 = random.nextInt(IMAGEWIDTH * CODE_LENGTH - 4) + 2; 
            int y1 = random.nextInt(IMAGEHEIGHT - 4) + 2; 
            int x2 = random.nextInt(IMAGEWIDTH * CODE_LENGTH - 2 - x1) + x1; 
            int y2 = y1; 
            graphics.drawLine(x1, y1, x2, y2); 
        } 
         
        //�������� ����
        AffineTransform fontAT = new AffineTransform();
        for (int i = 0;i < verifyCode.length(); i++) 
        {
        	// �������� 
	        int rotate = random.nextInt(15);
	        //fontAT.rotate(random.nextBoolean() ? Math.toRadians(rotate):-Math.toRadians(rotate / 2));
	        Font fx = new Font(new String[] { "Times New Roman", "Verdana","arial" }[random.nextInt(2)], Font.PLAIN, 20).deriveFont(fontAT);
	        graphics.setFont(fx);
        	String temp = verifyCode.substring(i, i+1); 
        	graphics.setColor(getRandColor(100,255)); 
        	graphics.drawString(temp, 13 * i + 16, 18); 
        }
        //ͼ����Ч 
        graphics.dispose(); 
         
        return image; 
    }
}
