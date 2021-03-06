package com.waffle.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Service;

@Service
public class KakaoService {
	private final static String K_CLIENT_ID = "e1d6e555ab653c2367b93a83450e0e0e"; //"자기꺼 REST API키";
	private final static String K_REDIRECT_URI = "http://localhost:8090/member/kakaologin";

	public String getAuthorizationUrl(HttpSession session) {
		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + K_CLIENT_ID + "&redirect_uri="
				+ K_REDIRECT_URI + "&response_type=code";
		return kakaoUrl;
	}
	//Token 가져오기
	public JsonNode getAccessToken(String autorize_code) {

	      final String RequestUrl = "https://kauth.kakao.com/oauth/token";
	      final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
	      postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
	      postParams.add(new BasicNameValuePair("client_id", K_CLIENT_ID)); // REST API KEY
	      postParams.add(new BasicNameValuePair("redirect_uri", K_REDIRECT_URI)); // 리다이렉트 URI
	      postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정 중 얻은 code 값

	      final HttpClient client = HttpClientBuilder.create().build();
	      final HttpPost post = new HttpPost(RequestUrl);
	      JsonNode returnNode = null;

	      try {

	        post.setEntity(new UrlEncodedFormEntity(postParams));
	        final HttpResponse response = client.execute(post);
	        final int responseCode = response.getStatusLine().getStatusCode();

	        // JSON 형태 반환값 처리

	        ObjectMapper mapper = new ObjectMapper();
	        returnNode = mapper.readTree(response.getEntity().getContent());

	      } catch (UnsupportedEncodingException e) {

	        e.printStackTrace();

	      } catch (ClientProtocolException e) {

	        e.printStackTrace();

	      } catch (IOException e) {

	        e.printStackTrace();

	      } finally {
	        // clear resources
	      }
	      return returnNode;
	    }
	//User Logout
	public JsonNode Logout(String autorize_code) {
        final String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
        post.addHeader("Authorization", "Bearer " + autorize_code);
        JsonNode returnNode = null;
        
        try {
 
            final HttpResponse response = client.execute(post);
            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
 
       }
 
       return returnNode;
 
    }



	//User Info
	public JsonNode getKakaoUserInfo(JsonNode accessToken) {
	      final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
	      //String CLIENT_ID = K_CLIENT_ID; // REST API KEY
	      //String REDIRECT_URI = K_REDIRECT_URI; // 리다이렉트 URI
	      //String code = autorize_code; // 로그인 과정중 얻은 토큰 값
	      final HttpClient client = HttpClientBuilder.create().build();
	      final HttpPost post = new HttpPost(RequestUrl);
	      //JsonNode accessToken = getAccessToken(autorize_code);
	      
	      System.out.println(accessToken);
	      String token = accessToken.get("access_token").toString();
	      // add header
	      post.addHeader("Authorization", "Bearer " + token);

	      JsonNode returnNode = null;

	      try {

	        final HttpResponse response = client.execute(post);
	        final int responseCode = response.getStatusLine().getStatusCode();
	        System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
	        System.out.println("Response Code : " + responseCode);

	        // JSON 형태 반환값 처리
	        ObjectMapper mapper = new ObjectMapper();
	        returnNode = mapper.readTree(response.getEntity().getContent());
	      } catch (UnsupportedEncodingException e) {

	        e.printStackTrace();
	      } catch (ClientProtocolException e) {

	        e.printStackTrace();
	      } catch (IOException e) {

	        e.printStackTrace();
	      } finally {

	        // clear resources
	      }
	      return returnNode;
	    }
	
	}
	  

