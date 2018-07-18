package com.bjhr.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bjhr.bean.PageBean;
import com.bjhr.bean.User;
import com.bjhr.config.ResponseUtil;
import com.bjhr.config.StringUtil;
import com.bjhr.serviceImpl.UserServiceImpl;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import redis.clients.util.IOUtils;



@Controller
@RequestMapping("/user") // url:/模块/资源/{id}/细分 /seckill/list
public class UserController {

	@Autowired
	private UserServiceImpl userService;

	@RequestMapping(value = "/selectAll", method = RequestMethod.GET)
	private String list(Model model) {
		List<User> list = userService.selectAll();
		model.addAttribute("list", list);
		for (User user : list) {
			System.out.println("userName: "+user.getUserName());
		}
		return "list";// WEB-INF/jsp/"list".jsp
	}
	
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	private String userList(Model model) {
		return "userList";// WEB-INF/jsp/"list".jsp
	}
	
    /** 
     * 添加或者修改 
     * @param user 
     * @param res 
     * @return 
     * @throws Exception 
     */  
    @RequestMapping("/saveOrUpdate")  
    public void saveOrUpdate(User user,HttpServletResponse res) throws Exception{  
        //操作记录条数，初始化为0  
        int resultTotal = 0;
        System.out.println("userId: "+user.getUserId());
        System.out.println("userName: "+user.getUserName());
        if (user.getUserId() == null || "".equals(user.getUserId().toString())) {  
            resultTotal = userService.save(user);  
        }else{  
            resultTotal = userService.update(user);  
        }  
        JSONObject jsonObject = new JSONObject(); 
        if(resultTotal > 0){   //说明修改或添加成功  
            jsonObject.put("success", true);  
        }else{  
            jsonObject.put("success", false);  
        }  
        ResponseUtil.write(res, jsonObject);  
    }  
	
    /** 
     * 用户分页查询 
     * @param page 
     * @param rows 
     * @param s_user 
     * @param res 
     * @return 
     * @throws Exception 
     */  
    @RequestMapping("/list")  
    public void list(@RequestParam(value="page",required=false) String page,@RequestParam(value="rows",required=false) String rows,User s_user,HttpServletResponse res) throws Exception{  
        PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));  
        Map<String,Object> map=new HashMap<String,Object>(); 
        System.out.println("+++++++++++++++++++++++++++: "+s_user.getUserTel());
        map.put("userName",StringUtil .formatLike(s_user.getUserName())); 
        map.put("userTel", StringUtil .formatLike(s_user.getUserTel()));
        map.put("start", pageBean.getStart());  
        map.put("size", pageBean.getPageSize());  
        List<User> userList=userService.find(map);  
        Long total=userService.getTotal(map);  
        JSONObject result=new JSONObject();  
        JSONArray jsonArray=JSONArray.fromObject(userList);  
        result.put("rows", jsonArray);  
        result.put("total", total);  
        ResponseUtil.write(res, result);  
    }  
	
    /** 
     * 删除用户 
     * @param ids 
     * @param res 
     * @return 
     * @throws Exception 
     */  
    @RequestMapping("/deleteUsers")  
    public void delete(@RequestParam(value="ids") String ids,HttpServletResponse res) throws Exception{  
        String[] idStr = ids.split(",");  
        JSONObject jsonObject = new JSONObject();  
        for (String id : idStr) {  
            userService.delete(Integer.parseInt(id));  
        }  
        jsonObject.put("success", true);  
        ResponseUtil.write(res, jsonObject);  
    }
    
    
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@RequestBody User user){
		System.out.println("user+++++++: "+user.getUserName());
		int rs = userService.save(user);  
		System.out.println("+++++++++++++++++++:"+rs);
		return "saveSuccess";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int userId){
		userService.delete(userId);  
		return "deleteSuccess";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = {
	"application/json; charset=utf-8" })
	@ResponseBody
	public User update(@RequestBody User user){
		userService.update(user);  
		return user;
	}
	
	@RequestMapping(value = "/update2",method = RequestMethod.POST, produces = {
	"application/json; charset=utf-8" })
	@ResponseBody
	public User update2(@RequestBody User user){
		userService.update2(user);  
		return user;
	}
		
/*	@RequestMapping(value = "/selectById", method = RequestMethod.GET)
	public String selectById(Model model ,int userId){
		
		model.addAttribute("selectById", userService.selectById(userId));
		
		return "selectById";
	}*/
	
	@RequestMapping(value = "/selectById", method = RequestMethod.GET)
	@ResponseBody
	public User selectById(int userId){
		return userService.selectById(userId);
	}
	
/*	@RequestMapping(value = "/select1", method = RequestMethod.GET)
	public List<User> select1(String useNname , String userTel){
		//PageHelper.startPage(pageNum, pageSize);
		return userService.select1(useNname , userTel);
	}*/

}
