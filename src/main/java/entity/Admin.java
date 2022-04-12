package entity;

import java.util.Date;

public class Admin {
	private int id;
	private String username;
	private String email;
	private int phone;
	private short role;
	private Date created_at;
	private String password;
	private short status;
	
	public Admin(int id, String username, String email, int phone, short role, Date created_at, String password,
			short status) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.phone = phone;
		this.role = role;
		this.created_at = created_at;
		this.password = password;
		this.status = status;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public short getRole() {
		return role;
	}
	public void setRole(short role) {
		this.role = role;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public short getStatus() {
		return status;
	}
	public void setStatus(short status) {
		this.status = status;
	}
	
}
