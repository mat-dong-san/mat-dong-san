package com.san.dong.member.model.vo;

public class commentSearch {
	
	private String us_id;
	private String commentSearchCondition;
	private String commentSearchValue;
	
	public commentSearch() {
		super();
	}

	public commentSearch(String us_id, String commentSearchCondition, String commentSearchValue) {
		super();
		this.us_id = us_id;
		this.commentSearchCondition = commentSearchCondition;
		this.commentSearchValue = commentSearchValue;
	}

	public String getUs_id() {
		return us_id;
	}

	public void setUs_id(String us_id) {
		this.us_id = us_id;
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

	@Override
	public String toString() {
		return "commentSearch [us_id=" + us_id + ", commentSearchCondition=" + commentSearchCondition
				+ ", commentSearchValue=" + commentSearchValue + "]";
	}
}
