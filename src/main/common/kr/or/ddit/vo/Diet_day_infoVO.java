package kr.or.ddit.vo;

public class Diet_day_infoVO {
	
	private String dd_no;
	private String menu_no;
	private String dd_info_division;
	private String menu_name;
	private String menu_kcal;
	
	
	
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_kcal() {
		return menu_kcal;
	}
	public void setMenu_kcal(String menu_kcal) {
		this.menu_kcal = menu_kcal;
	}
	public String getDd_no() {
		return dd_no;
	}
	public void setDd_no(String dd_no) {
		this.dd_no = dd_no;
	}
	public String getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(String menu_no) {
		this.menu_no = menu_no;
	}
	public String getDd_info_division() {
		return dd_info_division;
	}
	public void setDd_info_division(String dd_info_division) {
		this.dd_info_division = dd_info_division;
	}
	
	
}
