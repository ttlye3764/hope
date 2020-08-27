package kr.or.ddit.vo;

import java.util.List;

public class HealthImageVO {

	private String healthImage_no; // 헬스 번호
	private String healthImage_title; // 헬스 제목
	private String healthImage_content; // 헬스 내용
	private String healthImage_age; // 헬스 추천 나이
	private String healthImage_diet; // 헬스 운동법(유,무산소)
	private String healthImage_tiem; // 헬스 시간
	private int rnum; // 순서
	private String mem_no; // 멤버 번호
	private List<HealthFileVO> items; // 이미지 리스트

	
	public String getHealthImage_age() {
		return healthImage_age;
	}

	public void setHealthImage_age(String healthImage_age) {
		this.healthImage_age = healthImage_age;
	}

	public String getHealthImage_diet() {
		return healthImage_diet;
	}

	public void setHealthImage_diet(String healthImage_diet) {
		this.healthImage_diet = healthImage_diet;
	}

	public String getHealthImage_tiem() {
		return healthImage_tiem;
	}

	public void setHealthImage_tiem(String healthImage_tiem) {
		this.healthImage_tiem = healthImage_tiem;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public List<HealthFileVO> getItems() {
		return items;
	}

	public void setItems(List<HealthFileVO> items) {
		this.items = items;
	}

	public String getHealthImage_no() {
		return healthImage_no;
	}

	public void setHealthImage_no(String healthImage_no) {
		this.healthImage_no = healthImage_no;
	}

	public String getHealthImage_title() {
		return healthImage_title;
	}

	public void setHealthImage_title(String healthImage_title) {
		this.healthImage_title = healthImage_title;
	}

	public String getHealthImage_content() {
		return healthImage_content;
	}

	public void setHealthImage_content(String healthImage_content) {
		this.healthImage_content = healthImage_content;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

}
