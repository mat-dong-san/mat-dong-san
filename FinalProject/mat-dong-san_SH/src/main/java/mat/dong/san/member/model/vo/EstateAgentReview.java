package mat.dong.san.member.model.vo;

import java.sql.Date;

public class EstateAgentReview {
	private int er_id;
	private String er_content;
	private int er_point;
	private Date er_reg_d;
	private String er_del_yn;
	private String us_id;
	private int e_id;
	
	public EstateAgentReview() {}
	
	public EstateAgentReview(int er_id, String er_content, int er_point, Date er_reg_d, String er_del_yn, String us_id,
			int e_id) {
		super();
		this.er_id = er_id;
		this.er_content = er_content;
		this.er_point = er_point;
		this.er_reg_d = er_reg_d;
		this.er_del_yn = er_del_yn;
		this.us_id = us_id;
		this.e_id = e_id;
	}
	public int getEr_id() {
		return er_id;
	}
	public void setEr_id(int er_id) {
		this.er_id = er_id;
	}
	public String getEr_content() {
		return er_content;
	}
	public void setEr_content(String er_content) {
		this.er_content = er_content;
	}
	public int getEr_point() {
		return er_point;
	}
	public void setEr_point(int er_point) {
		this.er_point = er_point;
	}
	public Date getEr_reg_d() {
		return er_reg_d;
	}
	public void setEr_reg_d(Date er_reg_d) {
		this.er_reg_d = er_reg_d;
	}
	public String getEr_del_yn() {
		return er_del_yn;
	}
	public void setEr_del_yn(String er_del_yn) {
		this.er_del_yn = er_del_yn;
	}
	public String getUs_id() {
		return us_id;
	}
	public void setUs_id(String us_id) {
		this.us_id = us_id;
	}
	public int getE_id() {
		return e_id;
	}
	public void setE_id(int e_id) {
		this.e_id = e_id;
	}
	@Override
	public String toString() {
		return "EstateAgentReview [er_id=" + er_id + ", er_content=" + er_content + ", er_point=" + er_point
				+ ", er_reg_d=" + er_reg_d + ", er_del_yn=" + er_del_yn + ", us_id=" + us_id + ", e_id=" + e_id + "]";
	}
	
	
}
