package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import entity.Order;
import entity.Pagination;
import sqlConnect.DBConnect;

public class OrderDAOImpl implements OrdersDAO {
	Connection conn;
	public OrderDAOImpl() {
		conn = DBConnect.getConnect();
	}
	@Override
	public List<Order> getAll() {
		List<Order> list = new ArrayList<Order>();
		try {
			CallableStatement cs = conn.prepareCall("{call Orders_Select()}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Order p = new Order(rs);
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public Order findId(Object id) {
		try {
			CallableStatement cs = conn.prepareCall("{call Orders_SelectById(?)}");
			cs.setObject(1,id);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Order p = new Order(rs);
				return p;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Order add(Order p) {
		try {
			CallableStatement cs = conn.prepareCall("{call Orders_Insert(?,?,?,?)}");
			cs.setInt(1, p.getAccountId());
			cs.setFloat(2, p.getTotalPrice());
			cs.setDate(3, p.getOrder_date());
			cs.setInt(4, p.getStatus());
			cs.executeUpdate();
			return p;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public Order edit(Order p) {
		try {
			CallableStatement cs = conn.prepareCall("{call Orders_Update(?,?,?,?)}");
			cs.setInt(1, p.getAccountId());
			cs.setFloat(2, p.getTotalPrice());
			cs.setDate(3, p.getOrder_date());
			cs.setInt(4, p.getStatus());
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
			CallableStatement cs = conn.prepareCall("{call Orders_Delete(?)}");
			cs.setObject(1,id);
			cs.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public Pagination<Order> getByName(int page,int pageSize,String key) {
		Pagination<Order> pagination = new Pagination<Order>(page, pageSize);
		List<Order> data = new ArrayList<>();
		try {
			CallableStatement cs = conn.prepareCall("{call search_Orders(?,?,?,?)}");
			cs.setInt(1, page);
			cs.setInt(2, pageSize);
			cs.registerOutParameter(3, Types.INTEGER);
			cs.setString(4,key);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Order p = new Order(rs);
				data.add(p);
			}
			pagination.setTotalPages(cs.getInt(3));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		pagination.setData(data);
		return pagination;
	}
	
	public Pagination<Order> toPagination(int page, int pageSize) {
		Pagination<Order> pagination = new Pagination<Order>(page, pageSize);
		List<Order> data = new ArrayList<>();
		try {
			CallableStatement cs = conn.prepareCall("{call Orders_Pagination(?,?,?)}");
			cs.setInt(1, page);
			cs.setInt(2, pageSize);
			cs.registerOutParameter(3, Types.INTEGER);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Order p = new Order(rs);
				data.add(p);
			}
			pagination.setTotalPages(cs.getInt(3));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		pagination.setData(data);
		return pagination;
	}
}
