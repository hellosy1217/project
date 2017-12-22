package com.web.blueballoon.model;

public class BBRoomDTO {
	private int room_num;
	private int prod_num;
	private String room_name;
	private String room_person;
	private int room_peak_price;
	private int room_non_peak_price;
	private int room_week_premium;
	private String room_period;
	private int room_offer;
	/*room_num : 방 번호
	prod_num : 숙소 번호
	room_name : 방 이름 (예: 101호)
	room_person : 방 인원(min-max)
	room_peak_price : 성수기 가격
	room_non_peak_price : 비성수기 가격
	room_week_premium : 주말 가격 증가율(0~100)
	room_period : 예약 할 수 있는 기간 (yyyy-mm-dd;yyyy-mm-dd)
	room_offer : 할인율*/
	
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public int getProd_num() {
		return prod_num;
	}
	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}
	public String getRoom_person() {
		return room_person;
	}
	public void setRoom_person(String room_person) {
		this.room_person = room_person;
	}
	public int getRoom_peak_price() {
		return room_peak_price;
	}
	public void setRoom_peak_price(int room_peak_price) {
		this.room_peak_price = room_peak_price;
	}
	public int getRoom_non_peak_price() {
		return room_non_peak_price;
	}
	public void setRoom_non_peak_price(int room_non_peak_price) {
		this.room_non_peak_price = room_non_peak_price;
	}
	public int getRoom_week_premium() {
		return room_week_premium;
	}
	public void setRoom_week_premium(int room_week_premium) {
		this.room_week_premium = room_week_premium;
	}
	public String getRoom_period() {
		return room_period;
	}
	public void setRoom_period(String room_period) {
		this.room_period = room_period;
	}
	public int getRoom_offer() {
		return room_offer;
	}
	public void setRoom_offer(int room_offer) {
		this.room_offer = room_offer;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
}
