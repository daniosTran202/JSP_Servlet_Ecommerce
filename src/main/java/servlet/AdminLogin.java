package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminDAO;
import dao.AdminDAOImpl;
import entity.Admin;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminLogin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String email = request.getParameter("Email");
		String password = request.getParameter("Password");
		String chkRemember = request.getParameter("Remember");

		AdminDAO dao = new AdminDAOImpl();
		Admin ad = dao.login(email, password);

		if (ad != null) {
			// save thông tin vào sesion
			HttpSession ss = request.getSession();
			ss.setAttribute("admin", ad);
			
			// Kiểm tra nút Remember
			if(chkRemember != null) {
				System.out.println("Nhớ tài khoản");
				Cookie adRemember = new Cookie("remember", "1");
				Cookie adUsername = new Cookie("adUsername", email);
				Cookie adPassword = new Cookie("adPassword", password);
				
				adRemember.setMaxAge(60 * 60 * 24 * 14);
				adUsername.setMaxAge(60 * 60 * 24 * 14);
				adPassword.setMaxAge(60 * 60 * 24 * 14);
				
				response.addCookie(adRemember);
				response.addCookie(adUsername);
				response.addCookie(adPassword);
			}
			
			response.sendRedirect("adminHome");
		} else {
			request.setAttribute("username", email);
			request.setAttribute("password", password);
			request.setAttribute("msgerr", "Sai thông tin đăng nhập");
			request.getRequestDispatcher("admin_view/login.jsp").forward(request, response);
		}
	}

}
