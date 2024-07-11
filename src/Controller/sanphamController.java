package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.loaibean;
import bean.sanphambean;
import bo.loaibo;
import bo.sanphambo;

/**
 * Servlet implementation class sanphamController
 */
@WebServlet("/sanphamController")
public class sanphamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sanphamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			String loai = request.getParameter("loai");
			String key = request.getParameter("search");
			loaibo lbo = new loaibo();
			sanphambo spbo = new sanphambo();
			ArrayList<sanphambean> dsSP = spbo.getSanPham();
			if (loai != null) {
				dsSP = spbo.timKiemLoai(loai);
			}
			if (key!= null) {
				dsSP = spbo.getTimKey(key);
			}
			ArrayList<loaibean> dsLoai = lbo.getLoai();
			request.setAttribute("dsLoai", dsLoai);
			request.setAttribute("dssp", dsSP);
			String err = request.getParameter("err");
			if (err != null) {
				request.setAttribute("err", (String)err);
			}
			RequestDispatcher rd = request.getRequestDispatcher("trangchu.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
