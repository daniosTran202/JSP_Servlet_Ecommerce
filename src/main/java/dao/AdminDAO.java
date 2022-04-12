package dao;

import java.util.List;

import entity.Admin;

public interface AdminDAO {
	Admin login(String Cemail, String Cpass);
}
