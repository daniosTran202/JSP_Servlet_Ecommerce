package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import dao.AccountDAOImpl;
import entity.Account;

@WebServlet("/Accounts")
public class Accounts extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Accounts() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String email = request.getParameter("txtEmail");
		String password = request.getParameter("txtPassword");
		String chkRemember = request.getParameter("chkRemember");

		AccountDAO dao = new AccountDAOImpl();
		Account acc = dao.login(email, password);

		if (acc != null) {
			// save thông tin vào sesion
			HttpSession ss = request.getSession();
			ss.setAttribute("acc", acc);
			
			// Kiểm tra nút Remember
			if(chkRemember != null) {
				System.out.println("Nhớ tài khoản");
				Cookie cRemember = new Cookie("remember", "1");
				Cookie cUsername = new Cookie("username", email);
				Cookie cPassword = new Cookie("password", password);
				
				cRemember.setMaxAge(60 * 60 * 24 * 14);
				cUsername.setMaxAge(60 * 60 * 24 * 14);
				cPassword.setMaxAge(60 * 60 * 24 * 14);
				
				response.addCookie(cRemember);
				response.addCookie(cUsername);
				response.addCookie(cPassword);
			}
			
			response.sendRedirect("homeClient");
		} else {
			request.setAttribute("username", email);
			request.setAttribute("password", email);
			request.setAttribute("msgerr", "Sai thông tin đăng nhập");
			request.getRequestDispatcher("loginClient.jsp").forward(request, response);
		}
	}

}
