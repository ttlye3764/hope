package kr.or.ddit.schedule.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ScheduleVO;

public interface IScheduleDAO {
/*
   public MemberVO memberInfo(Map<String, String> params) throws Exception;

   public List<MemberVO> memberList(Map<String, String> params) throws Exception;

   public void deleteSchedule(Map<String, String> params) throws Exception;
   public void updateScheduleInfo(ScheduleVO scheduleInfo) throws Exception;
   */
   public int insertSchedule(ScheduleVO insertScheduleInfo) throws Exception; 
   public List<ScheduleVO> scheduleList(String mem_no) throws Exception;
   
/*   public String totalCount(Map<String, String> params) throws Exception;*/
}