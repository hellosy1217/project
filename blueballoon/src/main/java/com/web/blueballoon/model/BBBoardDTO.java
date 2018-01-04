package com.web.blueballoon.model;

public class BBBoardDTO {
	private int board_num;
	private int prod_num;
	private int pack_num;
	private String member_email;
	private String board_title;
	private String board_content;
	private String board_org_img;
	private String board_str_img;
	private String board_reg_date;
	private int board_readcount;
	private int board_likecount;
	private int board_score;
	private int pick_num;
	private String board_image;

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_org_img() {
		return board_org_img;
	}

	public void setBoard_org_img(String board_org_img) {
		this.board_org_img = board_org_img;
	}

	public String getBoard_str_img() {
		return board_str_img;
	}

	public void setBoard_str_img(String board_str_img) {
		this.board_str_img = board_str_img;
	}

	public String getBoard_reg_date() {
		return board_reg_date;
	}

	public void setBoard_reg_date(String board_reg_date) {
		this.board_reg_date = board_reg_date;
	}

	public int getBoard_readcount() {
		return board_readcount;
	}

	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}

	public int getBoard_likecount() {
		return board_likecount;
	}

	public void setBoard_likecount(int board_likecount) {
		this.board_likecount = board_likecount;
	}

	public int getBoard_score() {
		return board_score;
	}

	public void setBoard_score(int board_score) {
		this.board_score = board_score;
	}

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

	public int getPick_num() {
		return pick_num;
	}

	public void setPick_num(int pick_num) {
		this.pick_num = pick_num;
	}

	public String getBoard_image() {
		return board_image;
	}

	public void setBoard_image(String board_image) {
		this.board_image = board_image;
	}

}