package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import entity.Admin;
import sqlConnect.DBConnect;

public class AdminDAOImpl implements AdminDAO {
	Connection conn;
	public AdminDAOImpl() {
		conn = DBConnect.getConnect();
	}
	
	@Override
	public Admin login(String AdEmail, String AdPass) {
		try {
			CallableStatement cs = conn.prepareCall("{call Admin_Login(?,?)}");
			cs.setString(1, AdEmail);
			cs.setString(2, AdPass);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				 int id = rs.getInt("id");
				 String username = rs.getString("username");
				 String email = rs.getString("email");
				 int phone = rs.getInt("phone");
				 short role = rs.getShort("role");
				 Date created_at = new Date (rs.getDate("created_at").getTime());
				 String password = rs.getString("password");
				 short status = rs.getShort("status");
				 
				 Admin ad = new Admin(id,username,email,phone,role,created_at,password,status);
				return ad;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	

}
