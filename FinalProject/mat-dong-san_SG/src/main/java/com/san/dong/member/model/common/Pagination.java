package com.san.dong.member.model.common;

import com.san.dong.member.model.vo.MemberPageInfo;

public class Pagination {
	public static MemberPageInfo getPageInfo(int currentPage, int listCount) {
		
		MemberPageInfo pi = null;
		int pageLimit = 10;
		int maxPage;
		int startPage;
		int endPage; 
		int memberLimit = 5;
		
		maxPage = (int)Math.ceil((double)listCount/memberLimit + 0.9); 
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1; 
		endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new MemberPageInfo(currentPage,listCount,pageLimit, maxPage,startPage, endPage, memberLimit);
		
		return pi;
	}
	
//	public static MemberPageInfo productGetPageInfo(int productCurrentPage, int listCount) {
//		
//		MemberPageInfo pi = null;
//		int pageLimit = 10;
//		int productMaxPage;
//		int productStartPage;
//		int productEndPage;
//		int boardLimit = 5;
//		
//		productMaxPage = (int)Math.ceil((double)listCount/boardLimit + 0.9);
//		productStartPage = (productCurrentPage - 1) / pageLimit * pageLimit + 1;
//		productEndPage = productStartPage + pageLimit - 1;
//		if(productMaxPage < productEndPage) {
//			productEndPage = productMaxPage;
//		}
//		
//		pi = new MemberPageInfo(1,productCurrentPage,1,1,1, listCount, pageLimit, productMaxPage, productStartPage, productEndPage, boardLimit);
//		
//		return pi;
//	}
//	
//	public static MemberPageInfo commentGetPageInfo(int commentCurrentPage, int listCount) {
//		
//		MemberPageInfo pi = null;
//		int pageLimit = 10;
//		int maxPage;
//		int startPage;
//		int endPage;
//		int boardLimit = 5;
//		
//		maxPage = (int)Math.ceil((double)listCount/boardLimit + 0.9);
//		startPage = (commentCurrentPage - 1) / pageLimit * pageLimit + 1;
//		endPage = startPage + pageLimit - 1;
//		if(maxPage < endPage) {
//			endPage = maxPage;
//		}
//		
//		pi = new MemberPageInfo(1,1,commentCurrentPage,1,1, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
//		
//		return pi;
//	}
//	
//	public static MemberPageInfo usedGetPageInfo(int usedCurrentPage, int listCount) {
//		
//		MemberPageInfo pi = null;
//		int pageLimit = 10;
//		int maxPage;
//		int startPage;
//		int endPage;
//		int boardLimit = 5;
//		
//		maxPage = (int)Math.ceil((double)listCount/boardLimit + 0.9);
//		startPage = (usedCurrentPage - 1) / pageLimit * pageLimit + 1;
//		endPage = startPage + pageLimit - 1;
//		if(maxPage < endPage) {
//			endPage = maxPage;
//		}
//		
//		pi = new MemberPageInfo(1,1,1,usedCurrentPage,1, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
//		
//		return pi;
//	}
//	
//	public static MemberPageInfo oneToOnegetPageInfo(int oneToOneCurrentPage, int listCount) {
//		
//		MemberPageInfo pi = null;
//		int pageLimit = 10;
//		int maxPage;
//		int startPage;
//		int endPage;
//		int boardLimit = 5;
//		
//		maxPage = (int)Math.ceil((double)listCount/boardLimit + 0.9);
//		startPage = (oneToOneCurrentPage - 1) / pageLimit * pageLimit + 1;
//		endPage = startPage + pageLimit - 1;
//		if(maxPage < endPage) {
//			endPage = maxPage;
//		}
//		
//		pi = new MemberPageInfo(1,1,1,1,oneToOneCurrentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
//		
//		return pi;
//	}
}
