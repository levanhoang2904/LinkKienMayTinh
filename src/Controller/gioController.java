package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.jasper.tagplugins.jstl.core.If;

import com.sun.corba.se.spi.ior.IdentifiableFactoryFinder;

import bean.giohangbean;
import bo.giohangbo;

/**
 * Servlet implementation class gioController
 */
@WebServlet("/gioController")
public class gioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gioController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {

			String anh = request.getParameter("anh");
			String tensp = request.getParameter("tsp");
			String gia = request.getParameter("gia");
			String msp = request.getParameter("masp");
			String maloai = request.getParameter("maloai");
		
			
			giohangbo g = new giohangbo();
			
			HttpSession session = request.getSession();
			
			if (session.getAttribute("gh") == null) {
				session.setAttribute("gh", g);
			}
			g = (giohangbo)session.getAttribute("gh");
			
			String deleteItem = request.getParameter("deleteMsp");
			if (deleteItem != null) {
				
				int n = g.ds.size();
				for (int i = 0; i < n; i++) {
					if (g.ds.get(i).getMsp().equals(deleteItem)) {
						
						 g.ds.remove(i);
						 session.setAttribute("gh", g);
						 response.sendRedirect("gioController");
					}
					
				}
			}
			if (anh != null && tensp != null && gia != null && msp != null && maloai != null) {
				if (session.getAttribute("dn") == null) {
					String err = "muahang";
					response.sendRedirect("sanphamController?err="+err);
				}
				
				else {
				g.them(anh, msp, tensp, Integer.parseInt(gia), maloai);
				session.setAttribute("gh", g);
				response.sendRedirect("gioController");
				}
			}
			
			if (session.getAttribute("dn") == null) {
				String err = "htgio";
				response.sendRedirect("sanphamController?err="+err);
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("giohang.jsp");
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
