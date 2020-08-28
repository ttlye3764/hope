package kr.or.ddit.schedule.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BusVO;
import kr.or.ddit.vo.ScheduleVO;

public interface IScheduleService {
   /*public MemberVO memberInfo(Map<String, String> params) throws Exception;
   public List<MemberVO> memberList(Map<String, String> params) throws Exception;
   public void deleteMemberInfo(Map<String, String> params) throws Exception;
   public void updateMemberInfo(MemberVO memberInfo) throws Exception;
   public void deleteSchedule(Map<String, String> params) throws Exception;
   */
   public void updateScheduleInfo(ScheduleVO scheduleInfo) throws Exception;
   public void deleteSchedule(Map<String, String> params) throws Exception;
   public int insertSchedule (ScheduleVO insertScheduleInfo) throws Exception;
   public List<ScheduleVO> scheduleList(String mem_no) throws Exception;
   public List<BusVO> bisList(String mem_no) throws Exception;
   public ScheduleVO scheduleInfo(int s_no) throws Exception;
   public void registBus(BusVO busInfo) throws Exception;
   /*public String totalCount(Map<String, String> params) throws Exception;*/
   
}