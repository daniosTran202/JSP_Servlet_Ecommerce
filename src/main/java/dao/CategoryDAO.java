package dao;

import java.util.List;

import entity.Category;
import entity.Pagination;
import entity.Product;

public interface CategoryDAO {
	List<Category> getAll();
	Pagination<Category> getByName(int page,int pageSize,String key);
	Category findId(Object id);
	Category add(Category c);
	Category edit(Category c);
	boolean remove(Object id);
}
