package com.san.dong.productApplication.model.vo;

public class ProductApplicationSearch {
	
	private int e_id;
	private String searchCondition;
	private String searchValue;
	
	public ProductApplicationSearch() {
		super();
	}
	public ProductApplicationSearch(int e_id, String searchCondition, String searchValue) {
		super();
		this.e_id = e_id;
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
	}
	public int getE_id() {
		return e_id;
	}
	public void setE_id(int e_id) {
		this.e_id = e_id;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	@Override
	public String toString() {
		return "ProductApplicationSearch [e_id=" + e_id + ", searchCondition=" + searchCondition + ", searchValue="
				+ searchValue + "]";
	}
}
