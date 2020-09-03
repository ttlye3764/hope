package kr.or.ddit.schedule.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.bis.Bis;
import kr.or.ddit.bis.Bis_location;
import kr.or.ddit.bis.BusStop;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.schedule.service.IScheduleService;
import kr.or.ddit.vo.BusVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MypillVO;
import kr.or.ddit.vo.ScheduleListVO;
import kr.or.ddit.vo.ScheduleVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jettison.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/user/schedule/")
public class ScheduleController {


	@Autowired
	private MessageSourceAccessor accessor;

	@Autowired
	private ObjectMapper mapper;

	@Autowired
	private IScheduleService service;

	@Autowired
	private IMemberService MemberService;

	/*
	 * private static final Logger logger =
	 * LoggerFactory.getLogger(ScheduleController.class);
	 * 
	 *//**
		 * Simply selects the home view to render by returning its name.
		 */
	
	
	
	@RequestMapping("schedule")
	public void schedule() {

	}
	
	/*
	 * @RequestMapping("bis") public void bis() {
	 * 
	 * }
	 */
	
	@RequestMapping("dday")
	public void dday() {

	}
	
	@RequestMapping("dday2")
	public ModelAndView dday2(HttpServletRequest request,HttpSession session) throws Exception {
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		List<ScheduleVO> scheduleList = this.service.scheduleList(memberInfo.getMem_no()); //mem_no가 들어가야하는데,,,,,,,,,, 
		ModelAndView andView = new ModelAndView();
		andView.addObject("scheduleList", scheduleList);
		andView.setViewName("user/schedule/dday2");
		return andView;
	}
	

	  @RequestMapping("insertScheduleInfo")
	  public String insertSchedule(@RequestBody List<Map> scheduleListVO) throws Exception 
	  {
		  ScheduleVO insertScheduleInfo = new ScheduleVO();

		  for(int i=0; i<scheduleListVO.size(); i++) {
			  
			  System.out.println(scheduleListVO.get(i).get("mem_no"));
			  String start1 = (String) scheduleListVO.get(i).get("s_startdate");
			  String start2 = (String) scheduleListVO.get(i).get("s_startdate");
			  String end1 = (String) scheduleListVO.get(i).get("s_enddate");
			  String end2 = (String) scheduleListVO.get(i).get("s_enddate");
			  
			  start1 = start1.substring(0, start1.indexOf(" "));
			  start1 = start1.replace("/", "-");
			  start2 = start2.substring(start2.indexOf(" ")+1, start2.length());
			  start1 = start1.concat("T");
			  insertScheduleInfo.setS_startdate(start1.concat(start2));
			  
			  end1 = end1.substring(0, end1.indexOf(" "));
			  end1 = end1.replace("/", "-");
			  end2 = end2.substring(end2.indexOf(" ")+1, end2.length());
			  end1 = end1.concat("T"); 
			  insertScheduleInfo.setS_enddate(end1.concat(end2));
			  
			  insertScheduleInfo.setMem_no(scheduleListVO.get(i).get("mem_no").toString());
			  insertScheduleInfo.setS_memo(scheduleListVO.get(i).get("s_memo").toString());
			  insertScheduleInfo.setS_color(scheduleListVO.get(i).get("s_color").toString());
			  this.service.insertSchedule(insertScheduleInfo); 
		  }

		  return "redirect:/user/schedule/schedule.do";
	  }


	


	@RequestMapping("viewJson")
	public ModelAndView idCheck(String mem_no) throws Exception {

		List<ScheduleVO> scheduleList = this.service.scheduleList(mem_no);
		ModelAndView andView = new ModelAndView();
		// andView.addObject("scheduleList", scheduleList);
		/*
		 * Map<String, TestVO> scheduleList = new HashMap<String, TestVO>(); TestVO vo =
		 * new TestVO(); vo.setTitle("첫뻔쨰"); vo.setStart("2020-08-12T10:30:00");
		 * vo.setEnd("2020-08-14T11:30:00"); scheduleList.put("scheduleList", vo);
		 */

		andView.addObject("json", scheduleList);
		// <bean id="jsonConvertView" class="..MappingJackson2JsonView>
		andView.setViewName("jsonConvertView");
		return andView;
	}

	@RequestMapping("viewJson2")
	public ModelAndView sNoCheck(int s_no) throws Exception {

		ScheduleVO scheduleInfo = this.service.scheduleInfo(s_no);
		ModelAndView andView = new ModelAndView();
		// andView.addObject("scheduleList", scheduleList);
		/*
		 * Map<String, TestVO> scheduleList = new HashMap<String, TestVO>(); TestVO vo =
		 * new TestVO(); vo.setTitle("첫뻔쨰"); vo.setStart("2020-08-12T10:30:00");
		 * vo.setEnd("2020-08-14T11:30:00"); scheduleList.put("scheduleList", vo);
		 */

		andView.addObject("json", scheduleInfo);
		// <bean id="jsonConvertView" class="..MappingJackson2JsonView>
		andView.setViewName("jsonConvertView");
		return andView;
	}

	@RequestMapping("searchId")
	public ModelAndView searchId(String mem_id, Map<String, String> params) throws Exception {
		params.put("mem_id", mem_id);
		MemberVO memberInfo = this.MemberService.memberInfo(params);
		ModelAndView andView = new ModelAndView();
		andView.addObject("memberInfo", memberInfo);
		andView.setViewName("jsonConvertView");
		return andView;
	}

	@RequestMapping("deleteSchedule")
	public String deleteSchedule(Map<String, String> params, String s_no) throws Exception {
		params.put("s_no", s_no);
		this.service.deleteSchedule(params);
		return "redirect:/user/schedule/schedule.do";
	}

	@RequestMapping("updateScheduleInfo")
	public String updateScheduleInfo(ScheduleVO scheduleInfo) throws Exception {
		String start1 = scheduleInfo.getS_startdate();
		String start2 = scheduleInfo.getS_startdate();
		String end1 = scheduleInfo.getS_enddate();
		String end2 = scheduleInfo.getS_enddate();

		start1 = start1.substring(0, start1.indexOf(" "));
		start1 = start1.replace("/", "-");
		start2 = start2.substring(start2.indexOf(" ") + 1, start2.length());
		start1 = start1.concat("T");
		scheduleInfo.setS_startdate(start1.concat(start2));

		end1 = end1.substring(0, end1.indexOf(" "));
		end1 = end1.replace("/", "-");
		end2 = end2.substring(end2.indexOf(" ") + 1, end2.length());
		end1 = end1.concat("T");
		scheduleInfo.setS_enddate(end1.concat(end2));

		this.service.updateScheduleInfo(scheduleInfo);
		return "redirect:/user/schedule/schedule.do";
	}
	
	@ResponseBody
	@RequestMapping("bisSearch")
	public String bisSearch(String citycode, String routeid) throws Exception {
		String bisResult = Bis.bisSearch(citycode, routeid);
		System.out.println(bisResult);
		return bisResult;
	}
	
	@ResponseBody
	@RequestMapping("bisLocation")
	public String bisLocation(String citycode, String res_routeid) throws Exception {
		String bisLocationResult = Bis_location.location(citycode, res_routeid);
		return bisLocationResult;
	}
	
	@ResponseBody
	@RequestMapping(value="busStop",produces="text/plain; charset=UTF-8")
	public String busStop(String gpsLati, String gpsLong) throws Exception {
		String busStopResult = BusStop.location(gpsLati, gpsLong);
		return busStopResult;
	}
	@ResponseBody
	@RequestMapping(value="busStopInfo",produces="text/plain; charset=UTF-8")
	public String busStopInfo(String cityCode, String nodeId) throws Exception {
		String busStopResult = BusStop.busStopInfo(cityCode, nodeId);
		return busStopResult;
	}
	
	@RequestMapping("registBus")
	public String registBus(String routeid, String citycode, String mem_no, BusVO busInfo) throws Exception {
		busInfo.setBus_no(routeid);
		busInfo.setCity_code(citycode);
		busInfo.setMem_no(mem_no);
		this.service.registBus(busInfo);
		return "redirect:/user/schedule/bis.do";
	}
	
	
	@RequestMapping("bis")
	public ModelAndView bisList(HttpServletRequest request,HttpSession session) throws Exception {
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		List<BusVO> busList = this.service.bisList(memberInfo.getMem_no());  /////////////////mem_no 불러와야되는데..
		ModelAndView andView = new ModelAndView();
		andView.addObject("busList", busList);
		andView.setViewName("user/schedule/bis");
		return andView;
	}

	@RequestMapping("deleteBus")
	public String deleteBus(String bus_index) throws Exception {
		this.service.deleteBus(bus_index);
		return "redirect:/user/schedule/bis.do";
	}
	
	

}