package kr.or.ddit.schedule.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.member.dao.IMemberDAOImpl;
import kr.or.ddit.schedule.dao.IScheduleDAO;
import kr.or.ddit.vo.BusVO;
import kr.or.ddit.vo.FriendVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ScheduleVO;

//설정 파일 : <bean name="iMemberServiceImpl" class="kr.or.iddt.member.service.IMemberServiceImpl" 
//         c:dao-ref="iMemberDaoImpl/>
@Service
public class IScheduleServiceImpl implements IScheduleService {
   @Autowired
   private IScheduleDAO dao;

   @Transactional(propagation=Propagation.REQUIRED, readOnly=true)
   @Override
   public int insertSchedule(ScheduleVO insertScheduleInfo) throws Exception {
      int cnt = 0;
      cnt = dao.insertSchedule(insertScheduleInfo);
   
      return cnt;
   }

   @Override
   public List<ScheduleVO> scheduleList(String mem_no)
         throws Exception {
      return dao.scheduleList(mem_no);
   }

   @Override
   public void deleteSchedule(Map<String, String> params) throws Exception {
      dao.deleteSchedule(params);
      
   }
   
  
   @Override
   public void updateScheduleInfo(ScheduleVO scheduleInfo) throws Exception {
      dao.updateScheduleInfo(scheduleInfo);
      
   }

	@Override
	public ScheduleVO scheduleInfo(int s_no) throws Exception {
		return dao.scheduleInfo(s_no);
		
	}

	@Override
	public void registBus(BusVO busInfo) throws Exception {
		dao.registBus(busInfo);
		
	}

	@Override
	public List<BusVO> bisList(String mem_no) throws Exception {
		return dao.bisList(mem_no);
	}

	@Override
	public void deleteBus(String bus_index) throws Exception {
		dao.deleteBus(bus_index);
	}

	@Override
	public List<MemberVO> searchFriends(String mem_no) throws Exception {
		return dao.searchFriends(mem_no);
	}

	@Override
	public List<ScheduleVO> scheduleListAlarm(String mem_no) throws Exception {
		return dao.scheduleListAlarm(mem_no);
	}

   /*@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
   @Override
   public MemberVO memberInfo(Map<String, String> params) throws Exception {

      return dao.memberInfo(params);
   }

   @Transactional(propagation=Propagation.REQUIRED, readOnly=true)
   @Override
   public List<MemberVO> memberList(Map<String, String> params) throws Exception {
      return dao.memberList(params);
   }

   @Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
   @Override
   public void deleteMemberInfo(Map<String, String> params)throws Exception {
      dao.deleteMemberInfo(params);
   }

   @Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
   @Override
   public void updateMemberInfo(MemberVO memberInfo) throws Exception {
         dao.updateMemberInfo(memberInfo);
      
   }

   @Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
   @Override
   public int insertMember(MemberVO insertMemberInfo) throws Exception {
      int cnt = 0;
         cnt = dao.insertMember(insertMemberInfo);
      
      return cnt;
   }

   @Transactional(propagation=Propagation.REQUIRED, readOnly=true)
   @Override
   public String totalCount(Map<String, String> params) throws Exception {
      String totalCount  = null;
         totalCount = dao.totalCount(params);
      return totalCount;
   }
   */
   

}