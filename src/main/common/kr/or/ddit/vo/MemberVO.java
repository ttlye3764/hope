
package kr.or.ddit.vo;

import java.util.List;

public class MemberVO {
	private String mem_no;
	private String mem_id;
	private String mem_pass;
	private String mem_temporary_pass;
	private String mem_name;
	private String mem_gender;
	private String mem_nickname;
	private String mem_birth;
	private String mem_email;
	private String mem_hp;
	private String mem_addr1;
	private String mem_addr2;
	private String mem_division;
	private String mem_join_addr;
	private String mem_zip1;
	private String mem_zip2;
	private String mem_delete;
	private List<MemberFileVO> items; // 이미지 리스트
	private List<MemberFileVO> items2; // 이미지 리스트
	//채팅
	private String ch_no;
	private String msg_content;
	private String msg_date;
	private String file_save_name;
	
	
	public String getFile_save_name() {
		return file_save_name;
	}
	public void setFile_save_name(String file_save_name) {
		this.file_save_name = file_save_name;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public String getMsg_date() {
		return msg_date;
	}
	public void setMsg_date(String msg_date) {
		this.msg_date = msg_date;
	}
	public List<MemberFileVO> getItems2() {
		return items2;
	}
	public void setItems2(List<MemberFileVO> items2) {
		this.items2 = items2;
	}
	public List<MemberFileVO> getItems() {
		return items;
	}
	public void setItems(List<MemberFileVO> items) {
		this.items = items;
	}
	public String getCh_no() {
		return ch_no;
	}
	public void setCh_no(String ch_no) {
		this.ch_no = ch_no;
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public String getMem_temporary_pass() {
		return mem_temporary_pass;
	}
	public void setMem_temporary_pass(String mem_temporary_pass) {
		this.mem_temporary_pass = mem_temporary_pass;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_hp() {
		return mem_hp;
	}
	public void setMem_hp(String mem_hp) {
		this.mem_hp = mem_hp;
	}
	public String getMem_addr1() {
		return mem_addr1;
	}
	public void setMem_addr1(String mem_addr1) {
		this.mem_addr1 = mem_addr1;
	}
	public String getMem_addr2() {
		return mem_addr2;
	}
	public void setMem_addr2(String mem_addr2) {
		this.mem_addr2 = mem_addr2;
	}
	public String getMem_division() {
		return mem_division;
	}
	public void setMem_division(String mem_division) {
		this.mem_division = mem_division;
	}
	public String getMem_join_addr() {
		return mem_join_addr;
	}
	public String getMem_delete() {
		return mem_delete;
	}
	public void setMem_delete(String mem_delete) {
		this.mem_delete = mem_delete;
	}
	public void setMem_join_addr(String mem_join_addr) {
		this.mem_join_addr = mem_join_addr;
	}
	public String getMem_zip1() {
		return mem_zip1;
	}
	public void setMem_zip1(String mem_zip1) {
		this.mem_zip1 = mem_zip1;
	}
	public String getMem_zip2() {
		return mem_zip2;
	}
	public void setMem_zip2(String mem_zip2) {
		this.mem_zip2 = mem_zip2;
	}
	
	/*public MemberVO(String mem_id, String mem_pass, String mem_name) {
		super();
		this.mem_id = mem_id;
		this.mem_pass = mem_pass;
		this.mem_name = mem_name;
		
		System.out.println(this.mem_id + " | " + this.mem_pass + " | " + this.mem_name);
	}*/
	
}
