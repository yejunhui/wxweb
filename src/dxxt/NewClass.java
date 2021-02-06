package dxxt;

import java.net.*;
import java.security.SecureRandom;
import java.io.*;
import javax.net.*;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;

public class NewClass {
	public static void main(String[] args) {
		String requestUrl = "https://api.weixin.qq.com/sns/jscode2session?appid=APPID&secret=SECRET&js_code=JSCODE&grant_type=authorization_code";
		String requestMethod = null;
		String outputStr = null;
		StringBuffer buffer = null;
		
		try {
			SSLContext sslContext = SSLContext.getInstance("SSL");
			
			sslContext.init(null, null, new SecureRandom());
			SSLSocketFactory ssf = sslContext.getSocketFactory();
			URL url = new URL(requestUrl);
			HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setUseCaches(false);
			connection.setRequestMethod(requestMethod);
			connection.setSSLSocketFactory(ssf);
			connection.connect();

			InputStream inputStream = connection.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream,"utf-i");
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
			buffer = new StringBuffer();
			String line = null;
			while((line = bufferedReader.readLine()) != null) {
				buffer.append(line);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.print(buffer);
	}

}
