package com.san.spring.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SanController {

	private static Logger logger = LoggerFactory.getLogger(SanController.class);

	@RequestMapping(value = "mountainInformation.do", method = RequestMethod.GET)
	public String mountainInfo() {
		return "infomain.tiles";
	}

	@ResponseBody
	@RequestMapping(value = "mountainInformationCom.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String xmltest(HttpServletRequest request) throws IOException {

		String adress_text = request.getParameter("adress_text");
		StringBuilder urlBulBuilder = new StringBuilder(
				"http://openapi.forest.go.kr/openapi/service/trailInfoService/getforeststoryservice");
		urlBulBuilder
				.append("?" + URLEncoder.encode("mntnNm", "UTF-8") + "=" + URLEncoder.encode(adress_text, "UTF-8"));
		urlBulBuilder.append("&" + URLEncoder.encode("serviceKey", "UTF-8")
				+ "=c343raXOth1d%2FoC9iVMmHjHi1oVCHNuiL1%2Bb%2FbJfoXLCDhMRMyiF8XwKSFrtNu%2F1fXVSoNl7HCw%2FzO2DS8g7uQ%3D%3D");

		URL url = new URL(urlBulBuilder.toString());
		HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
		urlConnection.setDoOutput(true);
		urlConnection.setRequestProperty("CONTENT-TYPE", "application/xml");

		BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(url.openStream(), "utf-8"));

		String inputLine;
		String buffer = "";

		while ((inputLine = bufferedReader.readLine()) != null) {
			buffer += inputLine.trim();
		}
		bufferedReader.close();

		JSONObject xmlJSONObj = XML.toJSONObject(buffer.toString());
		String jsonPrettyProntString = xmlJSONObj.toString();

		return jsonPrettyProntString;

	}

	@ResponseBody
	@RequestMapping(value = "Matzip.do", method = RequestMethod.POST, produces = "application/String;charset=utf-8")
	public String test(String address) {
		String re = "";
		try {
			
			System.out.println(address);

			ProcessBuilder pb = new ProcessBuilder("python", "C:/sanproject/SanProject/mangoMat.py", address);
			Process p = pb.start();

			BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream(), "MS949"));

			System.out.println(".........start   process.........");
			String line = "";
			while ((line = bfr.readLine()) != null) {
				System.out.println("Python Output: " + line);
				re += line.trim();
			}
			bfr.close();
			System.out.println("........end   process.......");

		} catch (Exception e) {
			System.out.println(e);
		}

		return re;
	}

}
