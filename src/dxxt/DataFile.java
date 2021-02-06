package dxxt;

import org.json.*;

public class DataFile {
	public JSONObject dataFile() {
		
		
		String jString = "{\"user\":\"10086\",\"name\":\"中国移动\"}";
		JSONObject jsonObject = null;
		try {
			jsonObject = new JSONObject(jString);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonObject;
	}

}
