package mat.dong.san.estate.vo;

public class SearchCondition {
	private String us_name;
	private String p_id;
	private String p_field;
	private String p_kind;
	
	
	public SearchCondition() {
		super();
	}
	
	public SearchCondition(String p_id, String p_field, String p_kind) {
		super();
		this.p_id = p_id;
		this.p_field = p_field;
		this.p_kind = p_kind;
	}

	public SearchCondition(String us_name, String p_id) {
		super();
		this.us_name = us_name;
		this.p_id = p_id;
	}
	public String getUs_name() {
		return us_name;
	}
	public void setUs_name(String us_name) {
		this.us_name = us_name;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	
	public String getP_field() {
		return p_field;
	}

	public void setP_field(String p_field) {
		this.p_field = p_field;
	}

	public String getP_kind() {
		return p_kind;
	}

	public void setP_kind(String p_kind) {
		this.p_kind = p_kind;
	}

	@Override
	public String toString() {
		return "SearchCondition [us_name=" + us_name + ", p_id=" + p_id + ", p_field=" + p_field + ", p_kind=" + p_kind
				+ "]";
	}

	
	
	
	
	
	
	
	
	

}
