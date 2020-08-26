package kr.or.ddit.vo;

import java.util.List;

public class ScheduleListVO {
	private List<String> s_no;
	private List<String> s_memo;
	private List<String> s_startdate;
	private List<String> s_enddate;
	private List<String> s_alerttime;
	private List<String> mem_no;
	private List<String> s_color;
	public List<String> getS_no() {
		return s_no;
	}
	public void setS_no(List<String> s_no) {
		this.s_no = s_no;
	}
	public List<String> getS_memo() {
		return s_memo;
	}
	public void setS_memo(List<String> s_memo) {
		this.s_memo = s_memo;
	}
	public List<String> getS_startdate() {
		return s_startdate;
	}
	public void setS_startdate(List<String> s_startdate) {
		this.s_startdate = s_startdate;
	}
	public List<String> getS_enddate() {
		return s_enddate;
	}
	public void setS_enddate(List<String> s_enddate) {
		this.s_enddate = s_enddate;
	}
	public List<String> getS_alerttime() {
		return s_alerttime;
	}
	public void setS_alerttime(List<String> s_alerttime) {
		this.s_alerttime = s_alerttime;
	}
	public List<String> getMem_no() {
		return mem_no;
	}
	public void setMem_no(List<String> mem_no) {
		this.mem_no = mem_no;
	}
	public List<String> getS_color() {
		return s_color;
	}
	public void setS_color(List<String> s_color) {
		this.s_color = s_color;
	}
	@Override
	public String toString() {
		return "ScheduleListVO [s_no=" + s_no + ", s_memo=" + s_memo + ", s_startdate=" + s_startdate + ", s_enddate="
				+ s_enddate + ", s_alerttime=" + s_alerttime + ", mem_no=" + mem_no + ", s_color=" + s_color + "]";
	}
	
	
	
}
