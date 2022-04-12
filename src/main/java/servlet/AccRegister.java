package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAOImpl;
import dao.ProductDAOImpl;
import entity.Account;
import entity.Product;


@WebServlet("/AccRegister")
public class AccRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AccountDAOImpl adao;
       
  
    public AccRegister() {
        super();
        adao = new AccountDAOImpl();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		 String view = "notfound.jsp";
		 String name = request.getParameter("name");
		 String email = request.getParameter("email");
		 String address = request.getParameter("address");
		 String password = request.getParameter("password");
		 Date created_at = Date.valueOf(request.getParameter("created_at"));
		 int role = Integer.parseInt(request.getParameter("role"));
		 Account acc = new Account();
		 acc.setName(name);
		 acc.setEmail(email);
		 acc.setAddress(address);
		 acc.setPassword(password);
		 acc.setCreated_at((java.sql.Date) created_at);
		 acc.setRole(role);
		 
		 if(adao.register(acc) != null) {
			 adao.register(acc);
			 view = "loginClient.jsp";
		 }else {
			 request.setAttribute("err", "Register failed. Try Again !");
			 request.setAttribute("ac", acc);
			 view = "register.jsp";
		 }
		 request.getRequestDispatcher(view).forward(request, response);
		 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
