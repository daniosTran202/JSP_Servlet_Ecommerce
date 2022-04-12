package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAOImpl;
import entity.Product;
import model.CartsItem;

@WebServlet("/ProDetail")
public class ProDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDAOImpl pdao;

    public ProDetail() {
        super();
        pdao = new ProductDAOImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int proId = Integer.parseInt(request.getParameter("id"));
		Product details = pdao.findId(proId);
		request.setAttribute("details", details);
		request.getRequestDispatcher("product-details.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
