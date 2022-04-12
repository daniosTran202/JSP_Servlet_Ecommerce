package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import entity.Account;
import entity.Pagination;
import entity.Product;
import sqlConnect.DBConnect;

public class AccountDAOImpl implements AccountDAO {
	
	Connection conn;
	public AccountDAOImpl() {
		conn = DBConnect.getConnect();
	}
	@Override
	public List<Account> getAll() {
		List<Account> list = new ArrayList<Account>();
		try {
			CallableStatement cs = conn.prepareCall("{call Accounts_Select()}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Account a = new Account(rs);
				list.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Account login(String Cemail, String Cpassword) {
		try {
			CallableStatement cs = conn.prepareCall("{call Procs_Login(?,?)}");
			cs.setString(1, Cemail);
			cs.setString(2, Cpassword);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Account ac = new Account(id, name, email);
				return ac;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public Account register(Account a) {
		try {
			CallableStatement cs = conn.prepareCall("{call AccRegister(?,?,?,?,?,?)}");
			cs.setString(1, a.getName());
			cs.setString(2, a.getEmail());
			cs.setString(3, a.getAddress());
			cs.setString(4, a.getPassword());
			cs.setDate(5, a.getCreated_at());
			cs.setInt(6, a.getRole());
			cs.executeUpdate();
			return a;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public Account findId(Object id) {
		try {
			CallableStatement cs = conn.prepareCall("{call Accounts_SelectById(?)}");
			cs.setObject(1,id);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Account p = new Account(rs);
				return p;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Account add(Account p) {
		try {
			CallableStatement cs = conn.prepareCall("{call Accounts_Insert(?,?,?,?,?)}");
			cs.setString(1, p.getName());
			cs.setString(2, p.getEmail());
			cs.setString(3, p.getAddress());
			cs.setString(4, p.getPassword());
			cs.setInt(5, p.getRole());
			cs.executeUpdate();
			return p;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public Account edit(Account p) {
		try {
			CallableStatement cs = conn.prepareCall("{call Accounts_Update(?,?,?,?,?,?)}");
			cs.setInt(1, p.getId());
			cs.setString(2, p.getName());
			cs.setString(3, p.getEmail());
			cs.setString(4, p.getAddress());
			cs.setString(5, p.getPassword());
			cs.setInt(6, p.getRole());
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
			CallableStatement cs = conn.prepareCall("{call Accounts_Delete(?)}");
			cs.setObject(1,id);
			cs.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public Pagination<Account> getByName(int page,int pageSize,String key) {
		Pagination<Account> pagination = new Pagination<Account>(page, pageSize);
		List<Account> data = new ArrayList<>();
		try {
			CallableStatement cs = conn.prepareCall("{call search_acc(?,?,?,?)}");
			cs.setInt(1, page);
			cs.setInt(2, pageSize);
			cs.registerOutParameter(3, Types.INTEGER);
			cs.setString(4,key);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Account p = new Account(rs);
				data.add(p);
			}
			pagination.setTotalPages(cs.getInt(3));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		pagination.setData(data);
		return pagination;
	}
	
	public Pagination<Account> toPagination(int page, int pageSize) {
		Pagination<Account> pagination = new Pagination<Account>(page, pageSize);
		List<Account> data = new ArrayList<>();
		try {
			CallableStatement cs = conn.prepareCall("{call Acc_Pagination(?,?,?)}");
			cs.setInt(1, page);
			cs.setInt(2, pageSize);
			cs.registerOutParameter(3, Types.INTEGER);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Account p = new Account(rs);
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
