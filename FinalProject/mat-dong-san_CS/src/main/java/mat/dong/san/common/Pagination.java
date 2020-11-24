package mat.dong.san.common;

import mat.dong.san.product.vo.PageInfo;

public class Pagination {
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		
		PageInfo pi = null;
		int pageLimit = 10;
		int maxPage;
		int startPage;
		int endPage;
		int boardLimit = 5;
		
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
