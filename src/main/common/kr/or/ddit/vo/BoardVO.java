package kr.or.ddit.vo;

import java.util.List;

public class BoardVO {

	private String bd_no;
	private String bd_title;
	private String bd_content;
	private String bd_date;
	private String bd_hit;
	private String bd_pass;
	private String bd_sequence;  // 순서  
	private String bd_group;     // 그룹번호 
	private String bd_depth;     // 깊이   
	private String bd_division;
	private String mem_no;
	private String rnum;
	private String bd_writer;
	private String mem_name;

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	private List<Board_FileVO> items;
	private List<Board_FileVO> items2;

	public List<Board_FileVO> getItems2() {
		return items2;
	}

	public void setItems2(List<Board_FileVO> items2) {
		this.items2 = items2;
	}

	public List<Board_FileVO> getItems() {
		return items;
	}

	public void setItems(List<Board_FileVO> items) {
		this.items = items;
	}

	public String getBd_writer() {
		return bd_writer;
	}

	public void setBd_writer(String bd_writer) {
		this.bd_writer = bd_writer;
	}

	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public String getBd_no() {
		return bd_no;
	}

	public void setBd_no(String bd_no) {
		this.bd_no = bd_no;
	}

	public String getBd_title() {
		return bd_title;
	}

	public void setBd_title(String bd_title) {
		this.bd_title = bd_title;
	}

	public String getBd_content() {
		return bd_content;
	}

	public void setBd_content(String bd_content) {
		this.bd_content = bd_content;
	}

	public String getBd_date() {
		return bd_date;
	}

	public void setBd_date(String bd_date) {
		this.bd_date = bd_date;
	}

	public String getBd_hit() {
		return bd_hit;
	}

	public void setBd_hit(String bd_hit) {
		this.bd_hit = bd_hit;
	}

	public String getBd_pass() {
		return bd_pass;
	}

	public void setBd_pass(String bd_pass) {
		this.bd_pass = bd_pass;
	}

	public String getBd_sequence() {
		return bd_sequence;
	}

	public void setBd_sequence(String bd_sequence) {
		this.bd_sequence = bd_sequence;
	}

	public String getBd_group() {
		return bd_group;
	}

	public void setBd_group(String bd_group) {
		this.bd_group = bd_group;
	}

	public String getBd_depth() {
		return bd_depth;
	}

	public void setBd_depth(String bd_depth) {
		this.bd_depth = bd_depth;
	}

	public String getBd_division() {
		return bd_division;
	}

	public void setBd_division(String bd_division) {
		this.bd_division = bd_division;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	@Override
	public String toString() {
		return "BoardVO [" + (bd_no != null ? "bd_no=" + bd_no + ", " : "")
				+ (bd_title != null ? "bd_title=" + bd_title + ", " : "")
				+ (bd_content != null ? "bd_content=" + bd_content + ", " : "")
				+ (bd_date != null ? "bd_date=" + bd_date + ", " : "")
				+ (bd_hit != null ? "bd_hit=" + bd_hit + ", " : "")
				+ (bd_pass != null ? "bd_pass=" + bd_pass + ", " : "")
				+ (bd_sequence != null ? "bd_sequence=" + bd_sequence + ", " : "")
				+ (bd_group != null ? "bd_group=" + bd_group + ", " : "")
				+ (bd_depth != null ? "bd_depth=" + bd_depth + ", " : "")
				+ (bd_division != null ? "bd_division=" + bd_division + ", " : "")
				+ (mem_no != null ? "mem_no=" + mem_no + ", " : "") + (rnum != null ? "rnum=" + rnum + ", " : "")
				+ (bd_writer != null ? "bd_writer=" + bd_writer + ", " : "")
				+ (items != null ? "items=" + items + ", " : "") + (items2 != null ? "items2=" + items2 : "") + "]";
	}
	
	
	

}
