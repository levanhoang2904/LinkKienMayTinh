package bo;

import java.util.ArrayList;

import bean.sanphambean;
import dao.sanphamdao;

public class sanphambo {
	sanphamdao spdao = new sanphamdao();
	ArrayList<sanphambean> ds;
	
	public ArrayList<sanphambean> getSanPham() throws Exception {
		ds = spdao.getSanpham();
		return ds;
	}
	
	public ArrayList<sanphambean> timKiemLoai(String loai) throws Exception {
		ArrayList<sanphambean> rs = new ArrayList<sanphambean>();
		for (sanphambean sp : ds) {
			if (sp.getMaLoai().equals(loai)) {
				rs.add(sp);
			}
		}
		return rs;
	}
	
	public ArrayList<sanphambean> getTimKey(String key) throws Exception {
		 
		ArrayList<sanphambean> result = new ArrayList<sanphambean>();
		int n = ds.size();
		for (int i = 0; i < n; i++) {
				if (ds.get(i).getTensp().toLowerCase().trim().contains(key.trim().toLowerCase())) {
						result.add(ds.get(i));
				}
		}
		return result;
} 
	
}
