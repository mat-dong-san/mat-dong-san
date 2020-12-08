package com.san.dong.productApplication.model.vo;

import java.sql.Date;

public class ProductApplication {
   
   private int a_id;
   private String a_status;
   private Date a_date;
   private int p_id;
   private int pr_id;
   private int e_id;
   private String p_addr;
   private String p_field;
   private String p_floor;
   private String p_size;
   private String p_str;
   private String p_kind;
   private String p_room;
   private String p_s_size;
   private String p_d_size;
   private String p_layer;
   private String p_deal;
   private String p_charter;
   private String p_rent;
   private String p_deposit;
   private String p_cost;
   private String p_cost_item;
   private Date p_en_d;
   private String p_content;
   private String p_heat;
   private String p_dir;
   private String p_park;
   private String p_elevator;
   private String p_verandar;
   private String p_pet;
   private String p_built_in;
   private String p_loan;
   private String p_option;
   private String p_picture;
   private Date p_reg_d;
   private String p_reg_status;
   private String p_del_yn;
   private String us_id;
   private String us_name;
   private String us_phone;
   private String us_email;
   private String us_picture;
   
   public ProductApplication() {
      super();
   }

   public ProductApplication(int a_id, String a_status, Date a_date, int p_id, int pr_id, int e_id, String p_addr,
         String p_field, String p_floor, String p_size, String p_str, String p_kind, String p_room, String p_s_size,
         String p_d_size, String p_layer, String p_deal, String p_charter, String p_rent, String p_deposit,
         String p_cost, String p_cost_item, Date p_en_d, String p_content, String p_heat, String p_dir,
         String p_park, String p_elevator, String p_verandar, String p_pet, String p_built_in, String p_loan,
         String p_option, String p_picture, Date p_reg_d, String p_reg_status, String p_del_yn, String us_id,
         String us_name, String us_phone, String us_email, String us_picture) {
      super();
      this.a_id = a_id;
      this.a_status = a_status;
      this.a_date = a_date;
      this.p_id = p_id;
      this.pr_id = pr_id;
      this.e_id = e_id;
      this.p_addr = p_addr;
      this.p_field = p_field;
      this.p_floor = p_floor;
      this.p_size = p_size;
      this.p_str = p_str;
      this.p_kind = p_kind;
      this.p_room = p_room;
      this.p_s_size = p_s_size;
      this.p_d_size = p_d_size;
      this.p_layer = p_layer;
      this.p_deal = p_deal;
      this.p_charter = p_charter;
      this.p_rent = p_rent;
      this.p_deposit = p_deposit;
      this.p_cost = p_cost;
      this.p_cost_item = p_cost_item;
      this.p_en_d = p_en_d;
      this.p_content = p_content;
      this.p_heat = p_heat;
      this.p_dir = p_dir;
      this.p_park = p_park;
      this.p_elevator = p_elevator;
      this.p_verandar = p_verandar;
      this.p_pet = p_pet;
      this.p_built_in = p_built_in;
      this.p_loan = p_loan;
      this.p_option = p_option;
      this.p_picture = p_picture;
      this.p_reg_d = p_reg_d;
      this.p_reg_status = p_reg_status;
      this.p_del_yn = p_del_yn;
      this.us_id = us_id;
      this.us_name = us_name;
      this.us_phone = us_phone;
      this.us_email = us_email;
      this.us_picture = us_picture;
   }

   public int getA_id() {
      return a_id;
   }

   public void setA_id(int a_id) {
      this.a_id = a_id;
   }

   public String getA_status() {
      return a_status;
   }

   public void setA_status(String a_status) {
      this.a_status = a_status;
   }

   public Date getA_date() {
      return a_date;
   }

   public void setA_date(Date a_date) {
      this.a_date = a_date;
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

   public String getP_addr() {
      return p_addr;
   }

   public void setP_addr(String p_addr) {
      this.p_addr = p_addr;
   }

   public String getP_field() {
      return p_field;
   }

   public void setP_field(String p_field) {
      this.p_field = p_field;
   }

   public String getP_floor() {
      return p_floor;
   }

   public void setP_floor(String p_floor) {
      this.p_floor = p_floor;
   }

   public String getP_size() {
      return p_size;
   }

   public void setP_size(String p_size) {
      this.p_size = p_size;
   }

   public String getP_str() {
      return p_str;
   }

   public void setP_str(String p_str) {
      this.p_str = p_str;
   }

   public String getP_kind() {
      return p_kind;
   }

   public void setP_kind(String p_kind) {
      this.p_kind = p_kind;
   }

   public String getP_room() {
      return p_room;
   }

   public void setP_room(String p_room) {
      this.p_room = p_room;
   }

   public String getP_s_size() {
      return p_s_size;
   }

   public void setP_s_size(String p_s_size) {
      this.p_s_size = p_s_size;
   }

   public String getP_d_size() {
      return p_d_size;
   }

   public void setP_d_size(String p_d_size) {
      this.p_d_size = p_d_size;
   }

   public String getP_layer() {
      return p_layer;
   }

   public void setP_layer(String p_layer) {
      this.p_layer = p_layer;
   }

   public String getP_deal() {
      return p_deal;
   }

   public void setP_deal(String p_deal) {
      this.p_deal = p_deal;
   }

   public String getP_charter() {
      return p_charter;
   }

   public void setP_charter(String p_charter) {
      this.p_charter = p_charter;
   }

   public String getP_rent() {
      return p_rent;
   }

   public void setP_rent(String p_rent) {
      this.p_rent = p_rent;
   }

   public String getP_deposit() {
      return p_deposit;
   }

   public void setP_deposit(String p_deposit) {
      this.p_deposit = p_deposit;
   }

   public String getP_cost() {
      return p_cost;
   }

   public void setP_cost(String p_cost) {
      this.p_cost = p_cost;
   }

   public String getP_cost_item() {
      return p_cost_item;
   }

   public void setP_cost_item(String p_cost_item) {
      this.p_cost_item = p_cost_item;
   }

   public Date getP_en_d() {
      return p_en_d;
   }

   public void setP_en_d(Date p_en_d) {
      this.p_en_d = p_en_d;
   }

   public String getP_content() {
      return p_content;
   }

   public void setP_content(String p_content) {
      this.p_content = p_content;
   }

   public String getP_heat() {
      return p_heat;
   }

   public void setP_heat(String p_heat) {
      this.p_heat = p_heat;
   }

   public String getP_dir() {
      return p_dir;
   }

   public void setP_dir(String p_dir) {
      this.p_dir = p_dir;
   }

   public String getP_park() {
      return p_park;
   }

   public void setP_park(String p_park) {
      this.p_park = p_park;
   }

   public String getP_elevator() {
      return p_elevator;
   }

   public void setP_elevator(String p_elevator) {
      this.p_elevator = p_elevator;
   }

   public String getP_verandar() {
      return p_verandar;
   }

   public void setP_verandar(String p_verandar) {
      this.p_verandar = p_verandar;
   }

   public String getP_pet() {
      return p_pet;
   }

   public void setP_pet(String p_pet) {
      this.p_pet = p_pet;
   }

   public String getP_built_in() {
      return p_built_in;
   }

   public void setP_built_in(String p_built_in) {
      this.p_built_in = p_built_in;
   }

   public String getP_loan() {
      return p_loan;
   }

   public void setP_loan(String p_loan) {
      this.p_loan = p_loan;
   }

   public String getP_option() {
      return p_option;
   }

   public void setP_option(String p_option) {
      this.p_option = p_option;
   }

   public String getP_picture() {
      return p_picture;
   }

   public void setP_picture(String p_picture) {
      this.p_picture = p_picture;
   }

   public Date getP_reg_d() {
      return p_reg_d;
   }

   public void setP_reg_d(Date p_reg_d) {
      this.p_reg_d = p_reg_d;
   }

   public String getP_reg_status() {
      return p_reg_status;
   }

   public void setP_reg_status(String p_reg_status) {
      this.p_reg_status = p_reg_status;
   }

   public String getP_del_yn() {
      return p_del_yn;
   }

   public void setP_del_yn(String p_del_yn) {
      this.p_del_yn = p_del_yn;
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

   public String getUs_picture() {
      return us_picture;
   }

   public void setUs_picture(String us_picture) {
      this.us_picture = us_picture;
   }

   @Override
   public String toString() {
      return "ProductApplication [a_id=" + a_id + ", a_status=" + a_status + ", a_date=" + a_date + ", p_id=" + p_id
            + ", pr_id=" + pr_id + ", e_id=" + e_id + ", p_addr=" + p_addr + ", p_field=" + p_field + ", p_floor="
            + p_floor + ", p_size=" + p_size + ", p_str=" + p_str + ", p_kind=" + p_kind + ", p_room=" + p_room
            + ", p_s_size=" + p_s_size + ", p_d_size=" + p_d_size + ", p_layer=" + p_layer + ", p_deal=" + p_deal
            + ", p_charter=" + p_charter + ", p_rent=" + p_rent + ", p_deposit=" + p_deposit + ", p_cost=" + p_cost
            + ", p_cost_item=" + p_cost_item + ", p_en_d=" + p_en_d + ", p_content=" + p_content + ", p_heat="
            + p_heat + ", p_dir=" + p_dir + ", p_park=" + p_park + ", p_elevator=" + p_elevator + ", p_verandar="
            + p_verandar + ", p_pet=" + p_pet + ", p_built_in=" + p_built_in + ", p_loan=" + p_loan + ", p_option="
            + p_option + ", p_picture=" + p_picture + ", p_reg_d=" + p_reg_d + ", p_reg_status=" + p_reg_status
            + ", p_del_yn=" + p_del_yn + ", us_id=" + us_id + ", us_name=" + us_name + ", us_phone=" + us_phone
            + ", us_email=" + us_email + ", us_picture=" + us_picture + "]";
   }

   
   
   
   

}
