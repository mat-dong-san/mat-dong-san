package mat.dong.san.estate.vo;

import java.sql.Date;

public class Review {
	
	private int er_id;
	private String er_content;
	private int er_point;
	private Date er_reg_d;
	private String er_del_yn;
	private int e_id;
	private String us_id;
	private String us_name;
	private String us_picture;
	public Review() {
		super();
	}
	public Review(int er_id, String er_content, int er_point, Date er_reg_d, String er_del_yn, int e_id, String us_id,
			String us_name, String us_picture) {
		super();
		this.er_id = er_id;
		this.er_content = er_content;
		this.er_point = er_point;
		this.er_reg_d = er_reg_d;
		this.er_del_yn = er_del_yn;
		this.e_id = e_id;
		this.us_id = us_id;
		this.us_name = us_name;
		this.us_picture = us_picture;
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
	public int getE_id() {
		return e_id;
	}
	public void setE_id(int e_id) {
		this.e_id = e_id;
	}
	public String getUs_id() {
		return us_id;
	}
	public void setUs_id(String us_id) {
		this.us_id = us_id;
	}
	public String getUs_name() {
		return us_name;
	}
	public void setUs_name(String us_name) {
		this.us_name = us_name;
	}
	public String getUs_picture() {
		return us_picture;
	}
	public void setUs_picture(String us_picture) {
		this.us_picture = us_picture;
	}
	@Override
	public String toString() {
		return "Review [er_id=" + er_id + ", er_content=" + er_content + ", er_point=" + er_point + ", er_reg_d="
				+ er_reg_d + ", er_del_yn=" + er_del_yn + ", e_id=" + e_id + ", us_id=" + us_id + ", us_name=" + us_name
				+ ", us_picture=" + us_picture + "]";
	}
	
	

}
