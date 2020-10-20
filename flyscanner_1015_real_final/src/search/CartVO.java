package search;

public class CartVO {
	int cID;
	boolean isPaid;
	String cartDate;
	int count;
	int sID;
	String uID;
	ScheduleVO svhedule;

	public ScheduleVO getSvhedule() {
		return svhedule;
	}

	public void setSvhedule(ScheduleVO svhedule) {
		this.svhedule = svhedule;
	}

	public int getcID() {
		return cID;
	}

	public void setcID(int cID) {
		this.cID = cID;
	}

	public boolean getisPaid() {
		return isPaid;
	}

	public void setisPaid(boolean isPaid) {
		this.isPaid = isPaid;
	}

	public String getCartDate() {
		return cartDate;
	}

	public void setCartDate(String cartDate) {
		this.cartDate = cartDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getsID() {
		return sID;
	}

	public void setsID(int sID) {
		this.sID = sID;
	}

	public String getuID() {
		return uID;
	}

	public void setuID(String uID) {
		this.uID = uID;
	}

}
