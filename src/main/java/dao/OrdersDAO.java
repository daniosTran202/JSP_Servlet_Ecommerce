package dao;

import java.util.List;

import entity.Order;
import entity.Pagination;

public interface OrdersDAO {
	List<Order> getAll();
	Pagination<Order> getByName(int page , int pageSize,String key);
	Order findId(Object id);
	Order add(Order o);
	Order edit(Order o);
	boolean remove(Object id);
}
