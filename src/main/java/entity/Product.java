package entity;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Product {
	private int id;
	private String name;
	private  int categoryId;
	private String categoryName;
	private String image;
	private String description;
	private float price;
	private float sale_price;
	private Date created_at;
	private int status;
	
	public Product() {
		
	}
	
	public Product(ResultSet rs) throws SQLException {
		setId(rs.getInt("id"));
		setName(rs.getString("name"));
		setCategoryId(rs.getInt("categoryId"));
		setImage(rs.getString("image"));
		setDescription(rs.getString("description"));
		setPrice(rs.getFloat("price"));
		setSale_price(rs.getFloat("sale_price"));
		setCreated_at(rs.getDate("created_at"));
		setCategoryName(rs.getString("categoryName"));
		setStatus(rs.getInt("status"));
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
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getSale_price() {
		return sale_price;
	}
	public void setSale_price(float sale_price) {
		this.sale_price = sale_price;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	
	
	
}
