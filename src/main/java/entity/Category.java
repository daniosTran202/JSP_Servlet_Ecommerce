package entity;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Category {
	private int id;
	private String name;
	private int status;
	private int parentId;
	
	public Category() {
		
	}
	
	public Category(ResultSet rs) throws SQLException {
		setId(rs.getInt("id"));
		setName(rs.getString("name"));
		setStatus(rs.getInt("status"));
		setParentId(rs.getInt("parentId"));
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	
	
}
