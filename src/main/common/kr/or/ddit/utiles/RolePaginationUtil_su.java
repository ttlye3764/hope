package kr.or.ddit.utiles;

import javax.servlet.http.HttpServletRequest;

public class RolePaginationUtil_su {
	private int currentPage; 		// 현재 페이지
	private int totalCount;			// 전체 게시글 갯수
	private int totalPage;			// 전체 페이지 갯수
	private int blockCount = 12;    // 페이지별 출력될 게시글 갯수
	private int blockPage = 5;		// 페이지네이션 메뉴 갯수
	private int startPage;			// 페이지네이션 메뉴 시작 페이지 번호
	private int endPage;			// 페이지네이션 메뉴 끝 페이지 번호
	private int startCount;			// 해당 페이지 내 게시글 시작번호
	private int endCount;			// 해당 페이지 내 게시글 끝번호
	private HttpServletRequest request;
	private StringBuffer pagingHtmls;
	private String choose;
	private String choose2;
	
	// choose => 카테고리값 쿼리스트링으로 넘김
	public void RolePaginationUtil(HttpServletRequest request,
							  int currentPage,
							  int totalCount,
							  String choose,
							  String choose2){
		this.request = request;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.choose = choose;
		this.choose2 = choose2;
		
		
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
			String lo = "<li class=\"page-item\"><a class=\"page-link\" href='" + requestURI + "?currentPage="+ (this.currentPage -1);
			
			if(choose == null && choose2 == null) {
				lo += "'>Prev</a></li>";
			} else if(choose == null || choose2 == null) {
				if (choose == null) {
					lo += "&choose2=" + choose2 +"'>Prev</a></li>";
				} else if(choose2 == null) {
					lo += "&choose=" + choose +"'>Prev</a></li>";
				} 
			}
			else {
				lo += "&choose=" + choose + "&choose2=" + choose2 +"'>Prev</a></li>";
			}
			
			this.pagingHtmls.append(lo);
//			this.pagingHtmls.append("<li class=\\\"page-item disabled\\\"><a class=\"page-link\" href='" + requestURI + "?currentPage="+ (this.currentPage -1) +"&choose=" + choose +"'>Prev</a></li>");
		}
		//|1|2|3|4|5|
		for(int i=this.startPage; i<=this.endPage; i++){
			if(this.currentPage == i){
				this.pagingHtmls.append("<li class=\"page-item active\"><a class=\"page-link\" href='#'>"+ i +"</a></li>");
			}else{
				String lo = "<li class=\"page-item\"><a class=\"page-link\" href='" + requestURI + "?currentPage="+ i;
				
				if(choose == null && choose2 == null) {
					lo += "'>"+ i +"</a></li>";
				} else if(choose == null || choose2 == null) {
					if (choose == null) {
						lo += "&choose2=" + choose2 +"'>"+ i +"</a></li>";
					} else if(choose2 == null) {
						lo += "&choose=" + choose +"'>"+ i +"</a></li>";
					} 
				}
				else {
					lo += "&choose=" + choose + "&choose2=" + choose2 +"'>"+ i +"</a></li>";
				}
				
				this.pagingHtmls.append(lo);
//				this.pagingHtmls.append("<li class=\"page-item\"><a class=\"page-link\" href='" + requestURI + "?currentPage="+ i +"&choose=" + choose+"'>"+ i +"</a></li>");

			}
		}
		// 다음
		if(this.currentPage < this.totalPage){
			this.pagingHtmls.append("<li class=\\\"page-item\\\"><a class=\"page-link\" href=" + requestURI  +"?currentPage=" + (this.currentPage +1) +">Next</a> </li>");
		}else{
			String lo = "<li class=\"page-item\"><a class=\"page-link\" href='" + requestURI + "?currentPage="+ (this.currentPage +1);
			
			if(choose == null && choose2 == null) {
				lo += "'>Next</a></li>";
			} else if(choose == null || choose2 == null) {
				if (choose == null) {
					lo += "&choose2=" + choose2 +"'>Next</a></li>";
				} else if(choose2 == null) {
					lo += "&choose=" + choose +"'>Next</a></li>";
				} 
			}
			else {
				lo += "&choose=" + choose + "&choose2=" + choose2 +"'>Next</a></li>";
			}
			this.pagingHtmls.append(lo);
//			this.pagingHtmls.append("<li class=\"page-item\"><a class=\"page-link\" href='" + requestURI + "?currentPage="+ (this.currentPage +1) +"&choose=" + choose +"'>Next</a></li>");
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
