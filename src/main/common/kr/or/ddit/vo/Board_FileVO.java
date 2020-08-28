package kr.or.ddit.vo;

import java.util.List;

public class Board_FileVO {
	private String file_no;          //파일번호
	private String file_bd_no;       //글번호
	private String file_name;     // 파일이름
	private String file_save_name;// 파일저장이름
	private String file_type;     // 파일타입
	private String file_size;     // 파일크기

	public String getFile_no() {
		return file_no;
	}
	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}
	public String getFile_bd_no() {
		return file_bd_no;
	}
	public void setFile_bd_no(String file_bd_no) {
		this.file_bd_no = file_bd_no;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_save_name() {
		return file_save_name;
	}
	public void setFile_save_name(String file_save_name) {
		this.file_save_name = file_save_name;
	}
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}
	public String getFile_size() {
		return file_size;
	}
	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}
	
	
}
