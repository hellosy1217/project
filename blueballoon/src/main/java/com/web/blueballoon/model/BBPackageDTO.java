package com.web.blueballoon.model;

public class BBPackageDTO {
	private int pack_num;
	private String pack_title;
	private String pack_email;
	private String pack_phone;
	private int pack_price;
	private String pack_org_img;
	private String pack_str_img;
	private String pack_period;
	private String pack_days;
	private String pack_start_date;
	private String pack_content;
	private String pack_place;
	
	/*pack_num   : 패키지 고유 번호
	pack_title      : 패키지 이름
	pack_email   : 판매자 이메일
	pack_phone   : 판매자 번호
	pack_price   : 패키지 가격(인당)
	pack_org_img   : 이미지 원래 이름
	pack_str_img    : 이미지 수정 이름
	pack_period   : 기간 >> n-m
	pack_days : 패키지 전체 일 수
	pack_start_date :  시작일 들
	pack_content   : 패키지 설명
	pack_place   : 지역
	*/
	public int getPack_num() {
		return pack_num;
	}
	public void setPack_num(int pack_num) {
		this.pack_num = pack_num;
	}
	public String getPack_title() {
		return pack_title;
	}
	public void setPack_title(String pack_title) {
		this.pack_title = pack_title;
	}
	public String getPack_email() {
		return pack_email;
	}
	public void setPack_email(String pack_email) {
		this.pack_email = pack_email;
	}
	public String getPack_phone() {
		return pack_phone;
	}
	public void setPack_phone(String pack_phone) {
		this.pack_phone = pack_phone;
	}
	public int getPack_price() {
		return pack_price;
	}
	public void setPack_price(int pack_price) {
		this.pack_price = pack_price;
	}
	public String getPack_period() {
		return pack_period;
	}
	public void setPack_period(String pack_period) {
		this.pack_period = pack_period;
	}
	public String getPack_content() {
		return pack_content;
	}
	public void setPack_content(String pack_content) {
		this.pack_content = pack_content;
	}
	public String getPack_place() {
		return pack_place;
	}
	public void setPack_place(String pack_place) {
		this.pack_place = pack_place;
	}
	public String getPack_org_img() {
		return pack_org_img;
	}
	public void setPack_org_img(String pack_org_img) {
		this.pack_org_img = pack_org_img;
	}
	public String getPack_str_img() {
		return pack_str_img;
	}
	public void setPack_str_img(String pack_str_img) {
		this.pack_str_img = pack_str_img;
	}
	public String getPack_days() {
		return pack_days;
	}
	public void setPack_days(String pack_days) {
		this.pack_days = pack_days;
	}
	public String getPack_start_date() {
		return pack_start_date;
	}
	public void setPack_start_date(String pack_start_date) {
		this.pack_start_date = pack_start_date;
	}
}
