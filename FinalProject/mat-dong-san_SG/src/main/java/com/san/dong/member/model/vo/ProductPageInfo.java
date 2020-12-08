package com.san.dong.member.model.vo;

public class ProductPageInfo {
	private int currentPage; 
	private int productCurrentPage;
	private int listCount;
	private int productListCount;
	private int pageLimit;
	private int productMaxPage;
	private int startPage;
	private int productStartPage;
	private int endPage;
	private int productEndPage;
	private int memberLimit;
	
	public ProductPageInfo(){
		super();
	}
	public ProductPageInfo(int currentPage, int productCurrentPage, int listCount, int productListCount,
			int pageLimit, int productMaxPage, int startPage, int productStartPage, int endPage, int productEndPage,
			int memberLimit) {
		super();
		this.currentPage = currentPage;
		this.productCurrentPage = productCurrentPage;
		this.listCount = listCount;
		this.productListCount = productListCount;
		this.pageLimit = pageLimit;
		this.productMaxPage = productMaxPage;
		this.startPage = startPage;
		this.productStartPage = productStartPage;
		this.endPage = endPage;
		this.productEndPage = productEndPage;
		this.memberLimit = memberLimit;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getProductCurrentPage() {
		return productCurrentPage;
	}
	public void setProductCurrentPage(int productCurrentPage) {
		this.productCurrentPage = productCurrentPage;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public int getProductListCount() {
		return productListCount;
	}
	public void setProductListCount(int productListCount) {
		this.productListCount = productListCount;
	}
	public int getPageLimit() {
		return pageLimit;
	}
	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}
	public int getProductMaxPage() {
		return productMaxPage;
	}
	public void setProductMaxPage(int productMaxPage) {
		this.productMaxPage = productMaxPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getProductStartPage() {
		return productStartPage;
	}
	public void setProductStartPage(int productStartPage) {
		this.productStartPage = productStartPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getProductEndPage() {
		return productEndPage;
	}
	public void setProductEndPage(int productEndPage) {
		this.productEndPage = productEndPage;
	}
	public int getMemberLimit() {
		return memberLimit;
	}
	public void setMemberLimit(int memberLimit) {
		this.memberLimit = memberLimit;
	}
	@Override
	public String toString() {
		return "ProductCurrentPageInfo [currentPage=" + currentPage + ", productCurrentPage=" + productCurrentPage
				+ ", listCount=" + listCount + ", productListCount=" + productListCount + ", pageLimit=" + pageLimit
				+ ", productMaxPage=" + productMaxPage + ", startPage=" + startPage + ", productStartPage="
				+ productStartPage + ", endPage=" + endPage + ", productEndPage=" + productEndPage + ", memberLimit="
				+ memberLimit + "]";
	}
}
