package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAOImpl;
import dao.ProductDAOImpl;
import entity.Pagination;
import entity.Product;
import entity.Category;

@WebServlet("/ShopClient")
public class ShopClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ShopClient() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ProductDAOImpl pdao = new ProductDAOImpl();
		CategoryDAOImpl cdao = new CategoryDAOImpl();
		List<Category> cate = cdao.getAll();
		Pagination<Product> dataShop;
		String key = request.getParameter("key");
		String pageNumber = request.getParameter("page");
		int page = pageNumber == null ? 1 : Integer.parseInt(pageNumber);
		int pageSize = 6;
		
		String action = request.getParameter("action");
		switch (action) {
		case "paginate": 
			if(key != null && !key.isEmpty()) {
				dataShop = pdao.getByName(page, pageSize,key);
				request.setAttribute("shop", dataShop);
				request.setAttribute("cateData", cate);
				request.setAttribute("total", dataShop.getTotalPages());
				request.setAttribute("currentPage", dataShop.getPage());
				request.setAttribute("key",key);
			}else {
				dataShop = pdao.toPagination(page, pageSize);
				request.setAttribute("shop", dataShop);
				request.setAttribute("cateData", cate);
				request.setAttribute("total", dataShop.getTotalPages());
				request.setAttribute("currentPage", dataShop.getPage());
			}
			break;
			
		case "catePro": 
			int cateId = Integer.parseInt(request.getParameter("cateId"));
			dataShop = pdao.findIdCate(cateId);
			request.setAttribute("shop", dataShop);
			request.setAttribute("cateData", cate);
			request.setAttribute("cateId", cateId);
			request.setAttribute("total", dataShop.getTotalPages());
			request.setAttribute("currentPage", dataShop.getPage());
			request.setAttribute("key",key);
			break;
		default:
			break;
		}

		request.getRequestDispatcher("shop.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
