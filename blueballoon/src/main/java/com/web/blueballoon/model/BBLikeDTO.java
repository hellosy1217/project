package com.web.blueballoon.model;

public class BBLikeDTO {
	private int prod_num;
	private int pack_num;
	private int member_num;
	private String prod_str_img;
	private String pack_str_img;
	private int prod_pick;
	private String prod_name;

	public int getProd_num() {
		return prod_num;
	}

	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}

	public int getPack_num() {
		return pack_num;
	}

	public void setPack_num(int pack_num) {
		this.pack_num = pack_num;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public String getProd_str_img() {
		return prod_str_img;
	}

	public void setProd_str_img(String prod_str_img) {
		this.prod_str_img = prod_str_img;
	}

	public String getPack_str_img() {
		return pack_str_img;
	}

	public void setPack_str_img(String pack_str_img) {
		this.pack_str_img = pack_str_img;
	}

	public int getProd_pick() {
		return prod_pick;
	}

	public void setProd_pick(int prod_pick) {
		this.prod_pick = prod_pick;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

}
