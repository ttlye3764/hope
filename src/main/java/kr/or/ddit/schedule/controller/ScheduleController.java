package kr.or.ddit.schedule.controller;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.schedule.service.IScheduleService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MypillVO;
import kr.or.ddit.vo.ScheduleListVO;
import kr.or.ddit.vo.ScheduleVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jettison.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("dday")
	public void dday() {

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

}