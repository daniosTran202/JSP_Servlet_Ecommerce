package dao;

import java.util.List;

import entity.Pagination;
import entity.Product;

public interface ProductDAO {
	List<Product> getAll();
	Pagination<Product> getByName(int page , int pageSize,String key);
	Product findId(Object id);
	Product add(Product p);
	Product edit(Product p);
	boolean remove(Object id);
}
