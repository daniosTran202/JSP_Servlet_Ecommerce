package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAOImpl;
import dao.CategoryDAOImpl;
import dao.ProductDAOImpl;
import entity.Account;
import entity.Category;
import entity.Pagination;
import entity.Product;

@WebServlet("/AccManage")
public class AccManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AccManage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		AccountDAOImpl pdao = new AccountDAOImpl();
		
		String view ="not-found.jsp";
		switch (action) {
		case "index":
			String key = request.getParameter("key");
			Pagination<Account> pagination;
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
			view = "admin_view/account/listAcc.jsp";
			break;
		case "findId":
			String id = request.getParameter("id");
			Account p = pdao.findId(id);
			List<Category> lstCat= new CategoryDAOImpl().getAll();
			request.setAttribute("lstCat", lstCat);
			request.setAttribute("p", p);
			view = "admin_view/account/edit.jsp";
			break;
		case "viewAdd":
			List<Account> catelist =new AccountDAOImpl().getAll();
			request.setAttribute("cateAdd", catelist);
			view = "admin_view/account/add.jsp";
			break;
		case "create":
			 boolean check = false;
			 
			 String name = null ;
			 Pattern ptName = Pattern.compile("^[.[^$(\\)\\[\\]\\{\\}]]{5,32}");
			 Matcher mName = ptName.matcher(request.getParameter("name"));
			 if(request.getParameter("name").isEmpty()) {
				 check = true;
				 request.setAttribute("errName","Tên sản phẩm không được để trống !");
			 }else if(!mName.matches()) {
				 check = true;
				 request.setAttribute("errName","Tên sản phẩm phải từ 5-32 kí tự !");
			 }else {
				 name = request.getParameter("name");
			 }
			 
			 String email = null ;
			 Pattern ptEmail = Pattern.compile("^[.[^$(\\)\\[\\]\\{\\}]]{5,32}");
			 Matcher mEmail = ptEmail.matcher(request.getParameter("email"));
			 if(request.getParameter("email").isEmpty()) {
				 check = true;
				 request.setAttribute("errEmail","Email không được để trống !");
			 }else if(!mEmail.matches()) {
				 check = true;
				 request.setAttribute("errEmail","Email phải từ 5-32 kí tự !");
			 }else {
				 email = request.getParameter("email");
			 }
			 
			 String address = null;
			 if(request.getParameter("address").isEmpty()) {
				 check = true;
				 request.setAttribute("errAddress","Ảnh sản phẩm không được để trống !");
			 }else {
				 address = request.getParameter("address");
			 }
			 
			 String password = null ;
			 Pattern ptPassword  = Pattern.compile("^[.[^$(\\)\\[\\]\\{\\}]]{5,32}");
			 Matcher mPassword = ptPassword.matcher(request.getParameter("password"));
			 if(request.getParameter("password").isEmpty()) {
				 check = true;
				 request.setAttribute("errPassword ","Email không được để trống !");
			 }else if(!mPassword.matches()) {
				 check = true;
				 request.setAttribute("errPassword ","Email phải từ 5-32 kí tự !");
			 }else {
				 password = request.getParameter("password");
			 }
			 
			 int role = 0;
			 if(request.getParameter("role").isEmpty()) {
				 check = true;
				 request.setAttribute("errRole", "Danh mục sản phẩm không được để trống !");
			 }else {
				 try {
					 int tmpRole=  Integer.parseInt(request.getParameter("role"));
					 if(tmpRole > 0) {
						 role = tmpRole;
					 }else{
						 request.setAttribute("errRole", "Danh mục sản phẩm phải lớn hơn 0 !");
					 }
				} catch (NumberFormatException e) {
					request.setAttribute("errRole", "Danh mục sản phẩm phải là số !");
				}
			 }
			 
			 Account pro = new Account();
			 pro.setName(name);
			 pro.setEmail(email);
			 pro.setAddress(address);
			 pro.setPassword(password);
			 pro.setRole(role);
			 
			 if(pdao.add(pro) != null) {
				 pdao.add(pro);
				 view = "AccManage?action=index";
			 }else {
				 request.setAttribute("p", pro); 
				 request.setAttribute("err", "Insert failed. Try Again !");
				 view = "admin_view/account/add.jsp";
			 }
			
			break;
		case "update":
			 int id1 = Integer.parseInt(request.getParameter("id"));

			 boolean _check = false;
			 
			 String _name = null ;
			 Pattern _ptName = Pattern.compile("^[.[^$(\\)\\[\\]\\{\\}]]{5,32}");
			 Matcher _mName = _ptName.matcher(request.getParameter("name"));
			 if(request.getParameter("name").isEmpty()) {
				 _check = true;
				 request.setAttribute("errName","Tên sản phẩm không được để trống !");
			 }else if(!_mName.matches()) {
				 _check = true;
				 request.setAttribute("errName","Tên sản phẩm phải từ 5-32 kí tự !");
			 }else {
				 _name = request.getParameter("name");
			 }
			 
			 String _email = null ;
			 Pattern _ptEmail = Pattern.compile("^[.[^$(\\)\\[\\]\\{\\}]]{5,32}");
			 Matcher _mEmail = _ptEmail.matcher(request.getParameter("email"));
			 if(request.getParameter("email").isEmpty()) {
				 _check = true;
				 request.setAttribute("errEmail","Email không được để trống !");
			 }else if(!_mEmail.matches()) {
				 _check = true;
				 request.setAttribute("errEmail","Email phải từ 5-32 kí tự !");
			 }else {
				 _email = request.getParameter("email");
			 }
			 
			 String _address = null;
			 if(request.getParameter("address").isEmpty()) {
				 _check = true;
				 request.setAttribute("errAddress","Ảnh sản phẩm không được để trống !");
			 }else {
				 _address = request.getParameter("address");
			 }
			 
			 String _password = null ;
			 Pattern _ptPassword  = Pattern.compile("^[.[^$(\\)\\[\\]\\{\\}]]{5,32}");
			 Matcher _mPassword = _ptPassword.matcher(request.getParameter("password"));
			 if(request.getParameter("password").isEmpty()) {
				 _check = true;
				 request.setAttribute("errPassword ","Email không được để trống !");
			 }else if(!_mPassword.matches()) {
				 _check = true;
				 request.setAttribute("errPassword ","Email phải từ 5-32 kí tự !");
			 }else {
				 _password = request.getParameter("password");
			 }
			 
			 int _role = 0;
			 if(request.getParameter("role").isEmpty()) {
				 _check = true;
				 request.setAttribute("errRole", "Danh mục sản phẩm không được để trống !");
			 }else {
				 try {
					 int _tmpRole=  Integer.parseInt(request.getParameter("role"));
					 if(_tmpRole > 0) {
						 _role = _tmpRole;
					 }else{
						 request.setAttribute("errRole", "Danh mục sản phẩm phải lớn hơn 0 !");
					 }
				} catch (NumberFormatException e) {
					request.setAttribute("errRole", "Danh mục sản phẩm phải là số !");
				}
			 }
			 

			 
			 Account _pro = new Account();
			 _pro.setId(id1);
			 _pro.setName(_name);
			 _pro.setEmail(_email);
			 _pro.setAddress(_address);
			 _pro.setPassword(_password);
			 _pro.setRole(_role);
			 
			 if(_check == false) {
				 pdao.edit(_pro);
				 view = "AccManage?action=index";
			 }else {
				 request.setAttribute("p", _pro); 
				 request.setAttribute("err", "Update failed. Try Again !");
				 view = "admin_view/account/edit.jsp";
			 }
			break;
		case "remove":
			int r_id = Integer.parseInt(request.getParameter("r_id"));

			 boolean bl = pdao.remove(r_id);
			 if(bl) {
			 view = "AccManage?action=index";
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
