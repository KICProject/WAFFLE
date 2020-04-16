package com.waffle.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.*;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

public class Dust implements IApi{
	String apiUrl = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty?";
	
	String serviceKey = "Wam%2BJZhNzvkzvkdElRk1%2Fo0uZiV3PrGp2pJcqawTS9XEIlp9lWlfCeGrXJT5Yd1XocAlO0EFqgOwZ8aRcrtVnA%3D%3D";
	String pageNo = "1";
	String numOfRows = "10";
	String stationName = "강남구";

	String dataTerm = "month";
	String ver = "1.3";

	@Override
	public String reqData() {
		StringBuilder urlSB = new StringBuilder(apiUrl);
        BufferedReader rd = null;
        HttpURLConnection conn = null;
        StringBuilder sb = null;
		try {
			urlSB.append(URLEncoder.encode("serviceKey", "UTF-8") + "=" + serviceKey);
			urlSB.append("&");
			urlSB.append(URLEncoder.encode("numOfRows", "UTF-8") + "=" + numOfRows);
			urlSB.append("&");
			urlSB.append(URLEncoder.encode("pageNo", "UTF-8") + "=" + pageNo);
			urlSB.append("&");
			urlSB.append(URLEncoder.encode("stationName", "UTF-8") + "=" + stationName);
			urlSB.append("&");
			urlSB.append(URLEncoder.encode("dataTerm", "UTF-8") + "=" + dataTerm);
			urlSB.append("&");
			urlSB.append(URLEncoder.encode("ver", "UTF-8") + "=" + ver);

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
	        String result= sb.toString();
	        System.out.println(result);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(Exception e){
			
		} finally {
			
		}
		
		return sb.toString();
	}
	
	// tag값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
		
	@Override
	public void parserData(String data) {
		// xml 파싱하기
		InputSource is = new InputSource(new StringReader(data));
		
		try {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document doc = builder.parse(is);
        
        doc.getDocumentElement().normalize();
        System.out.println("Root element: " + doc.getDocumentElement().getNodeName()); 
        
        NodeList nodeList = doc.getElementsByTagName("items");
        System.out.println("리스트 길이 :  " + nodeList.getLength()); 
        
        for (int i = 0; i < nodeList.getLength(); i++) {
            Node nNode = nodeList.item(i);
            if(nNode.getNodeType() == Node.ELEMENT_NODE) {
        		Element eElement = (Element) nNode;
            	System.out.println("--대기정보--");
            	System.out.println("dataTime  : " + getTagValue("dataTime", eElement));
            	System.out.println("아황산가스  : " + getTagValue("so2Value", eElement));
            	System.out.println("일산화탄소  : " + getTagValue("coValue", eElement));
            	System.out.println("오존농도  : " + getTagValue("o3Value", eElement));
            	System.out.println("미세먼지(pm10)농도  : " + getTagValue("pm10Value", eElement));
            	System.out.println("미세먼지(pm10)등급  : " + getTagValue("pm10Grade1h", eElement));
            	System.out.println("미세먼지(pm25)농도  : " + getTagValue("pm25Value", eElement));
            	System.out.println("미세먼지(pm25)등급  : " + getTagValue("pm25Grade1h", eElement));
            	//...
            	//...
            	//... 추가
            }
        }
        
		}
		catch (Exception e) {
			
			
		}
		
	}
	
	
	
}

//xml 파일 구조
/*
<?xml version="1.0" encoding="UTF-8"?><response>	
<header>		
<resultCode>00</resultCode>		
<resultMsg>NORMAL SERVICE.</resultMsg>
</header>
<body>		
<items>							
	<item>					
		<dataTime>2020-04-16 12:00</dataTime>					                        
		<mangName>도시대기</mangName>                    					
		<so2Value>0.003</so2Value>					
		<coValue>0.4</coValue>					
		<o3Value>0.048</o3Value>					
		<no2Value>0.027</no2Value>					
		<pm10Value>50</pm10Value>					                        
		<pm10Value24>44</pm10Value24>                    					                        
		<pm25Value>27</pm25Value>                                                                
		<pm25Value24>25</pm25Value24>                    					
		<khaiValue>74</khaiValue>					
		<khaiGrade>2</khaiGrade>					
		<so2Grade>1</so2Grade>					
		<coGrade>1</coGrade>					
		<o3Grade>2</o3Grade>					
		<no2Grade>1</no2Grade>					
		<pm10Grade>2</pm10Grade>					                       
		<pm25Grade>2</pm25Grade>                                                                
		<pm10Grade1h>2</pm10Grade1h>                        
		<pm25Grade1h>2</pm25Grade1h>                    				
	</item>							
	<item>					
		<dataTime>2020-04-16 11:00</dataTime>					                        
		<mangName>도시대기</mangName>                    					
		<so2Value>0.003</so2Value>					
		<coValue>0.5</coValue>					
		<o3Value>0.031</o3Value>					
		<no2Value>0.037</no2Value>					
		<pm10Value>46</pm10Value>					                   
		
		<pm10Value24>42</pm10Value24>                    					  
		<pm25Value>23</pm25Value>                                                            
		<pm25Value24>24</pm25Value24>                    				
		<khaiValue>72</khaiValue>				
		<khaiGrade>2</khaiGrade>		
		<so2Grade>1</so2Grade>				
		<coGrade>1</coGrade>				
		<o3Grade>2</o3Grade>				
		<no2Grade>2</no2Grade>			
		<pm10Grade>2</pm10Grade>					 
		<pm25Grade>2</pm25Grade>                              
		<pm10Grade1h>2</pm10Grade1h>                    
		<pm25Grade1h>2</pm25Grade1h>                    
	</item>	
</items>			
<numOfRows>10</numOfRows>			
<pageNo>1</pageNo>			
<totalCount>743</totalCount>	
</body>
</response>
*/


