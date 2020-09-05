package kr.or.ddit.bis;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Calendar;

import org.json.XML;
import org.springframework.context.annotation.Configuration;

import java.io.BufferedReader;
import java.io.IOException;

@Configuration
public class Subway {
	public static void main(String[] args) throws IOException {
       
    }
	
	public static String subwayId(String name) throws IOException {
		 StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/SubwayInfoService/getKwrdFndSubwaySttnList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=F3XkHoxAbwCycjGsjd1Mbzv4qCuLuBn50NgivLP7ELagNiF6iL0eIYzDEIfLTCaA6n9Tic0ph5ySC1scxALVNA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("subwayStationName","UTF-8") + "=" + URLEncoder.encode(name, "UTF-8")); /*지하철역명*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	        
	        org.json.JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
	        String xmlJSONObjString = xmlJSONObj.toString();
	        System.out.println(xmlJSONObjString);
	        return xmlJSONObjString;
	}

	public static String subwayTime(String subwayStationId) throws IOException {
		Calendar calendar = Calendar.getInstance();
		 StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/SubwayInfoService/getSubwaySttnAcctoSchdulList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=F3XkHoxAbwCycjGsjd1Mbzv4qCuLuBn50NgivLP7ELagNiF6iL0eIYzDEIfLTCaA6n9Tic0ph5ySC1scxALVNA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("subwayStationId","UTF-8") + "=" + URLEncoder.encode(subwayStationId, "UTF-8")); /*지하철역ID*/
	        if(calendar.get(Calendar.DAY_OF_WEEK)==7) {
	        	urlBuilder.append("&" + URLEncoder.encode("dailyTypeCode","UTF-8") + "=" + URLEncoder.encode("02", "UTF-8")); /*요일구분코드(01:평일, 02:토요일, 03:일요일)*/
	        }else if(calendar.get(Calendar.DAY_OF_WEEK)==1) {
	        	urlBuilder.append("&" + URLEncoder.encode("dailyTypeCode","UTF-8") + "=" + URLEncoder.encode("03", "UTF-8")); /*요일구분코드(01:평일, 02:토요일, 03:일요일)*/
	        }else {
	        	urlBuilder.append("&" + URLEncoder.encode("dailyTypeCode","UTF-8") + "=" + URLEncoder.encode("01", "UTF-8")); /*요일구분코드(01:평일, 02:토요일, 03:일요일)*/
	        }
	        urlBuilder.append("&" + URLEncoder.encode("upDownTypeCode","UTF-8") + "=" + URLEncoder.encode("U", "UTF-8")); /*상하행구분코드(U:상행, D:하행)*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	        
	        org.json.JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
	        String xmlJSONObjString = xmlJSONObj.toString();
	        System.out.println(xmlJSONObjString);
	        return xmlJSONObjString;
	        
	}
	public static String subwayTimeList(String subwayStationId, String numOfRows) throws IOException {
		Calendar calendar = Calendar.getInstance();
		 StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/SubwayInfoService/getSubwaySttnAcctoSchdulList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=F3XkHoxAbwCycjGsjd1Mbzv4qCuLuBn50NgivLP7ELagNiF6iL0eIYzDEIfLTCaA6n9Tic0ph5ySC1scxALVNA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("subwayStationId","UTF-8") + "=" + URLEncoder.encode(subwayStationId, "UTF-8")); /*지하철역ID*/
	        if(calendar.get(Calendar.DAY_OF_WEEK)==7) {
	        	urlBuilder.append("&" + URLEncoder.encode("dailyTypeCode","UTF-8") + "=" + URLEncoder.encode("02", "UTF-8")); /*요일구분코드(01:평일, 02:토요일, 03:일요일)*/
	        }else if(calendar.get(Calendar.DAY_OF_WEEK)==1) {
	        	urlBuilder.append("&" + URLEncoder.encode("dailyTypeCode","UTF-8") + "=" + URLEncoder.encode("03", "UTF-8")); /*요일구분코드(01:평일, 02:토요일, 03:일요일)*/
	        }else {
	        	urlBuilder.append("&" + URLEncoder.encode("dailyTypeCode","UTF-8") + "=" + URLEncoder.encode("01", "UTF-8")); /*요일구분코드(01:평일, 02:토요일, 03:일요일)*/
	        }
	        urlBuilder.append("&" + URLEncoder.encode("upDownTypeCode","UTF-8") + "=" + URLEncoder.encode("U", "UTF-8")); /*상하행구분코드(U:상행, D:하행)*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8")); /*상하행구분코드(U:상행, D:하행)*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	        
	        org.json.JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
	        String xmlJSONObjString = xmlJSONObj.toString();
	        System.out.println(xmlJSONObjString);
	        return xmlJSONObjString;
		
	}
	public static String subwayTimeU(String subwayStationId) throws IOException {
		Calendar calendar = Calendar.getInstance();
		StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/SubwayInfoService/getSubwaySttnAcctoSchdulList"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=F3XkHoxAbwCycjGsjd1Mbzv4qCuLuBn50NgivLP7ELagNiF6iL0eIYzDEIfLTCaA6n9Tic0ph5ySC1scxALVNA%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("subwayStationId","UTF-8") + "=" + URLEncoder.encode(subwayStationId, "UTF-8")); /*지하철역ID*/
		if(calendar.get(Calendar.DAY_OF_WEEK)==7) {
			urlBuilder.append("&" + URLEncoder.encode("dailyTypeCode","UTF-8") + "=" + URLEncoder.encode("02", "UTF-8")); /*요일구분코드(01:평일, 02:토요일, 03:일요일)*/
		}else if(calendar.get(Calendar.DAY_OF_WEEK)==1) {
			urlBuilder.append("&" + URLEncoder.encode("dailyTypeCode","UTF-8") + "=" + URLEncoder.encode("03", "UTF-8")); /*요일구분코드(01:평일, 02:토요일, 03:일요일)*/
		}else {
			urlBuilder.append("&" + URLEncoder.encode("dailyTypeCode","UTF-8") + "=" + URLEncoder.encode("01", "UTF-8")); /*요일구분코드(01:평일, 02:토요일, 03:일요일)*/
		}
		urlBuilder.append("&" + URLEncoder.encode("upDownTypeCode","UTF-8") + "=" + URLEncoder.encode("D", "UTF-8")); /*상하행구분코드(U:상행, D:하행)*/
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());
		
		org.json.JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
		String xmlJSONObjString = xmlJSONObj.toString();
		System.out.println(xmlJSONObjString);
		return xmlJSONObjString;
		
	}
	public static String subwayTimeListU(String subwayStationId, String numOfRows) throws IOException {
		Calendar calendar = Calendar.getInstance();
		StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/SubwayInfoService/getSubwaySttnAcctoSchdulList"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=F3XkHoxAbwCycjGsjd1Mbzv4qCuLuBn50NgivLP7ELagNiF6iL0eIYzDEIfLTCaA6n9Tic0ph5ySC1scxALVNA%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("subwayStationId","UTF-8") + "=" + URLEncoder.encode(subwayStationId, "UTF-8")); /*지하철역ID*/
		if(calendar.get(Calendar.DAY_OF_WEEK)==7) {
			urlBuilder.append("&" + URLEncoder.encode("dailyTypeCode","UTF-8") + "=" + URLEncoder.encode("02", "UTF-8")); /*요일구분코드(01:평일, 02:토요일, 03:일요일)*/
		}else if(calendar.get(Calendar.DAY_OF_WEEK)==1) {
			urlBuilder.append("&" + URLEncoder.encode("dailyTypeCode","UTF-8") + "=" + URLEncoder.encode("03", "UTF-8")); /*요일구분코드(01:평일, 02:토요일, 03:일요일)*/
		}else {
			urlBuilder.append("&" + URLEncoder.encode("dailyTypeCode","UTF-8") + "=" + URLEncoder.encode("01", "UTF-8")); /*요일구분코드(01:평일, 02:토요일, 03:일요일)*/
		}
		urlBuilder.append("&" + URLEncoder.encode("upDownTypeCode","UTF-8") + "=" + URLEncoder.encode("D", "UTF-8")); /*상하행구분코드(U:상행, D:하행)*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8")); /*상하행구분코드(U:상행, D:하행)*/
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());
		
		org.json.JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
		String xmlJSONObjString = xmlJSONObj.toString();
		System.out.println(xmlJSONObjString);
		return xmlJSONObjString;
		
	}
}
