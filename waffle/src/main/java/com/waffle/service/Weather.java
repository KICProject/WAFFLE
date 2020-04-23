package com.waffle.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

//import org.json.simple.*;
//import org.json.simple.parser.JSONParser;

public class Weather implements IApi{
	
	String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?";
	
	String serviceKey = "Wam%2BJZhNzvkzvkdElRk1%2Fo0uZiV3PrGp2pJcqawTS9XEIlp9lWlfCeGrXJT5Yd1XocAlO0EFqgOwZ8aRcrtVnA%3D%3D";
	String numOfRows = "20";
	String pageNo = "1";
	String dataType = "json";
	String base_date = "";
	String base_time = "0200";		//새벽 2시 (3시간 단위로 설정해야함~)
													//ex) 0200   0500   0800   1100
	String nx = "60";
	String ny = "125";
	
	@Override
	public String reqData() {
		StringBuilder urlSB = new StringBuilder(apiUrl);
        BufferedReader rd = null;
        HttpURLConnection conn = null;
        StringBuilder sb = null;
        
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
        Date date = new Date();
        base_date = format.format(date);
        
		try {
			urlSB.append(URLEncoder.encode("serviceKey", "UTF-8") + "=" + serviceKey);
			urlSB.append("&");
			urlSB.append(URLEncoder.encode("numOfRows", "UTF-8") + "=" + numOfRows);
			urlSB.append("&");
			urlSB.append(URLEncoder.encode("pageNo", "UTF-8") + "=" + pageNo);
			urlSB.append("&");
			urlSB.append(URLEncoder.encode("base_date", "UTF-8") + "=" + base_date);
			urlSB.append("&");
			urlSB.append(URLEncoder.encode("base_time", "UTF-8") + "=" + base_time);
			urlSB.append("&");
			urlSB.append(URLEncoder.encode("dataType", "UTF-8") + "=" + dataType);
			urlSB.append("&");
			urlSB.append(URLEncoder.encode("nx", "UTF-8") + "=" + nx);
			urlSB.append("&");
			urlSB.append(URLEncoder.encode("ny", "UTF-8") + "=" + ny);

	        System.out.println(urlSB.toString());
			URL url= new URL(urlSB.toString());
			
	        conn = (HttpURLConnection) url.openConnection();
	        
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());

	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        
	        rd.close();
	        conn.disconnect();
	        //String result= sb.toString();
	        //System.out.println(result);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch(Exception e){
			
		} finally {
			
		}
		
		return sb.toString();
	}
	@Override
	public void parserData(String data) {
		try {
		// Json parser를 만들어 만들어진 문자열 데이터를 객체화 
		JSONParser parser = new JSONParser(); 
		JSONObject obj = (JSONObject) parser.parse(data); 
		// response 키를 가지고 데이터를 파싱 
		JSONObject parse_response = (JSONObject) obj.get("response"); 
		// response 로 부터 body 찾기
		JSONObject parse_body = (JSONObject) parse_response.get("body"); 
		// body 로 부터 items 찾기 
		JSONObject parse_items = (JSONObject) parse_body.get("items");
		// items로 부터 itemlist 를 받기 
		JSONArray parse_item = (JSONArray) parse_items.get("item");
		String category;
		JSONObject weather; // parse_item은 배열형태이기 때문에 하나씩 데이터를 하나씩 가져올때 사용
		// 카테고리와 값만 받아오기
		String day="";
		String time="";
		for(int i = 0 ; i < parse_item.size(); i++) {
			weather = (JSONObject) parse_item.get(i);
			Object fcstValue = weather.get("fcstValue");
			Object fcstDate = weather.get("fcstDate");
			Object fcstTime = weather.get("fcstTime");
			//double형으로 받고싶으면 아래내용 주석 해제
			//double fcstValue = Double.parseDouble(weather.get("fcstValue").toString());
			category = (String)weather.get("category"); 
			// 출력
			if(!day.equals(fcstDate.toString())) {
				day=fcstDate.toString();
			}
			if(!time.equals(fcstTime.toString())) {
				time=fcstTime.toString();
				System.out.println(day+"  "+time);
			}
			if(category.equals("T3H"))
			{
				System.out.print("\tcategory : "+ category);
				System.out.print(", fcst_Value : "+ fcstValue);
				System.out.print(", fcstDate : "+ fcstDate);
				System.out.println(", fcstTime : "+ fcstTime);
			}
		}
		} catch(Exception e) {
			e.printStackTrace();
		}
	//@Override
	//public void parserData(String data) {
		//try {
		// Json parser를 만들어 만들어진 문자열 데이터를 객체화 
		//JSONParser parser = new JSONParser(); 
		//JSONObject obj = (JSONObject) parser.parse(data); 
		// response 키를 가지고 데이터를 파싱 
		//JSONObject parse_response = (JSONObject) obj.get("response"); 
		// response 로 부터 body 찾기
		//JSONObject parse_body = (JSONObject) parse_response.get("body"); 
		// body 로 부터 items 찾기 
		//JSONObject parse_items = (JSONObject) parse_body.get("items");
		// items로 부터 itemlist 를 받기 
		//JSONArray parse_item = (JSONArray) parse_items.get("item");
		//String category;
		//JSONObject weather; // parse_item은 배열형태이기 때문에 하나씩 데이터를 하나씩 가져올때 사용
		// 카테고리와 값만 받아오기
		//String day="";
		//String time="";
		//for(int i = 0 ; i < parse_item.size(); i++) {
			//weather = (JSONObject) parse_item.get(i);
			//Object fcstValue = weather.get("fcstValue");
			//Object fcstDate = weather.get("fcstDate");
			//Object fcstTime = weather.get("fcstTime");
			//double형으로 받고싶으면 아래내용 주석 해제
			////double fcstValue = Double.parseDouble(weather.get("fcstValue").toString());
			//category = (String)weather.get("category"); 
			//// 출력
			//if(!day.equals(fcstDate.toString())) {
			//	day=fcstDate.toString();
			//}
			//if(!time.equals(fcstTime.toString())) {
			//	time=fcstTime.toString();
			//	System.out.println(day+"  "+time);
			//}
			//if(category.equals("T3H"))
			//{
				//System.out.print("\tcategory : "+ category);
				//System.out.print(", fcst_Value : "+ fcstValue);
				//System.out.print(", fcstDate : "+ fcstDate);
				//System.out.println(", fcstTime : "+ fcstTime);
			//}
		//}
		//} catch(Exception e) {
		//e.printStackTrace();
		//}
		/*
		 * 항목값	항목명	단위
		 * POP	강수확률	 %
		 * PTY	강수형태	코드값
		 * R06	6시간 강수량	범주 (1 mm)
		 * REH	습도	 %
		 * S06	6시간 신적설	범주(1 cm)
		 * SKY	하늘상태	코드값
		 * T3H	3시간 기온	 ℃
		 * TMN	아침 최저기온	 ℃
		 * TMX	낮 최고기온	 ℃
		 * UUU	풍속(동서성분)	 m/s
		 * VVV	풍속(남북성분)	 m/s
		 * WAV	파고	 M
		 * VEC	풍향	 m/s
		 * WSD	풍속	1
		 */
		
	}
	
	
	

	
	
	
	
}
