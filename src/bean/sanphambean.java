package bean;

public class sanphambean {
	private String masp;
	private String tensp;
	private String nsx;
	private int soluong;
	private int gia;
	private String maloai;
	private String anh;
	public sanphambean(String masp, String tensp, String nsx, int soluong, int gia, String maloai, String anh) {
		super();
		this.masp = masp;
		this.tensp = tensp;
		this.nsx = nsx;
		this.soluong = soluong;
		this.gia = gia;
		this.maloai = maloai;
		this.anh = anh;
	}
	public sanphambean() {
		super();
	}
	public String getMasp() {
		return masp;
	}
	public void setMasp(String masp) {
		this.masp = masp;
	}
	public String getTensp() {
		return tensp;
	}
	public void setTensp(String tensp) {
		this.tensp = tensp;
	}
	public String getNsx() {
		return nsx;
	}
	public void setNsx(String nsx) {
		this.nsx = nsx;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public String getMaLoai() {
		return maloai;
	}
	public void setMaLoai(String maloai) {
		this.maloai = maloai;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh (String anh) {
		 this.anh = anh;
	}

}
