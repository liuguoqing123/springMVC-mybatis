package com.bjhr.service;

import java.util.List;
import java.util.Map;

import com.bjhr.bean.User;

/**
 * 业务接口：站在"使用者"角度设计接口 三个方面：方法定义粒度，参数，返回类型（return 类型/异常）
 */
public interface UserService {
	
    public List<User> find(Map<String, Object> map);
  
    public Long getTotal(Map<String, Object> map) ;
	
	public int save(User User);
	
	public int delete(int id);
	
	public int update(User User);
	
	public int update2(User User);
	
	public List<User> selectAll();
	
	public User selectById(int id);
	
	public List<User> select1(String name , String userTel);

}
