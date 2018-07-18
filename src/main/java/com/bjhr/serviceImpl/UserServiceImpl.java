package com.bjhr.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bjhr.bean.User;
import com.bjhr.dao.UserDao;
import com.bjhr.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao userDao;
	
    public List<User> find(Map<String, Object> map) {  
         return userDao.find(map);  
    }  
  
    public Long getTotal(Map<String, Object> map) {  
         return userDao.getTotal(map);  
    }
	
	@Transactional
	public int save(User User){
		return userDao.save(User);
	}
	
	@Transactional
	public int delete(int id){
		return userDao.delete(id);
	}
	
	@Transactional
	public int update(User User){
		return userDao.update(User);
	}
	
	@Transactional
	public int update2(User User){
		return userDao.update2(User);
	}
	
	public List<User> selectAll(){
		return userDao.selectAll();
	}
	
	public User selectById(int id){
		return userDao.selectById(id);
	}
	
	public List<User> select1(String name , String userTel){
		return userDao.select1(name , userTel);
	}

}
