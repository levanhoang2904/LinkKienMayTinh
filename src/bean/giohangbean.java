package bean;

public class giohangbean {
	private String anh;
	private String tensp;
	private int gia;
	private int soluong;
	private String msp;
	private String maloai;
	public giohangbean(String anh, String tensp, int gia, String msp, int soluong, String maloai) {
		super();
		this.anh = anh;
		this.tensp = tensp;
		this.msp = msp;
		this.gia = gia;
		this.soluong = soluong;
		this.maloai = maloai;
		
	}
	public giohangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public String getTenSp() {
		return tensp;
	}
	public void setTenSp(String tensp) {
		this.tensp = tensp;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public String getMsp() {
		return this.msp;
	}
	public void setmsp(String msp) {
		this.msp = msp;
	}
	public String getMaLoai() {
		return this.maloai;
	}
	
	public void setMaLoai(String maloai) {
		this.maloai = maloai;
	}
}
