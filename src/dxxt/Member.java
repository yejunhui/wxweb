package dxxt;

import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.nio.file.FileSystem;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.WatchKey;
import java.nio.file.WatchService;
import java.nio.file.WatchEvent.Kind;
import java.nio.file.WatchEvent.Modifier;

import com.google.zxing.*;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class Member {
	
	//二维码宽高
	static final int CODE_SIZE = 300;
	//二维码格式
	static final String FROMAT = "jpg";
	
	public void qcCode(String text) {

	    /*
        	定义二维码的参数
	     */
	    HashMap hashMap = new HashMap();
	    // 设置二维码字符编码
	    hashMap.put(EncodeHintType.CHARACTER_SET, "UTF-8");
	    // 设置二维码纠错等级
	    hashMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
	    // 设置二维码边距
	    hashMap.put(EncodeHintType.MARGIN, 2);
	    
	    try {
	    	Path filePath = new File("D:/Program Files/nginx-1.18.0/html/image/"+text+".jpg").toPath();
			BitMatrix bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, CODE_SIZE, CODE_SIZE);
			MatrixToImageWriter.writeToPath(bitMatrix, FROMAT,filePath);
		} catch (WriterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
