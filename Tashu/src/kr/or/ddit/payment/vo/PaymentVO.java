package kr.or.ddit.payment.vo;

public class PaymentVO {
	private int payment_no;
	private String mem_id;
	private int vaucher_id;
	private String start_time;
	private String end_time;
	private String voucher_name;
	
	public PaymentVO() {
		// TODO Auto-generated constructor stub
	}

	public int getPayment_no() {
		return payment_no;
	}

	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getVaucher_id() {
		return vaucher_id;
	}

	public void setVaucher_id(int vaucher_id) {
		this.vaucher_id = vaucher_id;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public String getVoucher_name() {
		return voucher_name;
	}

	public void setVoucher_name(String voucher_name) {
		this.voucher_name = voucher_name;
	}
	
	
}
