package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

public class hoadondao {
	public int themHoaDon(long makh) throws Exception {
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		
		String sql = "insert into hoadon(makh, ngaymua, damua) values (?, ?, ?)";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		// Set gia tri vao ?
		cmd.setLong(1, makh);
		// Lay ngay gio hien tai
		Date n1 = new Date();
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		// Doi nay until sang chuoi theo dinh dang
		String tam = dd.format(n1); // "2023-07-27"
		Date n2 = dd.parse(tam); // Doi chuoi ra ngay
		// Doi ngay util sang ngay sql va dua vao tham so
		cmd.setDate(2, new java.sql.Date(n2.getTime()));
		cmd.setBoolean(3, false);

		int kq = cmd.executeUpdate();
		// B6: dong ket noi rs
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	public int getMaHd() throws Exception {
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		
		String sql = "select max(mahd) from HoaDon";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		int max = 0;
		while(rs.next()) {
			max = rs.getInt(1);
		}
		rs.close();
		kn.cn.close();
		return max;
	}
}
