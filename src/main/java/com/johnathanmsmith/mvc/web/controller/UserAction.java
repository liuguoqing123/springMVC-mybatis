package com.johnathanmsmith.mvc.web.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;  
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;  

@Controller  
//��������һ�����Ʋ���  
public class UserAction {  
  @RequestMapping(value = "/toLogin.do")  
  //��Ӧindex.jsp�ĵ�¼����  
  public String login(ModelMap map){ 
	  System.out.println("����ȷʵ˧��");
      return "login";  
  }
  
  @RequestMapping(value = "/model")
  @ResponseBody
  @CrossOrigin
  public ModelAndView  model(HttpServletRequest request,HttpServletResponse response) throws IOException{
	  ModelAndView modelAndView = new ModelAndView("index");
	/* Model model = new Model();
	 model.setAge(18);
	 model.setName("lewis");*/
	 //PrintWriter out  = response.getWriter();
	 //out.println(model);
	  ModelMap map = new ModelMap();
		map.put("id", 1);
		map.put("userName", "userName");
		modelAndView.addAllObjects(map);
	 return modelAndView;
  }
}  
