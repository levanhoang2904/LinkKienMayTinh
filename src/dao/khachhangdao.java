package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.khachhangbean;

public class khachhangdao {
	public khachhangbean ktdn(String email, String password) throws Exception {
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select * from KhachHang where email = ? and password = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		khachhangbean kh = null;
		cmd.setString(1, email);
		cmd.setString(2, password);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String makh = rs.getString("makh");
			String hoten = rs.getString("hoten");
			String tendn = rs.getString("email");
			String pass = rs.getString("password");
			String diachi = rs.getString("diachi");
			
			kh = new khachhangbean(Integer.parseInt(makh), hoten, tendn, pass, diachi);
		}
		return kh;
	}
	
	public void ktdk(String hoten, String email, String password, String diachi)throws Exception {
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "insert into KhachHang(hoten, email, password, diachi) values (?, ?, ?, ?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, hoten);
		cmd.setString(2, email);
		cmd.setString(3, password);
		cmd.setString(4, diachi);
		cmd.executeUpdate();
	}
}
