package entity;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Order {
	private int id;
	private int accountId;
	private float totalPrice;
	private Date order_date;
	private int status;
	
	public Order() {
	}
	
	public Order(ResultSet rs) throws SQLException {
		setId(rs.getInt("id"));
		setAccountId(rs.getInt("accountId"));
		setTotalPrice(rs.getInt("totalPrice"));
		setOrder_date(rs.getDate("order_date"));
		setStatus(rs.getInt("status"));
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
