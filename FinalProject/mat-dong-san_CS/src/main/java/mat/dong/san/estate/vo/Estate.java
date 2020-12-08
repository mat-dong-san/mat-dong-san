package mat.dong.san.estate.vo;

import java.sql.Date;

public class Estate {
	private int e_id;
	private String e_name;
	private String e_phone;
	private String e_content;
	private String e_addr;
	private String e_picture;
	private String e_field;
	private String e_reg_num;
	private String e_coord;
	private String e_c_lat;
	private String e_c_lng;
	private String e_point;
	private Date e_reg_d;
	private String e_del_yn;
	private String us_id;
	
	public Estate() {
		
	}
	
	public Estate(int e_id, String e_name, String e_phone, String e_content, String e_addr, String e_picture,
			String e_field, String e_reg_num, String e_coord, String e_c_lat, String e_c_lng, String e_point,
			Date e_reg_d, String e_del_yn, String us_id) {
		super();
		this.e_id = e_id;
		this.e_name = e_name;
		this.e_phone = e_phone;
		this.e_content = e_content;
		this.e_addr = e_addr;
		this.e_picture = e_picture;
		this.e_field = e_field;
		this.e_reg_num = e_reg_num;
		this.e_coord = e_coord;
		this.e_c_lat = e_c_lat;
		this.e_c_lng = e_c_lng;
		this.e_point = e_point;
		this.e_reg_d = e_reg_d;
		this.e_del_yn = e_del_yn;
		this.us_id = us_id;
	}
	
	public Estate(String e_name, String e_phone, String e_content, String e_addr, String e_picture, String e_field,
			String e_reg_num, String us_id) {
		super();
		this.e_name = e_name;
		this.e_phone = e_phone;
		this.e_content = e_content;
		this.e_addr = e_addr;
		this.e_picture = e_picture;
		this.e_field = e_field;
		this.e_reg_num = e_reg_num;
		this.us_id = us_id;
	}
	
	
	
	public Estate(String e_name, String e_phone, String e_content, String e_reg_num, String us_id) {
		super();
		this.e_name = e_name;
		this.e_phone = e_phone;
		this.e_content = e_content;
		this.e_reg_num = e_reg_num;
		this.us_id = us_id;
	}



	
	public int getE_id() {
		return e_id;
	}
	public void setE_id(int e_id) {
		this.e_id = e_id;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getE_phone() {
		return e_phone;
	}
	public void setE_phone(String e_phone) {
		this.e_phone = e_phone;
	}
	public String getE_content() {
		return e_content;
	}
	public void setE_content(String e_content) {
		this.e_content = e_content;
	}
	public String getE_addr() {
		return e_addr;
	}
	public void setE_addr(String e_addr) {
		this.e_addr = e_addr;
	}
	public String getE_picture() {
		return e_picture;
	}
	public void setE_picture(String e_picture) {
		this.e_picture = e_picture;
	}
	public String getE_field() {
		return e_field;
	}
	public void setE_field(String e_field) {
		this.e_field = e_field;
	}
	public String getE_reg_num() {
		return e_reg_num;
	}
	public void setE_reg_num(String e_reg_num) {
		this.e_reg_num = e_reg_num;
	}
	public String getE_coord() {
		return e_coord;
	}
	public void setE_coord(String e_coord) {
		this.e_coord = e_coord;
	}
	public String getE_c_lat() {
		return e_c_lat;
	}
	public void setE_c_lat(String e_c_lat) {
		this.e_c_lat = e_c_lat;
	}
	public String getE_c_lng() {
		return e_c_lng;
	}
	public void setE_c_lng(String e_c_lng) {
		this.e_c_lng = e_c_lng;
	}
	public String getE_point() {
		return e_point;
	}
	public void setE_point(String e_point) {
		this.e_point = e_point;
	}
	public Date getE_reg_d() {
		return e_reg_d;
	}
	public void setE_reg_d(Date e_reg_d) {
		this.e_reg_d = e_reg_d;
	}
	public String getE_del_yn() {
		return e_del_yn;
	}
	public void setE_del_yn(String e_del_yn) {
		this.e_del_yn = e_del_yn;
	}
	public String getUs_id() {
		return us_id;
	}
	public void setUs_id(String us_id) {
		this.us_id = us_id;
	}
	@Override
	public String toString() {
		return "EstateAgent [e_id=" + e_id + ", e_name=" + e_name + ", e_phone=" + e_phone + ", e_content=" + e_content
				+ ", e_addr=" + e_addr + ", e_picture=" + e_picture + ", e_field=" + e_field + ", e_reg_num="
				+ e_reg_num + ", e_coord=" + e_coord + ", e_c_lat=" + e_c_lat + ", e_c_lng=" + e_c_lng + ", e_point="
				+ e_point + ", e_reg_d=" + e_reg_d + ", e_del_yn=" + e_del_yn + ", us_id=" + us_id + "]";
	}
	
	
}
