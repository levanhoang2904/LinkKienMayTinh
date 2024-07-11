package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.giohangbean;
import bo.giohangbo;

/**
 * Servlet implementation class editController
 */
@WebServlet("/editController")
public class editController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tru = request.getParameter("tru");
		String cong = request.getParameter("cong");
		HttpSession session = request.getSession();
		giohangbo g = new giohangbo();
		if (session.getAttribute("gh") != null) {
			g = (giohangbo)session.getAttribute("gh");
					
		}
	
		if (tru != null) {
			for (giohangbean item : g.ds) {
				if (item.getMsp().equals(tru)) {
					if (item.getSoluong() > 1)
					item.setSoluong(item.getSoluong() - 1);
				}
			}
			response.sendRedirect("gioController");
		}
		
		if (cong != null) {
			for (giohangbean item : g.ds) {
				if (item.getMsp().equals(cong)) {
					item.setSoluong(item.getSoluong() + 1);
				}
			}
			response.sendRedirect("gioController");
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
