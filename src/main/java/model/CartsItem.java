package model;

import entity.Product;

public class CartsItem {
	private Product product;
	private int quantity;
	
	public CartsItem() {
		super();
	}
	
	
	public CartsItem(Product product, int quantity) {
		super();
		this.product = product;
		this.quantity = quantity;
	}


	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
}
