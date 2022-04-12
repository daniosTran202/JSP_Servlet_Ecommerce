package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AccountLoginAction")
public class AccountLoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AccountLoginAction() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie arrCk[] = request.getCookies();
		for (int i = 0; i < arrCk.length; i++) {
			System.out.println("\t>>>>> "+arrCk[i].getName() + ": "+ arrCk[i].getValue());
			if(arrCk[i].getName().equals("email")) {
				request.setAttribute("email", arrCk[i].getValue());
			}
			if(arrCk[i].getName().equals("password")) {
				request.setAttribute("password", arrCk[i].getValue());
			}
			if(arrCk[i].getName().equals("remember")) {
				request.setAttribute("remember", arrCk[i].getValue());
			}
		}
		
		request.getRequestDispatcher("loginClient.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
