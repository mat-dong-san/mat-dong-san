package com.san.dong.member.model.vo;

public class MemberSearch {
	private String us_id;
	private String searchCondition;
	private String searchValue;
	private String productSearchCondition;
	private String productSearchValue;
	private String commentSearchCondition;
	private String commentSearchValue;
	private String usedCurrentPage;
	private String usedSearchValue;
	private String oneToOneSearchCondition;
	private String oneToOneSearchValue;
	
	public MemberSearch() {
		super();
	}
	public MemberSearch(String us_id, String searchCondition, String searchValue, String productSearchCondition,
			String productSearchValue, String commentSearchCondition, String commentSearchValue, String usedCurrentPage,
			String usedSearchValue, String oneToOneSearchCondition, String oneToOneSearchValue) {
		super();
		this.us_id = us_id;
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
		this.productSearchCondition = productSearchCondition;
		this.productSearchValue = productSearchValue;
		this.commentSearchCondition = commentSearchCondition;
		this.commentSearchValue = commentSearchValue;
		this.usedCurrentPage = usedCurrentPage;
		this.usedSearchValue = usedSearchValue;
		this.oneToOneSearchCondition = oneToOneSearchCondition;
		this.oneToOneSearchValue = oneToOneSearchValue;
	}

	public String getUs_id() {
		return us_id;
	}

	public void setUs_id(String us_id) {
		this.us_id = us_id;
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

	public String getProductSearchCondition() {
		return productSearchCondition;
	}

	public void setProductSearchCondition(String productSearchCondition) {
		this.productSearchCondition = productSearchCondition;
	}

	public String getProductSearchValuee() {
		return productSearchValue;
	}

	public void setproductSearchValue(String productSearchValue) {
		this.productSearchValue = productSearchValue;
	}

	public String getCommentSearchCondition() {
		return commentSearchCondition;
	}

	public void setCommentSearchCondition(String commentSearchCondition) {
		this.commentSearchCondition = commentSearchCondition;
	}

	public String getCommentSearchValue() {
		return commentSearchValue;
	}

	public void setCommentSearchValue(String commentSearchValue) {
		this.commentSearchValue = commentSearchValue;
	}

	public String getUsedCurrentPage() {
		return usedCurrentPage;
	}

	public void setUsedCurrentPage(String usedCurrentPage) {
		this.usedCurrentPage = usedCurrentPage;
	}

	public String getUsedSearchValue() {
		return usedSearchValue;
	}

	public void setUsedSearchValue(String usedSearchValue) {
		this.usedSearchValue = usedSearchValue;
	}

	public String getOneToOneSearchCondition() {
		return oneToOneSearchCondition;
	}

	public void setOneToOneSearchCondition(String oneToOneSearchCondition) {
		this.oneToOneSearchCondition = oneToOneSearchCondition;
	}

	public String getOneToOneSearchValue() {
		return oneToOneSearchValue;
	}

	public void setOneToOneSearchValue(String oneToOneSearchValue) {
		this.oneToOneSearchValue = oneToOneSearchValue;
	}

	@Override
	public String toString() {
		return "MemberSearch [us_id=" + us_id + ", searchCondition=" + searchCondition + ", searchValue=" + searchValue
				+ ", productSearchCondition=" + productSearchCondition + ", productSearchValue=" + productSearchValue
				+ ", commentSearchCondition=" + commentSearchCondition + ", commentSearchValue=" + commentSearchValue
				+ ", usedCurrentPage=" + usedCurrentPage + ", usedSearchValue=" + usedSearchValue
				+ ", oneToOneSearchCondition=" + oneToOneSearchCondition + ", oneToOneSearchValue="
				+ oneToOneSearchValue + "]";
	}
}
