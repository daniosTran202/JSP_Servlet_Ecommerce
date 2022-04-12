package dao;

import java.util.List;

import entity.Account;
import entity.Pagination;
import entity.Product;

public interface AccountDAO {
	Account login(String Cemail, String Cpass);
	List<Account> getAll();
	Account register(Account a);
	Pagination<Account> getByName(int page , int pageSize,String key);
	Account findId(Object id);
	Account add(Account p);
	Account edit(Account p);
	boolean remove(Object id);
}
