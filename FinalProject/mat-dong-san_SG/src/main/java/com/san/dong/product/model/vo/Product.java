package com.san.dong.product.model.vo;
import java.sql.Date;

public class Product {
   private int p_id;          // 매물등록번호
   private String p_addr;      // 주소
   private String p_coord;      // 위치정보 35/35 -> 파일의 두번째 이름
   private String p_c_lat;      // 좌표x (위도)
   private String p_c_lng;      // 좌표y (경도)
   private String p_field;      // 건물 유형 (단독주택,빌라)
   private String p_floor;      // 건물 층
   private String p_size;      // 건물 평수
   private String p_str;      // 구조 (1.5룸/주방분리형...)
   private String p_kind;      // 방종류(원룸,투룸)
   private String p_room;      // 방 호수(201호..)
   private String p_s_size;   // 공급 면적
   private String p_d_size;   // 전용 면적
   private String p_layer;      // 방 층수
   private String p_deal;      // 전세,월세
   private String p_charter;   // 전세 기본 0
   private String p_rent;      // 월세 기본 0
   private String p_deposit;   // 보증금 기본 0
   private String p_cost;      // 관리비 기본 0
   private String p_cost_item; // 관리비 항목 구분자 ,
   private Date p_en_d;      // 입주 가능일
   private String p_content;   // 설명
   private String p_heat;      // 난방종류 (중앙난방,개별난방,지역난방)
   private String p_dir;      // 방향 (남향,북향..)
   private String p_park;      // 주차가능 (가능/불가능)
   private String p_elevator;   // 엘레베이터 여부 (있음/없음)
   private String p_verander;   // 베란다/발코니 여부 (있음/없음)
   private String p_pet;      // 반려동물 (가능,불가능)
   private String p_built_in;   // 빌트인 (있음,없음)
   private String p_loan;      // 전세자금대출 (가능,불가능)
   private String p_option;   // 옵션항목(에어컨,냉장고..)
   private String p_picture;   // 사진 구분자 ,
   private Date p_reg_d;      // 등록날짜
   private String p_reg_status;// 등록상태 (y,n);
   private String p_del_yn;   // 삭제여부
   private String us_id;      // 아이디
   
   public Product(int p_id, String p_addr, String p_coord, String p_c_lat, String p_c_lng, String p_field,
         String p_floor, String p_size, String p_str, String p_kind, String p_room, String p_s_size, String p_d_size,
         String p_layer, String p_deal, String p_charter, String p_rent, String p_deposit, String p_cost,
         String p_cost_item, Date p_en_d, String p_content, String p_heat, String p_dir, String p_park,
         String p_elevator, String p_verander, String p_pet, String p_built_in, String p_loan, String p_option,
         String p_picture, Date p_reg_d, String p_reg_status, String p_del_yn, String us_id) {
      super();
      this.p_id = p_id;
      this.p_addr = p_addr;
      this.p_coord = p_coord;
      this.p_c_lat = p_c_lat;
      this.p_c_lng = p_c_lng;
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
      this.p_verander = p_verander;
      this.p_pet = p_pet;
      this.p_built_in = p_built_in;
      this.p_loan = p_loan;
      this.p_option = p_option;
      this.p_picture = p_picture;
      this.p_reg_d = p_reg_d;
      this.p_reg_status = p_reg_status;
      this.p_del_yn = p_del_yn;
      this.us_id = us_id;
   }

   public int getP_id() {
      return p_id;
   }

   public void setP_id(int p_id) {
      this.p_id = p_id;
   }

   public String getP_addr() {
      return p_addr;
   }

   public void setP_addr(String p_addr) {
      this.p_addr = p_addr;
   }

   public String getP_coord() {
      return p_coord;
   }

   public void setP_coord(String p_coord) {
      this.p_coord = p_coord;
   }

   public String getP_c_lat() {
      return p_c_lat;
   }

   public void setP_c_lat(String p_c_lat) {
      this.p_c_lat = p_c_lat;
   }

   public String getP_c_lng() {
      return p_c_lng;
   }

   public void setP_c_lng(String p_c_lng) {
      this.p_c_lng = p_c_lng;
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

   public String getP_verander() {
      return p_verander;
   }

   public void setP_verander(String p_verander) {
      this.p_verander = p_verander;
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

   @Override
   public String toString() {
      return "Product [p_id=" + p_id + ", p_addr=" + p_addr + ", p_coord=" + p_coord + ", p_c_lat=" + p_c_lat
            + ", p_c_lng=" + p_c_lng + ", p_field=" + p_field + ", p_floor=" + p_floor + ", p_size=" + p_size
            + ", p_str=" + p_str + ", p_kind=" + p_kind + ", p_room=" + p_room + ", p_s_size=" + p_s_size
            + ", p_d_size=" + p_d_size + ", p_layer=" + p_layer + ", p_deal=" + p_deal + ", p_charter=" + p_charter
            + ", p_rent=" + p_rent + ", p_deposit=" + p_deposit + ", p_cost=" + p_cost + ", p_cost_item="
            + p_cost_item + ", p_en_d=" + p_en_d + ", p_content=" + p_content + ", p_heat=" + p_heat + ", p_dir="
            + p_dir + ", p_park=" + p_park + ", p_elevator=" + p_elevator + ", p_verander=" + p_verander
            + ", p_pet=" + p_pet + ", p_built_in=" + p_built_in + ", p_loan=" + p_loan + ", p_option=" + p_option
            + ", p_picture=" + p_picture + ", p_reg_d=" + p_reg_d + ", p_reg_status=" + p_reg_status + ", p_del_yn="
            + p_del_yn + ", us_id=" + us_id + "]";
   }

}