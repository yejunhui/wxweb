package dxxt;

import java.sql.*;

import org.json.*;
import org.jsoup.select.Elements;

import com.google.gson.JsonObject;
import com.mysql.cj.protocol.Resultset;
import dxxt.MyDB;

import cn.edu.hfut.dmic.webcollector.*;
import cn.edu.hfut.dmic.webcollector.model.CrawlDatums;
import cn.edu.hfut.dmic.webcollector.model.Page;
import cn.edu.hfut.dmic.webcollector.plugin.berkeley.BreadthCrawler;

public class Sigup extends BreadthCrawler {
	
	public String htmlString = null;
	public String appidString = null;
	public String secretString = null;
	public String js_codeString = null;
	
	public JSONObject reu() {
		JSONObject jsonObject = null;
		try {
			jsonObject = new JSONObject(htmlString);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	public Sigup(String crawlPath, boolean autoParse,String[] s) {
		super(crawlPath, autoParse);
		// TODO Auto-generated constructor stub
		//设置url
		appidString = s[0];
		secretString = s[1];
		js_codeString = s[2];
		
		String url = "https://api.weixin.qq.com/sns/jscode2session?appid="+appidString+"&secret="+secretString+"&js_code="+js_codeString+"&grant_type=authorization_code";
		System.out.print("url is :" +url);
		this.addSeed(url);
		//设置线程数
		setThreads(1);
		getConf().setTopN(1);
	}

	@Override
	public void visit(Page arg0, CrawlDatums arg1) {
		// TODO Auto-generated method stub
		String url =arg0.url();
		
		System.out.print("html is :"+arg0.html());
		htmlString = arg0.html();
		
		
	}

}
