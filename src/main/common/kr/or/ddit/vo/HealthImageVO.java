package kr.or.ddit.vo;

import java.util.List;

public class HealthImageVO {

	private String healthImage_no; // 헬스 번호
	private String healthImage_title; // 헬스 제목
	private String healthImage_content; // 헬스 내용
	private String healthImage_category; // 헬스 카테고리
	private String healthImage_age; // 헬스 추천 나이
	private String healthImage_diet; // 헬스 운동법(유,무산소)
	private String healthImage_time; // 헬스 시간
	private String healthImage_difficulty; // 헬스 난이도
	private int rnum; // 순서
	private String mem_no; // 멤버 번호
	private List<HealthFileVO> items; // 이미지 리스트

	public String getHealthImage_category() {
		return healthImage_category;
	}

	public void setHealthImage_category(String healthImage_category) {
		this.healthImage_category = healthImage_category;
	}

	public String getHealthImage_difficulty() {
		return healthImage_difficulty;
	}

	public void setHealthImage_difficulty(String healthImage_difficulty) {
		this.healthImage_difficulty = healthImage_difficulty;
	}

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

	public String getHealthImage_time() {
		return healthImage_time;
	}

	public void setHealthImage_time(String healthImage_time) {
		this.healthImage_time = healthImage_time;
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
