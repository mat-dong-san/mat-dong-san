package com.san.dong.member.model.vo;

public class MemberPageInfo {
//	private int currentPage; 
//	private int commentCurrentPage; private int usedCurrentPage; private int oneToOneCurrentPage;
//	private int listCount;
//	private int commentListCount; private int usedListCount; private int oneToOneListCount;
//	private int pageLimit;
//	private int maxPage;
//	private int commentMaxPage; private int usedMaxPage; private int oneToOneMaxPage;
//	private int startPage;
//	private int commentStartPage; private int usedStartPage; private int oneToOneStartPage;
//	private int endPage;
//	private int commenEndPage; private int usedEndPage; private int oneToOneEndPage;
//	private int memberLimit;
	
	private int currentPage; 
	private int listCount;
	private int pageLimit;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int memberLimit;
	
	public MemberPageInfo(int currentPage, int listCount, int pageLimit, int maxPage, int startPage, int endPage,
			int memberLimit) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.memberLimit = memberLimit;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getMemberLimit() {
		return memberLimit;
	}

	public void setMemberLimit(int memberLimit) {
		this.memberLimit = memberLimit;
	}

	@Override
	public String toString() {
		return "MemberPageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", pageLimit=" + pageLimit
				+ ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage=" + endPage + ", memberLimit="
				+ memberLimit + "]";
	}

}
