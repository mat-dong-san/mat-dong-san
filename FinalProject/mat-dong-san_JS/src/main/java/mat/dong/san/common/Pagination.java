package mat.dong.san.common;

import mat.dong.san.board.model.vo.PageInfo;

public class Pagination {
	public static PageInfo getPageInfo(int currentPage, int listCount, String type) {
		
		PageInfo pi = null;
		int pageLimit = 5;
		int maxPage;
		int startPage;
		int endPage;
		int boardLimit;
		
		if(type.equals("used")) {
			boardLimit = 12;
		}else {
			boardLimit = 10;
		}
		
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit + 0.9);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		return pi;
	}
	
}
