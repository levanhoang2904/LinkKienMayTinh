package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.giohangbean;
import bean.khachhangbean;
import bo.CTHDbo;
import bo.giohangbo;
import bo.hoadonbo;

/**
 * Servlet implementation class xacnhanController
 */
@WebServlet("/xacnhanController")
public class xacnhanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xacnhanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession();
			if (session.getAttribute("dn") == null) {
				response.sendRedirect("sanphamController");
			}
			
			else {
				khachhangbean kh = (khachhangbean)session.getAttribute("dn");
				hoadonbo hdbo = new hoadonbo();
				CTHDbo cthd = new CTHDbo();
			
				
				
//				 hdbo.themHoaDon(kh.getMakh());
				 giohangbo g = (giohangbo)session.getAttribute("gh");
				 int mahd = hdbo.getMahd();
				 for (giohangbean item : g.ds) {
					cthd.themCTHD(item.getMsp(), item.getSoluong(), mahd);
				 }
				session.removeAttribute("gh");
				
				response.sendRedirect("gioController");
			}
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
