package com.bjhr.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.bjhr.bean.User;

public interface UserDao {
	
    public List<User> find(Map<String, Object> map);
  
    public Long getTotal(Map<String, Object> map);

	public int save(User User);
	
	public int delete(int userId);
	
	public int update(User User);
	
	public int update2(User User);
	
	public List<User> selectAll();
	
	public User selectById(int userId);
	
	public List<User> select1(@Param("userName")String userName , @Param("UserTel")String UserTel);

}
