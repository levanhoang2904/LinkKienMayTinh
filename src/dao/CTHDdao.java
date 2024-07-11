package dao;

import java.sql.PreparedStatement;

public class CTHDdao {
	public int themChiTietHD (String masp, int soluongmua, int MaHoaDon) throws Exception {
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		
		String sql = "insert into CTHD(mahd, masp, soluongmua, damua) values (?, ?, ?, ?)";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, MaHoaDon);
		cmd.setString(2, masp);
		cmd.setInt(3, soluongmua);
		cmd.setBoolean(4, false);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		
		return kq;
	}
}
