package bo;

import java.util.ArrayList;

import bean.loaibean;
import dao.loaidao;

public class loaibo {
	loaidao ldao = new loaidao();
	public ArrayList<loaibean>  getLoai () throws Exception {
			return ldao.getLoai();
	}
	
}