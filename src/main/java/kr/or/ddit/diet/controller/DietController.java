package kr.or.ddit.diet.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.diet.service.IDietService;
import kr.or.ddit.vo.Diet_dayVO;
import kr.or.ddit.vo.Diet_day_infoVO;
import kr.or.ddit.vo.Diet_memVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MenuVO;

@Controller
@RequestMapping("/user/diet/")
public class DietController {
	
	@Autowired
	private IDietService dietService;
	
	@RequestMapping("dietMain")
	public ModelAndView dietMain(ModelAndView andView) {
		
		
		andView.setViewName("user/diet/diet");
		return andView;
	}
	
	@RequestMapping("searchMenu")
	public void searchMenu() {
		
	}
	
	@RequestMapping("menuList")
	public ModelAndView menuList(ModelAndView andView,
			Map<String, String> params) throws Exception{
		params.put("rownum", "100");
		List<MenuVO> menuList = dietService.menuList(params);
		
		
		andView.addObject("menuList", menuList);
		andView.setViewName("user/diet/menuList");
		return andView;
	}
	
	@RequestMapping("dietIntro")
	public ModelAndView dietIntro(ModelAndView andView,
								Map<String, String> params) throws Exception{
		
		params.put("rownum", "10");
		List<MenuVO> menuList = dietService.menuList(params);
		
		
		andView.addObject("menuList", menuList);
		andView.setViewName("user/diet/dietIntro");
		return andView;
	}
	

	
	@RequestMapping("dayKcal")
	public void dayKcal() {
		
	} 
	
	@RequestMapping("diet_my")
	public ModelAndView diet_my(ModelAndView andView,
								Map<String, String> params) throws Exception{
		params.put("mem_no", "1");
		
		List<Diet_memVO> dietMemList = dietService.dietMemList(params);
		
		Diet_memVO dietMemLast = dietMemList.get(dietMemList.size()-1);
		
		andView.addObject("dietMemLast", dietMemLast);
		andView.addObject("dietMemList", dietMemList);
		andView.setViewName("user/diet/diet_my");
		return andView;
	}
	
	@RequestMapping("recommendDiet")
	public void recommendDiet() {}
	
	@RequestMapping("bmi")
	public void bmi() {}
	
	
	@RequestMapping("searchAjax")
	 public String insertMenu(String a,String b, Map<String, String> params) throws Exception{
	       StringBuilder urlBuilder = new StringBuilder("http://openapi.foodsafetykorea.go.kr/api/2ea6cf2e26314645b965/I2790/json/1/500"); /*URL*/
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
	        
	        JSONParser jsonParser = new JSONParser();
	        
	        JSONObject jsonObject = (JSONObject)jsonParser.parse(sb.toString());  
	        
         //  JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
	        
	        JSONObject I2790JSON = (JSONObject) jsonObject.get("I2790");
	        
	        JSONArray rowJSONArray = (JSONArray) I2790JSON.get("row");
	        
	       String menu_kcal= "";
	       String menu_name = "";
	        
	        for(int i=0; i<rowJSONArray.size(); i++){
	        	 
                System.out.println("=row_"+i+" ===========================================");
                 
                //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
                JSONObject rowObject = (JSONObject) rowJSONArray.get(i);
                 
                //JSON name으로 추출
                System.out.println("rowInfo: NUTR_CONT3==>"+rowObject.get("NUTR_CONT3"));
                System.out.println("rowInfo: NUTR_CONT2==>"+rowObject.get("NUTR_CONT2"));
                System.out.println("rowInfo: NUTR_CONT1==>"+rowObject.get("NUTR_CONT1"));
                System.out.println("rowInfo: SERVING_SIZE==>"+rowObject.get("SERVING_SIZE"));
                System.out.println("rowInfo: DESC_KOR==>"+rowObject.get("DESC_KOR"));
                
                
                menu_kcal = rowObject.get("NUTR_CONT1").toString();
                menu_name = rowObject.get("DESC_KOR").toString();
                
                if(rowObject.get("NUTR_CONT1").toString().equals("")) {
                	menu_kcal = "0";
                }
                params.put("menu_kcal", menu_kcal);
                params.put("menu_name", menu_name);
                
               dietService.insertMenu(params);
 
            }
	        // NUTR_CONT1 열량
	        // DESC_KOR 식품이름
	        
	        
	        //String xmlJSONObjString = xmlJSONObj.toString();
	        System.out.println("아");
	        
	        return "success";
	    }
	
	@RequestMapping("insertDietMem")
	public ModelAndView insertDietMem(Diet_memVO diet_memInfo,
										ModelAndView andView,
										HttpServletRequest request,
										HttpSession session,
										MemberVO memberInfo) throws Exception{
		session = request.getSession();
		
		memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		diet_memInfo.setMem_no(memberInfo.getMem_no());
		
		dietService.insertDietMem(diet_memInfo);
		
		return andView;
	}
	
	
	@RequestMapping("menuSearch")
	public ModelAndView menuSearch(ModelAndView andView,
									String menu_search,
									Map<String, String> params) throws Exception{
		
		params.put("menu_search", menu_search);
		List<MenuVO> menuSearchList = dietService.menuSearch(params);
		
		andView.addObject("menuSearchList", menuSearchList);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("insertAllDietDay")
	public ModelAndView insertAllDietDay(ModelAndView andView,
										 Diet_dayVO dietDay,
										 Diet_day_infoVO dietDayInfo,
										 HttpServletRequest request,
										 HttpSession session,
										 String dd_date,
										 Map<String, String> params,
										 int dd_no) throws Exception{
		
		
		session = request.getSession();
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		dietDay.setMem_no(memberInfo.getMem_no());
		
		params.put("dd_date",dd_date);
		params.put("mem_no", memberInfo.getMem_no());
		
		if(dietService.selectDietDay(params) == null) {
			dd_no = dietService.insertDietDay(dietDay);	
		}
		dietDayInfo.setDd_no(dd_no+"");
		dietService.InsertDietDayInfo(dietDayInfo);
		
		params.put("dd_no", dd_no+"");
		dietService.updateDietDayKcal(params);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("calendarModal")
	public ModelAndView calendarModal(ModelAndView andView,
										String dd_date,
										HttpServletRequest request,
										HttpSession session,
										Map<String, String> params) throws Exception{
		
		session = request.getSession();
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		params.put("dd_date", dd_date);
		params.put("mem_no", memberInfo.getMem_no());
		
		// 일별 식단 내용 가져오기
		Diet_dayVO dietDay = dietService.selectDietDay(params);
		
		
		// 일별 식단을 등록한 적이 있으면~
		if(dietDay != null) {
			// 일별 식단의 식단 번호 가져오기
			params.put("dd_no", dietDay.getDd_no());
			
			
			// 일별 식단 상세 가져오기
			// 1 -> 아침꺼 
			params.put("dd_info_division","1");
			List<Diet_day_infoVO> dietDayInfoList1 = dietService.dietDayInfoList(params);
			
			//2 -> 점심꺼
			params.put("dd_info_division","2");
			List<Diet_day_infoVO> dietDayInfoList2 = dietService.dietDayInfoList(params);
			
			//3 -> 저녁
			params.put("dd_info_division","3");
			List<Diet_day_infoVO> dietDayInfoList3 = dietService.dietDayInfoList(params);
			
			andView.addObject("dietDayInfoList1", dietDayInfoList1);
			andView.addObject("dietDayInfoList2", dietDayInfoList2);
			andView.addObject("dietDayInfoList3", dietDayInfoList3);
		}
		
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
}
