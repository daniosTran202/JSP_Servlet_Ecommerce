package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAOImpl;
import entity.Pagination;
import entity.Product;



@WebServlet("/AdPagintePro")
public class AdPagintePro extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDAOImpl pdao;
	
    public AdPagintePro() {
        super();
        this.pdao = new ProductDAOImpl();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageNumber = request.getParameter("page");
		int page = pageNumber == null ? 1 : Integer.parseInt(pageNumber);
		int pageSize = 2;
		
		Pagination<Product> pagination = pdao.toPagination(page, pageSize);
		request.setAttribute("pagination", pagination);
		request.setAttribute("total", pagination.getTotalPages());
		request.getRequestDispatcher("product/lstPro.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
