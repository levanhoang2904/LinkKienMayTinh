package bo;

import dao.hoadondao;

public class hoadonbo {
	hoadondao hddao = new hoadondao();
	public int themHoaDon(long makh) throws Exception {
		int rs = hddao.themHoaDon(makh);
		return rs;
	}
	
	public int getMahd() throws Exception {
		int rs = hddao.getMaHd();
		return rs;
	}
}
