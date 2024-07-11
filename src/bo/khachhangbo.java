package bo;

import bean.khachhangbean;
import dao.khachhangdao;

public class khachhangbo {
	private khachhangdao khdao = new khachhangdao();
	public khachhangbean ktdn(String email, String password) throws Exception {
		return khdao.ktdn(email, password);
	}
	
	public void ktdk(String hoten, String email, String password, String diachi) throws Exception {
		khdao.ktdk(hoten, email, password, diachi);
	}
}
