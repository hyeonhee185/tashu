package kr.or.ddit.station.vo;

public class StationVO {
	private int station_id;
	private String station_name;
	private String station_area;
	private String station_gu;
	private String station_dong;
	private String station_addr;
	private String station_locker;
	private String station_y_pos;
	private String station_x_pos;
	private int cnt;
	private String station_status;

	
	public String getStation_status() {
		return station_status;
	}

	public void setStation_status(String station_status) {
		this.station_status = station_status;
	}

	public StationVO() {
		// TODO Auto-generated constructor stub
	}

	public int getStation_id() {
		return station_id;
	}

	public void setStation_id(int station_id) {
		this.station_id = station_id;
	}

	public String getStation_name() {
		return station_name;
	}

	public void setStation_name(String station_name) {
		this.station_name = station_name;
	}

	public String getStation_area() {
		return station_area;
	}

	public void setStation_area(String station_area) {
		this.station_area = station_area;
	}

	public String getStation_gu() {
		return station_gu;
	}

	public void setStation_gu(String station_gu) {
		this.station_gu = station_gu;
	}

	public String getStation_dong() {
		return station_dong;
	}

	public void setStation_dong(String station_dong) {
		this.station_dong = station_dong;
	}

	public String getStation_addr() {
		return station_addr;
	}

	public void setStation_addr(String station_addr) {
		this.station_addr = station_addr;
	}

	public String getStation_locker() {
		return station_locker;
	}

	public void setStation_locker(String station_locker) {
		this.station_locker = station_locker;
	}

	public String getStation_y_pos() {
		return station_y_pos;
	}

	public void setStation_y_pos(String station_y_pos) {
		this.station_y_pos = station_y_pos;
	}

	public String getStation_x_pos() {
		return station_x_pos;
	}

	public void setStation_x_pos(String station_x_pos) {
		this.station_x_pos = station_x_pos;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


	
	
}
