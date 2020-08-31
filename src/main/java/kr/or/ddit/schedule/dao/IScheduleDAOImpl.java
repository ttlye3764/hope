package kr.or.ddit.schedule.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.BusVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ScheduleVO;

//설정 파일 : <bean name="IMemberDAOImpl" class="kr.or.ddit.member.dao.IMemberDAOImpl"/>
@Repository
public class IScheduleDAOImpl implements IScheduleDAO {
   
   //@Resource
   //@Inject
   @Autowired
   private SqlSessionTemplate client;
   
   @Override
   public int insertSchedule(ScheduleVO insertScheduleInfo) throws Exception {
      int cnt = 0;
      try {
         Object obj = client.insert("schedule.insertSchedule", insertScheduleInfo);
         if(obj == null){
            cnt = 1;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return cnt; 
   }

   @Override
   public List<ScheduleVO> scheduleList(String mem_no) throws Exception {
      return client.selectList("schedule.scheduleList", mem_no);
   }

   @Override
   public void deleteSchedule(Map<String, String> params) throws Exception {
      client.update("schedule.deleteSchedule", params);
      
   }
   
   
   @Override
   public void updateScheduleInfo(ScheduleVO scheduleInfo) throws Exception {
      client.update("schedule.updateSchedule", scheduleInfo);
      
   }

	@Override
	public ScheduleVO scheduleInfo(int s_no) throws Exception {
		return client.selectOne("schedule.scheduleInfo",s_no);
	}

	@Override
	public void registBus(BusVO busInfo) throws Exception {
		client.insert("schedule.busInfo",busInfo);
	}

	@Override
	public List<BusVO> bisList(String mem_no) throws Exception {
		return client.selectList("schedule.bisList",mem_no);
	}

	@Override
	public void deleteBus(String bus_index) throws Exception {
		client.update("schedule.deleteBus", bus_index);
	}
   
   
   /*   
   @Override
   public MemberVO memberInfo(Map<String, String> params) throws Exception {
      return (MemberVO) client.queryForObject("member.memberInfo", params); // Object 타입으로 Upcasting으로 전달하기 때문에 
                                                           // 나중에 값을 받아 올때 DownCasting를 해줘야 한다.
   }

   @Override
   public List<MemberVO> memberList(Map<String, String> params) throws Exception {
      return client.queryForList("member.memberList", params);
   }

   @Override
   public void deleteMemberInfo(Map<String, String> params) throws Exception {
      client.update("member.deleteMember", params);
   }

   @Override
   public void updateMemberInfo(MemberVO memberInfo) throws Exception {
      // udpate 쿼리
      // 테이블 생성
      // 프로시저, 펑션을 작성 및 호출
      // 오라클 객체 생성
      // client.update(agr0)
      client.update("member.updateMember", memberInfo);
   }

   @Override
   public int insertMember(MemberVO insertMemberInfo) throws Exception {
      int cnt = 0;
      try {
         Object obj = client.insert("member.insertMember", insertMemberInfo);
         if(obj == null){
            cnt = 1;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return cnt; 
   }

   @Override
   public String totalCount(Map<String, String> params) throws Exception {
      return (String) client.queryForObject("member.totalCount",params);
   }*/


}