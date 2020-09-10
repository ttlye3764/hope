package kr.or.ddit.vo;

public class LoginVO {
	String lg_ip;
	String mem_id;
	String lg_time;
	String lg_status;
	String lg_comname;
	public String getLg_comname() {
		return lg_comname;
	}
	public void setLg_comname(String lg_comname) {
		this.lg_comname = lg_comname;
	}
	public String getLg_ip() {
		return lg_ip;
	}
	public void setLg_ip(String lg_ip) {
		this.lg_ip = lg_ip;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getLg_time() {
		return lg_time;
	}
	public void setLg_time(String lg_time) {
		this.lg_time = lg_time;
	}
	public String getLg_status() {
		return lg_status;
	}
	public void setLg_status(String lg_status) {
		this.lg_status = lg_status;
	}
}
