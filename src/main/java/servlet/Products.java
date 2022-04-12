package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.If;

import dao.CategoryDAOImpl;
import dao.ProductDAOImpl;
import entity.Category;
import entity.Pagination;
import entity.Product;

@WebServlet("/Products")
public class Products extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Products() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		ProductDAOImpl pdao = new ProductDAOImpl();
		
		String view ="not-found.jsp";
		switch (action) {
		case "index":
			String key = request.getParameter("key");
			Pagination<Product> pagination;
			String pageNumber = request.getParameter("page");
			int page = pageNumber == null ? 1 : Integer.parseInt(pageNumber);
			int pageSize = 5;
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
			view = "admin_view/product/listPro.jsp";
			break;
		case "findId":
			String id = request.getParameter("id");
			Product p = pdao.findId(id);
			List<Category> lstCat= new CategoryDAOImpl().getAll();
			request.setAttribute("lstCat", lstCat);
			request.setAttribute("p", p);
			view = "admin_view/product/edit.jsp";
			break;
		case "viewAdd":
			List<Category> catelist =new CategoryDAOImpl().getAll();
			request.setAttribute("cateAdd", catelist);
			view = "admin_view/product/add.jsp";
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
			 
			 int categoryId = 0;
			 if(request.getParameter("categoryId").isEmpty()) {
				 check = true;
				 request.setAttribute("errCategoryId", "Danh mục sản phẩm không được để trống !");
			 }else {
				 try {
					 int tmpCategoryId =  Integer.parseInt(request.getParameter("categoryId"));
					 if(tmpCategoryId > 0) {
						 categoryId = tmpCategoryId;
					 }else{
						 request.setAttribute("errCategoryId", "Danh mục sản phẩm phải lớn hơn 0 !");
					 }
				} catch (NumberFormatException e) {
					request.setAttribute("errCategoryId", "Danh mục sản phẩm phải là số !");
				}
			 }
			 
			 String image = null;
			 if(request.getParameter("image").isEmpty()) {
				 check = true;
				 request.setAttribute("errImage","Ảnh sản phẩm không được để trống !");
			 }else {
				 image = request.getParameter("image");
			 }
			 
			 String description = null;
			 if(request.getParameter("description").isEmpty()) {
				 check = true;
				 request.setAttribute("errDescription","Mô tả sản phẩm không được để trống !");
			 }else {
				 description = request.getParameter("description");
			 }
			 
			 float price = 0;
			 if(request.getParameter("price").isEmpty()) {
				 check = true;
				 request.setAttribute("errPrice", "Giá sản phẩm không được để trống !");
			 }else {
				 try {
					 float tmpPrice =  Float.parseFloat(request.getParameter("price"));
					 if(tmpPrice > 10) {
						 price = tmpPrice;
					 }else{
						 request.setAttribute("errPrice", "Giá phải lớn hơn 10 !");
					 }
				} catch (NumberFormatException e) {
					request.setAttribute("errPrice", "Giá phải là số !");
				}
			 }
			 
			 float sale_price = 0;
			 if(request.getParameter("sale_price").isEmpty()) {
				 check = true;
				 request.setAttribute("errSPrice", "Giá khuyến mãi không được để trống !");
			 }else {
				 try {
					 float tmpSPrice =  Float.parseFloat(request.getParameter("price"));
					 if(sale_price < price && tmpSPrice > 0) {
						 sale_price = tmpSPrice;
					 }else{
						 check = true;
						 request.setAttribute("errSPrice", "Giá khuyến mãi phải nhỏ hơn giá cũ và lớn hơn 0 !");
					 }
				} catch (NumberFormatException e) {
					check = true;
					request.setAttribute("errSPrice", "Giá khuyến mãi phải là số !");
				}
			 }
			 Date created_at = Date.valueOf(request.getParameter("created_at"));
			 
			 String Pstatus = request.getParameter("status") ;
			 int status = 0;
			 if(Pstatus == null || Pstatus.length() == 0 || Pstatus.equals(" ")) {
				 check = true;
				 request.setAttribute("errStatus", "Trạng thái sản phẩm không được để trống !");
			 }else {
				  status =  Integer.parseInt(Pstatus);
			 }
			 Product pro = new Product();
			 pro.setName(name);
			 pro.setCategoryId(categoryId);
			 pro.setImage(image);
			 pro.setDescription(description);
			 pro.setPrice(price);
			 pro.setSale_price(sale_price);
			 pro.setCreated_at((java.sql.Date) created_at);
			 pro.setStatus(status);
			 
			 if(pdao.add(pro) != null) {
				 pdao.add(pro);
				 view = "Products?action=index";
			 }else {
				 request.setAttribute("p", pro); 
				 request.setAttribute("err", "Insert failed. Try Again !");
				 view = "admin_view/product/add.jsp";
			 }
			
			break;
		case "update":
			 int id1 = Integer.parseInt(request.getParameter("id"));

			 boolean _check = false;
			 
			 String _name = null ;
			 Pattern _ptName = Pattern.compile("^[.[^$(\\)\\[\\]\\{\\}]]{5,32}");
			 Matcher _mName = _ptName.matcher(request.getParameter("name"));
			 if(request.getParameter("name").isEmpty()) {
				 check = true;
				 request.setAttribute("errName","Tên sản phẩm không được để trống !");
			 }else if(!_mName.matches()) {
				 check = true;
				 request.setAttribute("errName","Tên sản phẩm phải từ 5-32 kí tự !");
			 }else {
				 _name = request.getParameter("name");
			 }
			 
			 int _categoryId = 0;
			 if(request.getParameter("categoryId").isEmpty()) {
				 _check = true;
				 request.setAttribute("errCategoryId", "Danh mục sản phẩm không được để trống !");
			 }else {
				 try {
					 int _tmpCategoryId =  Integer.parseInt(request.getParameter("categoryId"));
					 if(_tmpCategoryId > 0) {
						 _categoryId = _tmpCategoryId;
					 }else{
						 request.setAttribute("errCategoryId", "Danh mục sản phẩm phải lớn hơn 0 !");
					 }
				} catch (NumberFormatException e) {
					request.setAttribute("errCategoryId", "Danh mục sản phẩm phải là số !");
				}
			 }
			 
			 String _image = null;
			 if(request.getParameter("image").isEmpty()) {
				 _check = true;
				 request.setAttribute("errImage","Ảnh sản phẩm không được để trống !");
			 }else {
				 _image = request.getParameter("image");
			 }
			 
			 String _description = null;
			 if(request.getParameter("description").isEmpty()) {
				 _check = true;
				 request.setAttribute("errDescription","Mô tả sản phẩm không được để trống !");
			 }else {
				 _description = request.getParameter("description");
			 }
			 
			 float _price = 0;
			 if(request.getParameter("price").isEmpty()) {
				 check = true;
				 request.setAttribute("errPrice", "Giá sản phẩm không được để trống !");
			 }else {
				 try {
					 float _tmpPrice =  Float.parseFloat(request.getParameter("price"));
					 if(_tmpPrice > 10) {
						 _price = _tmpPrice;
					 }else{
						 request.setAttribute("errPrice", "Giá phải lớn hơn 10 !");
					 }
				} catch (NumberFormatException e) {
					request.setAttribute("errPrice", "Giá phải là số !");
				}
			 }
			 
			 float _sale_price = 0;
			 if(request.getParameter("sale_price").isEmpty()) {
				 check = true;
				 request.setAttribute("errSPrice", "Giá khuyến mãi không được để trống !");
			 }else {
				 try {
					 float _tmpSPrice =  Float.parseFloat(request.getParameter("price"));
					 if(_sale_price < _price && _tmpSPrice > 0) {
						 _sale_price = _tmpSPrice;
					 }else{
						 _check = true;
						 request.setAttribute("errSPrice", "Giá khuyến mãi phải nhỏ hơn giá cũ và lớn hơn 0 !");
					 }
				} catch (NumberFormatException e) {
					check = true;
					request.setAttribute("errSPrice", "Giá khuyến mãi phải là số !");
				}
			 }
			 Date _created_at = Date.valueOf(request.getParameter("created_at"));
			 
			 String _Pstatus = request.getParameter("status") ;
			 int _status = 0;
			 if(_Pstatus == null || _Pstatus.length() == 0 || _Pstatus.equals(" ")) {
				 check = true;
				 request.setAttribute("errStatus", "Trạng thái sản phẩm không được để trống !");
			 }else {
				  _status =  Integer.parseInt(_Pstatus);
			 }
			 

			 
			 Product _pro = new Product();
			 _pro.setId(id1);
			 _pro.setName(_name);
			 _pro.setCategoryId(_categoryId);
			 _pro.setImage(_image);
			 _pro.setDescription(_description);
			 _pro.setPrice(_price);
			 _pro.setSale_price(_sale_price);
			 _pro.setCreated_at((java.sql.Date) _created_at);
			 _pro.setStatus(_status);
			 
			 if(_check == false) {
				 pdao.edit(_pro);
				 view = "Products?action=index";
			 }else {
				 request.setAttribute("p", _pro); 
				 request.setAttribute("err", "Update failed. Try Again !");
				 view = "admin_view/product/edit.jsp";
			 }
			break;
		case "remove":
			int r_id = Integer.parseInt(request.getParameter("r_id"));

			 boolean bl = pdao.remove(r_id);
			 if(bl) {
			 view = "Products?action=index";
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
