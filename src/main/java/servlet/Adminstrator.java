package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Admin;

@WebServlet("/Adminstrator")
public class Adminstrator extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Adminstrator() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Admin username = (Admin) request.getSession().getAttribute("admin_view");
		if(username != null ) {
			request.getRequestDispatcher("admin_view/index.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("admin_view/login.jsp").forward(request, response);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
