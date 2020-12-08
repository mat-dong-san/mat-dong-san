package mat.dong.san.common;

import mat.dong.san.board.model.vo.PageInfo;

public class Pagination {
	public static PageInfo getPageInfo(int currentPage, int listCount, String type) {
		
		PageInfo pi = null;
		int pageLimit = 5;
		int maxPage;
		int startPage;
		int endPage;
<<<<<<< HEAD:FinalProject/mat-dong-san_JS/src/main/java/mat/dong/san/common/Pagination.java
		int boardLimit = 10;
=======
		int boardLimit;
		
		if(type.equals("used")) {
			boardLimit = 12;
		}else {
			boardLimit = 10;
		}
		
>>>>>>> parent of 408f50c... 오케이오케:FinalProject/mat-dong-san_CS/src/main/java/mat/dong/san/estate/common/Pagination.java
		
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
