package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAOImpl;
import dao.OrderDAOImpl;
import entity.Category;
import entity.Order;
import entity.Pagination;

@WebServlet("/Orders")
public class Orders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Orders() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		OrderDAOImpl pdao = new OrderDAOImpl();
		
		String view ="not-found.jsp";
		switch (action) {
		case "index":
			String key = request.getParameter("key");
			Pagination<Order> pagination;
			String pageNumber = request.getParameter("page");
			int page = pageNumber == null ? 1 : Integer.parseInt(pageNumber);
			int pageSize = 4;
			if(key != null && ! key.isEmpty()) {
				pagination = pdao.getByName(page, pageSize,key);
				request.setAttribute("pagination", pagination);
				request.setAttribute("total", pagination.getTotalPages());
				request.setAttribute("key",key);
			}else {
				pagination = pdao.toPagination(page, pageSize);
				request.setAttribute("pagination", pagination);
				request.setAttribute("total", pagination.getTotalPages());
			}
			view = "admin_view/order/listOrder.jsp";
			break;
		case "findId":
			String id = request.getParameter("id");
			Order p = pdao.findId(id);
			List<Category> lstCat= new CategoryDAOImpl().getAll();
			request.setAttribute("lstCat", lstCat);
			request.setAttribute("p", p);
			view = "admin_view/order/edit.jsp";
			break;
		case "viewAdd":
			List<Category> catelist =new CategoryDAOImpl().getAll();
			request.setAttribute("cateAdd", catelist);
			view = "admin_view/order/add.jsp";
			break;
		case "create":
			
			 int accountId = Integer.parseInt(request.getParameter("accountId"));
			 Float total_price = Float.parseFloat(request.getParameter("total_price"));
			 Date order_date = Date.valueOf(request.getParameter("order_date"));
			 int status = Integer.parseInt(request.getParameter("status"));
			 Order pro = new Order();
			 pro.setAccountId(accountId);
			 pro.setTotalPrice(total_price);
			 pro.setOrder_date((java.sql.Date) order_date);
			 pro.setStatus(status);
			 
			 if(pdao.add(pro) != null) {
				 pdao.add(pro);
				 view = "Orders?action=index";
			 }else {
				 request.setAttribute("err", "Insert failed. Try Again !");
				 view = "admin_view/order/add.jsp";
			 }
			
			break;
		case "update":
			 int id1 = Integer.parseInt(request.getParameter("id"));
			 Boolean isOk = false;
			 int _accountId = Integer.parseInt(request.getParameter("accountId"));
			 Float _total_price = Float.parseFloat(request.getParameter("total_price"));
			 Date _order_date = Date.valueOf(request.getParameter("order_date"));
			 int _status = Integer.parseInt(request.getParameter("status"));
			 
			 Order _pro = new Order();
			 _pro.setAccountId(_accountId);
			 _pro.setTotalPrice(_total_price);
			 _pro.setOrder_date((java.sql.Date) _order_date);
			 _pro.setStatus(_status);
			 

		
			 if(isOk == false) {
				 pdao.edit(_pro);
				 view = "Orders?action=index";
			 }else {
				 request.setAttribute("p", _pro); 
				 request.setAttribute("err", "Update failed. Try Again !");
				 view = "admin_view/order/edit.jsp";
			 }
			break;
		case "remove":
			int r_id = Integer.parseInt(request.getParameter("r_id"));

			 boolean bl = pdao.remove(r_id);
			 if(bl) {
			 view = "Orders?action=index";
			 }else {
			 request.setAttribute("err", "Delete failed!");
			 }
			break;
		default:
			view = "admin_view/not-found.jsp";
			break;
		}
		request.getRequestDispatcher(view).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
