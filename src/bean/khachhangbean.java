package bean;

public class khachhangbean {
	private int makh;
	private String hoten;
	private String email;
	private String password;
	private String diachi;
	public khachhangbean(int makh, String hoten, String email, String password, String diachi) {
		super();
		this.makh = makh;
		this.hoten = hoten;
		this.email = email;
		this.password = password;
		this.diachi = diachi;
	}
	public int getMakh() {
		return makh;
	}
	public void setMakh(int makh) {
		this.makh = makh;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	
	
}
