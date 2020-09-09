package kr.or.ddit.scheduler;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.or.ddit.accountBook.dao.DealDaoImpl;
import kr.or.ddit.accountBook.dao.IDealDao;
import kr.or.ddit.vo.DealVO;

@Component
public class Scheduler {
	
	@Autowired
	private IDealDao dealDao;
	
	@Scheduled(cron = "0 0 0 1 * *") // 초 분 시 일 월 요일
	public void crontest1() {
		try {
			
			List<DealVO> expenditureList = dealDao.selectexpenditure();
			for(int i=0; i<expenditureList.size(); i++) {
				expenditureList.get(i).setDeal_fix_expenditure("0");
				
				String expendituredate = expenditureList.get(i).getDeal_date();
				Calendar cal = Calendar.getInstance();
				String month = String.format("%02d", cal.get ( cal.MONTH ) + 1);
				String[] eyear = expendituredate.split("-");
				String[] eday = eyear[2].split(" ");
				expenditureList.get(i).setDeal_date(eyear[0]+'-'+month+'-'+eday[0]);
				dealDao.insertDeal(expenditureList.get(i));
			}	//고정 지출 insert
				
		
		    List<DealVO> revenueList = dealDao.selectrevenue();
		    for(int i=0; i<revenueList.size(); i++) {
		    	revenueList.get(i).setDeal_fix_revenue("0");
		    	String revenuedate = revenueList.get(i).getDeal_date();
		    	Calendar cal = Calendar.getInstance();
		    	String month = String.format("%02d", cal.get ( cal.MONTH ) + 1);
		    	String[] ryear = revenuedate.split("-");
				String[] rday = ryear[2].split(" "); 
				revenueList.get(i).setDeal_date(ryear[0]+'-'+month+'-'+rday[0]);
				dealDao.insertDeal(revenueList.get(i));
		    }
			
			

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}
