package bo;

import java.util.ArrayList;

import org.eclipse.jdt.internal.compiler.lookup.ImplicitNullAnnotationVerifier;

import bean.giohangbean;

public class giohangbo {
	
	public ArrayList<giohangbean> ds = new ArrayList<giohangbean>();
	public void them(String anh, String msp, String tsp, int gia, String maloai) throws Exception {
		for (giohangbean sp: ds) {
			if (sp.getMsp().equals(msp)) {
				sp.setSoluong(sp.getSoluong() + 1);
				return;
			}
			
		}
		giohangbean sp = new giohangbean(anh, tsp, gia, msp, 1, maloai);
		ds.add(sp);
	}
	
	public int thanhTien() throws Exception {
		int sum = 0;
		for (giohangbean item : ds) {
			sum = sum + item.getSoluong() * item.getGia();
		}
		
		return sum;
	}
	
	
	
}
