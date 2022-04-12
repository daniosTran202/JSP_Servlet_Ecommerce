package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import entity.Category;
import entity.Pagination;
import entity.Product;
import sqlConnect.DBConnect;

public class CategoryDAOImpl implements CategoryDAO {
	Connection conn;
	public CategoryDAOImpl() {
		conn = DBConnect.getConnect();
	}
	@Override
	public List<Category> getAll() {
		List<Category> list = new ArrayList<Category>();
		try {
			CallableStatement cs = conn.prepareCall("{call Categories_Select()}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Category c = new Category(rs);
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public Pagination<Category> getByName(int page,int pageSize,String key) {
		Pagination<Category> pagination = new Pagination<Category>(page, pageSize);
		List<Category> data = new ArrayList<>();
		try {
			CallableStatement cs = conn.prepareCall("{call search_cates(?,?,?,?)}");
			cs.setInt(1, page);
			cs.setInt(2, pageSize);
			cs.registerOutParameter(3, Types.INTEGER);
			cs.setString(4,key);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Category c = new Category(rs);
				data.add(c);
			}
			pagination.setTotalPages(cs.getInt(3));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		pagination.setData(data);
		return pagination;
	}
	@Override
	public Category findId(Object id) {
		try {
			CallableStatement cs = conn.prepareCall("{call Categories_GetById(?)}");
			cs.setObject(1,id);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Category c = new Category(rs);
				return c;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public Category add(Category c) {
		try {
			CallableStatement cs = conn.prepareCall("{call Categories_Insert(?,?,?)}");
			cs.setString(1, c.getName());
			cs.setInt(2, c.getStatus());
			cs.setInt(3, c.getParentId());
			cs.executeUpdate();
			return c;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public Category edit(Category c) {
		try {
			CallableStatement cs = conn.prepareCall("{call Categories_Update(?,?,?,?)}");
			cs.setInt(1, c.getId());
			cs.setString(2, c.getName());
			cs.setInt(3, c.getStatus());
			cs.setInt(4, c.getParentId());
			cs.executeUpdate();
			return c;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public boolean remove(Object id) {
		try {
			CallableStatement cs = conn.prepareCall("{call Categories_Delete(?)}");
			cs.setObject(1,id);
			cs.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Pagination<Category> toPagination(int page, int pageSize) {
		Pagination<Category> pagination = new Pagination<Category>(page, pageSize);
		List<Category> data = new ArrayList<>();
		try {
			CallableStatement cs = conn.prepareCall("{call Cates_Pagination(?,?,?)}");
			cs.setInt(1, page);
			cs.setInt(2, pageSize);
			cs.registerOutParameter(3, Types.INTEGER);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Category c = new Category(rs);
				data.add(c);
			}
			pagination.setTotalPages(cs.getInt(3));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		pagination.setData(data);
		return pagination;
	}

	
}
