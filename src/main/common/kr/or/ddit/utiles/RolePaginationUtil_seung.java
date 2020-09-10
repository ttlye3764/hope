package kr.or.ddit.utiles;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;


public class RolePaginationUtil_seung {
	private int currentPage; 		// 현재 페이지
	private int totalCount;			// 전체 게시글 갯수
	private int totalPage;			// 전체 페이지 갯수
	private int blockCount = 10;    // 페이지별 출력될 게시글 갯수
	private int blockPage = 5;		// 페이지네이션 메뉴 갯수
	private int startPage;			// 페이지네이션 메뉴 시작 페이지 번호
	private int endPage;			// 페이지네이션 메뉴 끝 페이지 번호
	private int startCount;			// 해당 페이지 내 게시글 시작번호
	private int endCount;			// 해당 페이지 내 게시글 끝번호
	private String search_keycode;
	private String search_keyword;
	private HttpServletRequest request;
	private StringBuffer pagingHtmls;
	
	public void RolePaginationUtil(HttpServletRequest request,
							  int currentPage,
							  int totalCount,
							  String search_keycode,
							  String search_keyword){
		this.request = request;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.search_keycode = search_keycode;
		this.search_keyword = search_keyword;
		if(search_keycode == null) {
			this.search_keycode = "TOTAL";
		}
		if(search_keyword == null) {
			this.search_keyword = "";
		}
		
		pagingHtmls = new StringBuffer();
		
		makePagination();
	}

	private void makePagination() {
		// 전체 페이지 갯수
		this.totalPage = (int)Math.ceil(this.totalCount / (double)this.blockCount);
		if(this.totalPage == 0){
			this.totalPage = 1;
		}
		
		// 해당 페이지 내 게시글 시작 번호, 끝번호
		this.startCount = this.totalCount - (this.currentPage - 1) * this.blockCount;
		this.endCount = this.startCount - this.blockCount + 1;
		if(this.endCount < 0){
			this.endCount = 1;
		}
		
		// 페이지 별 페이지네이션 메뉴 시작 페이지 번호 , 끝 페이지 번호 
		// 이전|1|2|3|4|5|다음
		// 이전 |6|7|8|9|10|다음
		this.startPage = ((this.currentPage -1) / this.blockPage * this.blockPage)+1;
		this.endPage = this.startPage + this.blockPage -1;
		if(this.endPage > this.totalPage){
			this.endPage = this.totalPage;
		}
		this.pagingHtmls.append("<section class=\"pt-0\">");
		this.pagingHtmls.append("<div class=\"container\">");
		this.pagingHtmls.append("<div class=\"row justify-content-center\">");
		this.pagingHtmls.append("<div class=\"col-md-8\">");
		this.pagingHtmls.append("<nav>");
		this.pagingHtmls.append("<ul class=\"pagination justify-content-center\">");
		
		String requestURI = request.getRequestURI();
		System.out.println(requestURI);
		// 이전|1|2|3|4|5|다음
		// 이전
		if((this.currentPage - 1) == 0){
			this.pagingHtmls.append("<li class=\"page-item disabled\"> <span class=\"page-link\">Prev</span> </li>");
		}else{
			this.pagingHtmls.append("<li class=\\\"page-item disabled\\\"><a class=\"page-link\" href='" + requestURI + "?currentPage="+ (this.currentPage -1) + "&search_keyword=" + search_keyword + "&search_keycode=" + search_keycode + "'>Prev</a></li>");
		}
		//|1|2|3|4|5|
		for(int i=this.startPage; i<=this.endPage; i++){
			if(this.currentPage == i){
				this.pagingHtmls.append("<li class=\"page-item active\"><a class=\"page-link\" href='#'>"+ i +"</a></li>");
			}else{
				this.pagingHtmls.append("<li class=\"page-item\"><a class=\"page-link\" href='" + requestURI + "?currentPage="+ i +"&search_keyword=" + search_keyword + "&search_keycode=" + search_keycode + "'>"+ i +"</a></li>");
			}
		}
		// 다음
		if(this.currentPage < this.totalPage){
			this.pagingHtmls.append("<li class=\"page-item\"><a class=\"page-link\" href='" + requestURI + "?currentPage="+ (this.currentPage +1) + "&search_keyword=" + search_keyword + "&search_keycode=" + search_keycode + "'>Next</a></li>");
		}else{
			this.pagingHtmls.append("<li class=\"page-item disabled\"> <span class=\"page-link\">Next</span> </li>");
		}
		this.pagingHtmls.append("</ul>");
		this.pagingHtmls.append("</nav>");
		this.pagingHtmls.append("</div>");
		this.pagingHtmls.append("</div>");
		this.pagingHtmls.append("</div>");
		this.pagingHtmls.append("</section>");
	}

	public int getStartCount() {
		return startCount;
	}

	public int getEndCount() {
		return endCount;
	}

	public String getPagingHtmls() {
		return pagingHtmls.toString();
	}

}
