package mat.dong.san.product.vo;

import java.sql.Date;

public class Note {
	
	private int un_id;
	private String un_content;
	private Date un_send_d;
	private String un_del_yn;
	private int p_id;
	private int pr_id;
	private int e_id;
	private String us_id;
	
	public Note(){};
	
	public Note(int un_id, String un_content, Date un_send_d, String un_del_yn, int p_id, int pr_id, int e_id,
			String us_id) {
		super();
		this.un_id = un_id;
		this.un_content = un_content;
		this.un_send_d = un_send_d;
		this.un_del_yn = un_del_yn;
		this.p_id = p_id;
		this.pr_id = pr_id;
		this.e_id = e_id;
		this.us_id = us_id;
	}

	public int getUn_id() {
		return un_id;
	}

	public void setUn_id(int un_id) {
		this.un_id = un_id;
	}

	public String getUn_content() {
		return un_content;
	}

	public void setUn_content(String un_content) {
		this.un_content = un_content;
	}

	public Date getUn_send_d() {
		return un_send_d;
	}

	public void setUn_send_d(Date un_send_d) {
		this.un_send_d = un_send_d;
	}

	public String getUn_del_yn() {
		return un_del_yn;
	}

	public void setUn_del_yn(String un_del_yn) {
		this.un_del_yn = un_del_yn;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public int getPr_id() {
		return pr_id;
	}

	public void setPr_id(int pr_id) {
		this.pr_id = pr_id;
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

	@Override
	public String toString() {
		return "Note [un_id=" + un_id + ", un_content=" + un_content + ", un_send_d=" + un_send_d + ", un_del_yn="
				+ un_del_yn + ", p_id=" + p_id + ", pr_id=" + pr_id + ", e_id=" + e_id + ", us_id=" + us_id + "]";
	}
	
	
	
	
	
	

}
