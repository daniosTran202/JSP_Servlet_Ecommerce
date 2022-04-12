package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import java.sql.Types;

import entity.Pagination;

import entity.Category;
import entity.Product;
import sqlConnect.DBConnect;

public class ProductDAOImpl implements ProductDAO {
	Connection conn;
	public ProductDAOImpl() {
		conn = DBConnect.getConnect();
	}
	@Override
	public List<Product> getAll() {
		List<Product> list = new ArrayList<Product>();
		try {
			CallableStatement cs = conn.prepareCall("{call Products_Select()}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Product p = new Product(rs);
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public Product findId(Object id) {
		try {
			CallableStatement cs = conn.prepareCall("{call Products_SelectById(?)}");
			cs.setObject(1,id);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Product p = new Product(rs);
				return p;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Product add(Product p) {
		try {
			CallableStatement cs = conn.prepareCall("{call Products_Insert(?,?,?,?,?,?,?,?)}");
			cs.setString(1, p.getName());
			cs.setInt(2, p.getCategoryId());
			cs.setString(3, p.getImage());
			cs.setString(4, p.getDescription());
			cs.setFloat(5, p.getPrice());
			cs.setFloat(6, p.getSale_price());
			cs.setDate(7, p.getCreated_at());
			cs.setInt(8, p.getStatus());
			cs.executeUpdate();
			return p;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public Product edit(Product p) {
		try {
			CallableStatement cs = conn.prepareCall("{call Products_Update(?,?,?,?,?,?,?,?,?)}");
			cs.setInt(1, p.getId());
			cs.setString(2, p.getName());
			cs.setInt(3, p.getCategoryId());
			cs.setString(4, p.getImage());
			cs.setString(5, p.getDescription());
			cs.setFloat(6, p.getPrice());
			cs.setFloat(7, p.getSale_price());
			cs.setDate(8, p.getCreated_at());
			cs.setInt(9, p.getStatus());
			cs.executeUpdate();
			return p;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public boolean remove(Object id) {
		try {
			CallableStatement cs = conn.prepareCall("{call Products_Delete(?)}");
			cs.setObject(1,id);
			cs.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public Pagination<Product> getByName(int page,int pageSize,String key) {
		Pagination<Product> pagination = new Pagination<Product>(page, pageSize);
		List<Product> data = new ArrayList<>();
		try {
			CallableStatement cs = conn.prepareCall("{call search_page(?,?,?,?)}");
			cs.setInt(1, page);
			cs.setInt(2, pageSize);
			cs.registerOutParameter(3, Types.INTEGER);
			cs.setString(4,key);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Product p = new Product(rs);
				data.add(p);
			}
			pagination.setTotalPages(cs.getInt(3));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		pagination.setData(data);
		return pagination;
	}
	
	public Pagination<Product> toPagination(int page, int pageSize) {
		Pagination<Product> pagination = new Pagination<Product>(page, pageSize);
		List<Product> data = new ArrayList<>();
		try {
			CallableStatement cs = conn.prepareCall("{call Procs_Pagination(?,?,?)}");
			cs.setInt(1, page);
			cs.setInt(2, pageSize);
			cs.registerOutParameter(3, Types.INTEGER);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Product p = new Product(rs);
				data.add(p);
			}
			pagination.setTotalPages(cs.getInt(3));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		pagination.setData(data);
		return pagination;
	}
	
	public Pagination<Product> findIdCate(int cateId) {
		Pagination<Product> pagination = new Pagination<Product>();
		List<Product> data = new ArrayList<>();
		try {
			CallableStatement cs = conn.prepareCall("{call Products_GetByCateId(?)}");
			cs.setObject(1,cateId);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Product p = new Product(rs);
				data.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		pagination.setData(data);
		return pagination;
	}

	
}
