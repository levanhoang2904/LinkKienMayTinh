package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean>getLoai() throws Exception {
		ArrayList<loaibean> dsLoai = new ArrayList<loaibean>();
		ketnoidao kn = new ketnoidao();
		kn.ketnoi();
		String sql = "select * from Loai";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String maloai = rs.getString("maloai");
			String tenloai = rs.getString("tenLoai");
			
			dsLoai.add(new loaibean(maloai, tenloai));
		}
		rs.close();
		kn.cn.close();
		return dsLoai;
	}
}
