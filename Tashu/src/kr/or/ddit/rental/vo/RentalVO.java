package kr.or.ddit.rental.vo;

public class RentalVO {
	private int rental_no;
	private String mem_id;
	private int bicycle_no;
	private String rental_time;
	private int rental_station;
	private int rental_locker;
	private String return_time;
	private int return_station;
	private int return_locker;
	private int add_pay;
	private int payment_no;
	
	private String rental_name;
	private String return_name;
	
	public RentalVO() {
		// TODO Auto-generated constructor stub
	}
	public int getRental_no() {
		return rental_no;
	}
	public void setRental_no(int rental_no) {
		this.rental_no = rental_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getBicycle_no() {
		return bicycle_no;
	}
	public void setBicycle_no(int bicycle_no) {
		this.bicycle_no = bicycle_no;
	}
	public String getRental_time() {
		return rental_time;
	}
	public void setRental_time(String rental_time) {
		this.rental_time = rental_time;
	}
	public int getRental_station() {
		return rental_station;
	}
	public void setRental_station(int rental_station) {
		this.rental_station = rental_station;
	}
	public int getRental_locker() {
		return rental_locker;
	}
	public void setRental_locker(int rental_locker) {
		this.rental_locker = rental_locker;
	}
	public String getReturn_time() {
		return return_time;
	}
	public void setReturn_time(String return_time) {
		this.return_time = return_time;
	}
	public int getReturn_station() {
		return return_station;
	}
	public void setReturn_station(int return_station) {
		this.return_station = return_station;
	}
	public int getReturn_locker() {
		return return_locker;
	}
	public void setReturn_locker(int return_locker) {
		this.return_locker = return_locker;
	}
	public int getAdd_pay() {
		return add_pay;
	}
	public void setAdd_pay(int add_pay) {
		this.add_pay = add_pay;
	}
	public int getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}
	public String getRental_name() {
		return rental_name;
	}

	public void setRental_name(String rental_name) {
		this.rental_name = rental_name;
	}

	public String getReturn_name() {
		return return_name;
	}

	public void setReturn_name(String return_name) {
		this.return_name = return_name;
	}
	

}
