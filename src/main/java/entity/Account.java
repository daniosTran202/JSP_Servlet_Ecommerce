package entity;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Account {
	private int id ;
	private String name;
	private String email;
	private String address;
	private String password;
	private Date created_at;
	private int role;
	
	
	public Account(int id, String name, String email, String address, String password, Date created_at, int role) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.address = address;
		this.password = password;
		this.created_at = created_at;
		this.role = role;
	}
	
	
	public Account(int id, String name, String email) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
	}
	
	public Account() {
		
	}
	
	public Account(ResultSet rs) throws SQLException {
		setId(rs.getInt("id"));
		setName(rs.getString("name"));
		setEmail(rs.getString("email"));
		setAddress(rs.getString("address"));
		setPassword(rs.getString("password"));
		setCreated_at(rs.getDate("created_at"));
		setRole(rs.getInt("role"));
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}


	
	
}
