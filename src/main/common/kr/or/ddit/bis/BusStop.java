package kr.or.ddit.bis;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.XML;
import org.springframework.context.annotation.Configuration;

import java.io.BufferedReader;
import java.io.IOException;

@Configuration
public class BusStop {
	public static void main(String[] args) throws Exception{ 
		 

    }

/* Java 샘플 코드 */
	
	public static String location(String a, String b) throws IOException {
	        StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/BusSttnInfoInqireService/getCrdntPrxmtSttnList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=F3XkHoxAbwCycjGsjd1Mbzv4qCuLuBn50NgivLP7ELagNiF6iL0eIYzDEIfLTCaA6n9Tic0ph5ySC1scxALVNA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("gpsLati","UTF-8") + "=" + URLEncoder.encode(a, "UTF-8")); /*WGS84 위도 좌표*/
	        urlBuilder.append("&" + URLEncoder.encode("gpsLong","UTF-8") + "=" + URLEncoder.encode(b, "UTF-8")); /*WGS84 경도 좌표*/
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
	
	public static String busStopInfo(String a, String b) throws IOException {
		StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/ArvlInfoInqireService/getSttnAcctoArvlPrearngeInfoList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=F3XkHoxAbwCycjGsjd1Mbzv4qCuLuBn50NgivLP7ELagNiF6iL0eIYzDEIfLTCaA6n9Tic0ph5ySC1scxALVNA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("cityCode","UTF-8") + "=" + URLEncoder.encode(a, "UTF-8")); /*도시코드*/
        urlBuilder.append("&" + URLEncoder.encode("nodeId","UTF-8") + "=" + URLEncoder.encode(b, "UTF-8")); /*정류소ID*/
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

