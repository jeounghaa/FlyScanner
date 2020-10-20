package payment;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

public class scheduleVO {

	/* SimpleDateFormat f = new SimpleDateFormat("hh:mm"); */
	//스케줄(출도착시간, 항공, 가격, 출발나라id, 도착id
	
	private int sID1; //  출발 스케줄
	private Date de_day; //  출발 날짜
	private Date arr_day; //  도착 날짜
	private Time de_time; //출발 시간
	private Time arr_time; //도착 시간
	private int airline; //항공사 번호
	private int price; //가격
	private int seat; //좌석번호
	private int de_ct; //출발지 아이디
	private int arr_ct;//도착지 아이디
	
	
	private int sID2; //  출발 스케줄
	private Date de_day2; //  출발 날짜
	private Date arr_day2; //  도착 날짜
	private Time de_time2; //출발 시간
	private Time arr_time2; //도착 시간
	private int airline2; //항공사 번호
	private int price2; //가격
	private int seat2; //좌석번호
	private int de_ct2; //출발지 아이디
	private int arr_ct2;//도착지 아이디
	
	private String de_nation; //출발나라
	private String arr_nation; //도착나라
	
	
	
	public int getsID1() {
		return sID1;
	}
	public void setsID1(int sID1) {
		this.sID1 = sID1;
	}
	public Date getDe_day() {
		return de_day;
	}
	public void setDe_day(Date de_day) {
		this.de_day = de_day;
	}
	public Date getArr_day() {
		return arr_day;
	}
	public void setArr_day(Date arr_day) {
		this.arr_day = arr_day;
	}
	public Time getDe_time() {
		return de_time;
	}
	public void setDe_time(Time de_time) {
		this.de_time = de_time;
	}
	public Time getArr_time() {
		return arr_time;
	}
	public void setArr_time(Time arr_time) {
		this.arr_time = arr_time;
	}
	public int getAirline() {
		return airline;
	}
	public void setAirline(int airline) {
		this.airline = airline;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	public int getDe_ct() {
		return de_ct;
	}
	public void setDe_ct(int de_ct) {
		this.de_ct = de_ct;
	}
	public int getArr_ct() {
		return arr_ct;
	}
	public void setArr_ct(int arr_ct) {
		this.arr_ct = arr_ct;
	}
	public int getsID2() {
		return sID2;
	}
	public void setsID2(int sID2) {
		this.sID2 = sID2;
	}
	public Date getDe_day2() {
		return de_day2;
	}
	public void setDe_day2(Date de_day2) {
		this.de_day2 = de_day2;
	}
	public Date getArr_day2() {
		return arr_day2;
	}
	public void setArr_day2(Date arr_day2) {
		this.arr_day2 = arr_day2;
	}
	public Time getDe_time2() {
		return de_time2;
	}
	public void setDe_time2(Time de_time2) {
		this.de_time2 = de_time2;
	}
	public Time getArr_time2() {
		return arr_time2;
	}
	public void setArr_time2(Time arr_time2) {
		this.arr_time2 = arr_time2;
	}
	public int getAirline2() {
		return airline2;
	}
	public void setAirline2(int airline2) {
		this.airline2 = airline2;
	}
	public int getPrice2() {
		return price2;
	}
	public void setPrice2(int price2) {
		this.price2 = price2;
	}
	public int getSeat2() {
		return seat2;
	}
	public void setSeat2(int seat2) {
		this.seat2 = seat2;
	}
	public int getDe_ct2() {
		return de_ct2;
	}
	public void setDe_ct2(int de_ct2) {
		this.de_ct2 = de_ct2;
	}
	public int getArr_ct2() {
		return arr_ct2;
	}
	public void setArr_ct2(int arr_ct2) {
		this.arr_ct2 = arr_ct2;
	}
	public String getDe_nation() {
		return de_nation;
	}
	public void setDe_nation(String de_nation) {
		this.de_nation = de_nation;
	}
	public String getArr_nation() {
		return arr_nation;
	}
	public void setArr_nation(String arr_nation) {
		this.arr_nation = arr_nation;
	}
	
	

	
	
	
	
	
}
