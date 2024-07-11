package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.sanphambean;

public class sanphamdao {
	public ArrayList<sanphambean> getSanpham() throws Exception {
		 ArrayList<sanphambean> dsSanPham = new ArrayList<sanphambean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select * from BanPhim";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			String masp = rs.getString("masp");
			String tensp = rs.getString("tensp");
			String nsx = rs.getString("nsx");
			int soluong = rs.getInt("soluong");
			int gia = rs.getInt("gia");
			String maloai = rs.getString("maloai");
			String anh = rs.getString("anh");
			
			dsSanPham.add(new sanphambean(masp, tensp, nsx, soluong, gia, maloai, anh));
		}
		return dsSanPham;
	}
}
