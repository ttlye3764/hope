/*
 * package kr.or.ddit.medical.controller;
 * 
 * import java.util.HashMap; import java.util.List; import java.util.Map;
 * 
 * import javax.servlet.http.HttpServletRequest; import
 * org.codehaus.jackson.map.ObjectMapper; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.context.support.MessageSourceAccessor; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.ModelMap; import
 * org.springframework.web.bind.annotation.RequestBody; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.servlet.ModelAndView; import
 * org.springframework.web.servlet.mvc.support.RedirectAttributes;
 * 
 *//**
	 * Handles requests for the application home page.
	 */
/*
 * @Controller
 * 
 * @RequestMapping("/user/schedule/") public class medicalList{
 * 
 * 
 * 
 * 
 * private static final Logger logger =
 * LoggerFactory.getLogger(ScheduleController.class);
 * 
 *//**
	 * Simply selects the home view to render by returning its name.
	 *//*
		 * @RequestMapping("schedule") public void schedule(){
		 * 
		 * }
		 * 
		 * 
		 * @RequestMapping("insertScheduleInfo") public String
		 * insertSchedule(, @RequestBody String totalParams, RedirectAttributes
		 * redirectAttributes) throws Exception{
		 * System.out.println("@RequestBody:"+totalParams);
		 * 
		 * String start1 = insertScheduleInfo.getS_startdate(); String start2 =
		 * insertScheduleInfo.getS_startdate(); String end1 =
		 * insertScheduleInfo.getS_enddate(); String end2 =
		 * insertScheduleInfo.getS_enddate();
		 * 
		 * start1 = start1.substring(0, start1.indexOf(" ")); start1 =
		 * start1.replace("/", "-"); start2 =
		 * start2.substring(start2.indexOf(" ")+1,start2.length()); start1 =
		 * start1.concat("T"); insertScheduleInfo.setS_startdate(start1.concat(start2));
		 * 
		 * end1 = end1.substring(0,end1.indexOf(" ")); end1 = end1.replace("/", "-");
		 * end2 = end2.substring(end2.indexOf(" ")+1,end2.length()); end1 =
		 * end1.concat("T"); insertScheduleInfo.setMem_no("0");
		 * insertScheduleInfo.setS_enddate(end1.concat(end2));
		 * 
		 * 
		 * 
		 * 
		 * this.service.insertSchedule(insertScheduleInfo); //String message =
		 * this.accessor.getMessage("cop.regist.msg.confirm",Locale.KOREA);
		 * //message=URLEncoder.encode(message,"UTF-8"); //return
		 * "redirect:/user/join/loginForm.do?message="+message;
		 * redirectAttributes.addFlashAttribute("message","등록이 완료되었습니다."); return
		 * "redirect:/user/schedule/schedule.do"; }
		 * 
		 * @RequestMapping("viewJson") public ModelAndView idCheck(String mem_no) throws
		 * Exception{
		 * 
		 * List<ScheduleVO> scheduleList = this.service.scheduleList(mem_no);
		 * ModelAndView andView = new ModelAndView();
		 * //andView.addObject("scheduleList", scheduleList); Map<String, TestVO>
		 * scheduleList = new HashMap<String, TestVO>(); TestVO vo = new TestVO();
		 * vo.setTitle("첫뻔쨰"); vo.setStart("2020-08-12T10:30:00");
		 * vo.setEnd("2020-08-14T11:30:00"); scheduleList.put("scheduleList", vo);
		 * 
		 * andView.addObject("json", scheduleList); //<bean id="jsonConvertView"
		 * class="..MappingJackson2JsonView> andView.setViewName("jsonConvertView");
		 * return andView; }
		 * 
		 * }
		 */