package mat.dong.san.member.model.vo;

import java.sql.Date;

public class Member {
	private String us_id;
	private String us_pwd;
	private String us_name;
	private String us_ssn;
	private String us_phone;
	private String us_email;
	private String us_addr;
	private String us_picture;
	private String us_type;
	private Date us_reg_d;
	private String us_kakao;
	private String us_del_yn;
	
	public Member() {}

	public Member(String us_id, String us_pwd, String us_name, String us_ssn, String us_phone, String us_email,
			String us_addr, String us_picture, String us_type, Date us_reg_d, String us_kakao, String us_del_yn) {
		super();
		this.us_id = us_id;
		this.us_pwd = us_pwd;
		this.us_name = us_name;
		this.us_ssn = us_ssn;
		this.us_phone = us_phone;
		this.us_email = us_email;
		this.us_addr = us_addr;
		this.us_picture = us_picture;
		this.us_type = us_type;
		this.us_reg_d = us_reg_d;
		this.us_kakao = us_kakao;
		this.us_del_yn = us_del_yn;
	}

	public String getUs_id() {
		return us_id;
	}

	public void setUs_id(String us_id) {
		this.us_id = us_id;
	}

	public String getUs_pwd() {
		return us_pwd;
	}

	public void setUs_pwd(String us_pwd) {
		this.us_pwd = us_pwd;
	}

	public String getUs_name() {
		return us_name;
	}

	public void setUs_name(String us_name) {
		this.us_name = us_name;
	}

	public String getUs_ssn() {
		return us_ssn;
	}

	public void setUs_ssn(String us_ssn) {
		this.us_ssn = us_ssn;
	}

	public String getUs_phone() {
		return us_phone;
	}

	public void setUs_phone(String us_phone) {
		this.us_phone = us_phone;
	}

	public String getUs_email() {
		return us_email;
	}

	public void setUs_email(String us_email) {
		this.us_email = us_email;
	}

	public String getUs_addr() {
		return us_addr;
	}

	public void setUs_addr(String us_addr) {
		this.us_addr = us_addr;
	}

	public String getUs_picture() {
		return us_picture;
	}

	public void setUs_picture(String us_picture) {
		this.us_picture = us_picture;
	}

	public String getUs_type() {
		return us_type;
	}

	public void setUs_type(String us_type) {
		this.us_type = us_type;
	}

	public Date getUs_reg_d() {
		return us_reg_d;
	}

	public void setUs_reg_d(Date us_reg_d) {
		this.us_reg_d = us_reg_d;
	}

	public String getUs_kakao() {
		return us_kakao;
	}

	public void setUs_kakao(String us_kakao) {
		this.us_kakao = us_kakao;
	}

	public String getUs_del_yn() {
		return us_del_yn;
	}

	public void setUs_del_yn(String us_del_yn) {
		this.us_del_yn = us_del_yn;
	}

	@Override
	public String toString() {
		return "Member [us_id=" + us_id + ", us_pwd=" + us_pwd + ", us_name=" + us_name + ", us_ssn=" + us_ssn
				+ ", us_phone=" + us_phone + ", us_email=" + us_email + ", us_addr=" + us_addr + ", us_picture="
				+ us_picture + ", us_type=" + us_type + ", us_reg_d=" + us_reg_d + ", us_kakao=" + us_kakao
				+ ", us_del_yn=" + us_del_yn + "]";
	}

	
}
