	package payment;

public class paymentVO {
	private int cardCom; //카드회사
	private String cardNum; //카드번호
	private String payPlan; //할부
	private String uID;//유저아이디
	private int sID;//갈때 스케줄 아이디
	private int sID1;//올때 스케줄 아이디
	//카트아이디
	private int cID;
	
	
	
	//booking detail
	private String psgName;
	private String psgBirth;
	private String mobile;
	private String passport;
	private String psgGender;
	private int country;
	
	//booking id
	private int bID;
	// payment id
	private int pID;

	public int getCardCom() {
		return cardCom;
	}
	public void setCardCom(int cardCom) {
		this.cardCom = cardCom;
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
	public String getuID() {
		return uID;
	}
	public void setuID(String uID) {
		this.uID = uID;
	}
	public int getsID() {
		return sID;
	}
	public void setsID(int sID) {
		this.sID = sID;
	}
	public String getPsgName() {
		return psgName;
	}
	public void setPsgName(String psgName) {
		this.psgName = psgName;
	}
	public String getPsgBirth() {
		return psgBirth;
	}
	public void setPsgBirth(String psgBirth) {
		this.psgBirth = psgBirth;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassport() {
		return passport;
	}
	public void setPassport(String passport) {
		this.passport = passport;
	}
	public String getPsgGender() {
		return psgGender;
	}
	public void setPsgGender(String psgGender) {
		this.psgGender = psgGender;
	}
	public int getCountry() {
		return country;
	}
	public void setCountry(int country) {
		this.country = country;
	}
	public int getsID1() {
		return sID1;
	}
	public void setsID1(int sID1) {
		this.sID1 = sID1;
	}
	public int getbID() {
		return bID;
	}
	public void setbID(int bID) {
		this.bID = bID;
	}
	public int getpID() {
		return pID;
	}
	public void setpID(int pID) {
		this.pID = pID;
	}
	public int getcID() {
		return cID;
	}
	public void setcID(int cID) {
		this.cID = cID;
	}

	
	
	
	
	
	
	
	
}
