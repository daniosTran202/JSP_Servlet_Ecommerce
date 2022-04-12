package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAOImpl;
import entity.Product;
import model.CartsItem;

@WebServlet("/Carts")
public class Carts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDAOImpl pdao;
	
    public Carts() {
        super();
        pdao = new ProductDAOImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		int proId = Integer.parseInt(request.getParameter("id"));
		//tạo giỏ hàng
		List<CartsItem> carts = new ArrayList<>();
		if(session.getAttribute("carts") != null) {
			carts = (List<CartsItem>) session.getAttribute("carts");
		}
		switch (action) {
			case "add": 
				Product p = pdao.findId(proId);
				CartsItem ct = new  CartsItem(p,1);
				//thêm vào giỏ
				boolean status = true;
				for (CartsItem cart : carts) {
					if(cart.getProduct().getId() == proId) {
						cart.setQuantity(cart.getQuantity() + ct.getQuantity());
						status = false; // đã trùng id
					}
				}
				
				if(status) {
					carts.add(ct);
				}
				break;
			case "edit":
				int qty = Integer.parseInt(request.getParameter("qty"));
				// tìm và update số lượng
				for (CartsItem cart : carts) {
					if(cart.getProduct().getId() == proId) {
						cart.setQuantity(qty);
						break;
					}
				}
				break;
			case "remove":
				carts.removeIf(x -> x.getProduct().getId() == proId);
				break;
			default:
				break;
		}
		
		// lưu giỏ hàng vào session
		session.setAttribute("carts", carts);
		request.setAttribute("carts", carts);
		request.getRequestDispatcher("cart.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	

}
