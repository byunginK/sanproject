package com.san.spring.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Controller
public class SanController {

	private static Logger logger = LoggerFactory.getLogger(SanController.class);
	
	@RequestMapping(value="mountainInformation.do", method = RequestMethod.GET)
	public String mountainInfo() {
		return "infomain.tiles";
	}

	@ResponseBody
	@RequestMapping(value = "mountainInformationCom.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String xmltest(HttpServletRequest request) throws IOException {
		
		String adress_text = request.getParameter("adress_text");
		StringBuilder urlBulBuilder = new StringBuilder("http://openapi.forest.go.kr/openapi/service/trailInfoService/getforeststoryservice");
		urlBulBuilder.append("?" + URLEncoder.encode("mntnNm", "UTF-8") + "=" + URLEncoder.encode(adress_text, "UTF-8"));
		urlBulBuilder.append("&" + URLEncoder.encode("serviceKey", "UTF-8") + "=c343raXOth1d%2FoC9iVMmHjHi1oVCHNuiL1%2Bb%2FbJfoXLCDhMRMyiF8XwKSFrtNu%2F1fXVSoNl7HCw%2FzO2DS8g7uQ%3D%3D");
		
		URL url = new URL(urlBulBuilder.toString());
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		urlConnection.setDoOutput(true);
		urlConnection.setRequestProperty("CONTENT-TYPE", "application/xml");
		
		BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(url.openStream(),"utf-8"));

		String inputLine;
		String buffer = "";
		
		while((inputLine = bufferedReader.readLine()) != null) {
			buffer += inputLine.trim();
		}
		bufferedReader.close();
		
		JSONObject xmlJSONObj = XML.toJSONObject(buffer.toString());
		String jsonPrettyProntString = xmlJSONObj.toString();
	
		return jsonPrettyProntString;
		
	}
	
}
