package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangbo;
import sun.java2d.d3d.D3DScreenUpdateManager;

/**
 * Servlet implementation class deleteController
 */
@WebServlet("/deleteController")
public class deleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String deleteAll = request.getParameter("deleteAll");
		String[] deleteItem = request.getParameterValues("checkbox");
		HttpSession session = request.getSession();
		if (deleteAll != null) {
			
			if (session.getAttribute("gh") != null) {
				session.removeAttribute("gh");
				
			}
			response.sendRedirect("gioController");
		}
		
		if (deleteItem != null) {
			giohangbo g = (giohangbo)session.getAttribute("gh");
			int n = g.ds.size();
			int m = deleteItem.length;
			for (int i = 0 ; i < m; i++) {
				for (int j = 0; j < n; j++) {
					if (deleteItem[i].equals(g.ds.get(j).getMsp())) {
						g.ds.remove(j);
						j--;
						n--;
					}
				}
			}
			session.setAttribute("gh", g);
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
