package payment;

import java.sql.Date;
import java.sql.Time;

public class mypayVO {
	//user
	private String uID; //아이디
	private String namekor; //한글이름
	
	
	//payment uID로 찾기
	private String cardNum; //카드번호
	private String payPlan; //할부
	private Date payDay; //결제 날짜
	private Time payTime; //결제 시간
	private int pID; //결제 시간
	
	private int sID; //결제 시간
	//booking의 sID로 스케줄 출력
	private int departCtID; //가는 나라
	private Date departDATE; //가는 날짜
	private Time departTIME; //가는 시간
	
	
	private int arriveCtID; //오는 나라
	private Date arriveDATE; //오는 날짜
	private Time arriveTIME; //오는 시간
	
	
	public String getuID() {
		return uID;
	}
	public void setuID(String uID) {
		this.uID = uID;
	}
	public String getNamekor() {
		return namekor;
	}
	public void setNamekor(String namekor) {
		this.namekor = namekor;
	}
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getPayPlan() {
		return payPlan;
	}
	public void setPayPlan(String payPlan) {
		this.payPlan = payPlan;
	}
	public Date getPayDay() {
		return payDay;
	}
	public void setPayDay(Date payDay) {
		this.payDay = payDay;
	}
	public Time getPayTime() {
		return payTime;
	}
	public void setPayTime(Time payTime) {
		this.payTime = payTime;
	}
	public int getpID() {
		return pID;
	}
	public void setpID(int pID) {
		this.pID = pID;
	}
	public int getsID() {
		return sID;
	}
	public void setsID(int sID) {
		this.sID = sID;
	}
	public int getDepartCtID() {
		return departCtID;
	}
	public void setDepartCtID(int departCtID) {
		this.departCtID = departCtID;
	}
	public Date getDepartDATE() {
		return departDATE;
	}
	public void setDepartDATE(Date departDATE) {
		this.departDATE = departDATE;
	}
	public Time getDepartTIME() {
		return departTIME;
	}
	public void setDepartTIME(Time departTIME) {
		this.departTIME = departTIME;
	}
	public int getArriveCtID() {
		return arriveCtID;
	}
	public void setArriveCtID(int arriveCtID) {
		this.arriveCtID = arriveCtID;
	}
	public Date getArriveDATE() {
		return arriveDATE;
	}
	public void setArriveDATE(Date arriveDATE) {
		this.arriveDATE = arriveDATE;
	}
	public Time getArriveTIME() {
		return arriveTIME;
	}
	public void setArriveTIME(Time arriveTIME) {
		this.arriveTIME = arriveTIME;
	}

}