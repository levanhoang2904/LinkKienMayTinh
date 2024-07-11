package bo;

import dao.CTHDdao;

public class CTHDbo {
	CTHDdao cthddao = new CTHDdao();
	public int themCTHD(String masp, int soluongmua,int MaHoaDon) throws Exception {
		int rs = cthddao.themChiTietHD(masp, soluongmua, MaHoaDon);
		return rs;
	}
}



