package search;

import java.util.Date;

import recommend.CountryDTO;

public class ScheduleVO {
	int sID;
	String departTime;
	String arriveTime;
	int airline;
	int price;
	int seat;
	int departCtID;
	int arriveCtID;

	public int getsID() {
		return sID;
	}

	public void setsID(int sID) {
		this.sID = sID;
	}

	public String getDepartTime() {
		return departTime;
	}

	public void setDepartTime(String departTime) {
		this.departTime = departTime;
	}

	public String getArriveTime() {
		return arriveTime;
	}

	public void setArriveTime(String arriveTime) {
		this.arriveTime = arriveTime;
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

	public int getDepartCtID() {
		return departCtID;
	}

	public void setDepartCtID(int departCtID) {
		this.departCtID = departCtID;
	}

	public int getArriveCtID() {
		return arriveCtID;
	}

	public void setArriveCtID(int arriveCtID) {
		this.arriveCtID = arriveCtID;
	}


}
