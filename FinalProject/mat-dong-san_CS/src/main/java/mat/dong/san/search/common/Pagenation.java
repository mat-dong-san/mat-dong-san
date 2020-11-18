package mat.dong.san.search.common;

import mat.dong.san.search.vo.SearchRoomPageInfo;

public class Pagenation {
	public static SearchRoomPageInfo getPageInfo(int currentPage, int listCount) {
		
		SearchRoomPageInfo spi = null;
		
		int pageLimit = 5;
		int maxPage;
		int startPage;
		int endPage;
		int productLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/productLimit);
		startPage = (currentPage - 1)/pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		spi = new SearchRoomPageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, productLimit);
		
		return spi;
	}
}
