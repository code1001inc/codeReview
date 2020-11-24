package com.KDTR.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.KDTR.aop.AuthorityCheck;
import com.KDTR.service.ComCodeMngService;

@RestController
@RequestMapping("/A_ComCodeMng")
public class ComCodeMngController {
	@Autowired
	public ComCodeMngService comCodeMngService;
	
	//최초 페이지 접속
	@RequestMapping("")
	@AuthorityCheck
	public ModelAndView ComCodeMng(@RequestParam("PGMCOD") String PGMCOD, @RequestParam("PGMNAM") String PGMNAM, HttpSession session){
		ModelAndView mv = new ModelAndView(PGMCOD);
		mv.addObject("PGMNAM", PGMNAM);
		mv.addObject("PGMCOD", PGMCOD);
		return mv;
	}
	
	//Select - get
	@RequestMapping(value="/BASTER", method=RequestMethod.GET)
	public HashMap<String, Object> getBaster(@RequestParam("TRKIND") String TRKIND){
    	return comCodeMngService.selectBaster(TRKIND); 
	}
	
	//Insert - post
	@RequestMapping(value="/BASTER", method=RequestMethod.POST)
	public HashMap<String, Object> postBaster(@RequestBody HashMap<String, String> param){
		return comCodeMngService.insertBaster(param); 
	}
	
	//Update - put
	@RequestMapping(value="/BASTER", method=RequestMethod.PUT)
	public HashMap<String, Object> putBaster(@RequestBody HashMap<String, String> param){
		return comCodeMngService.updateBaster(param); 
	}
	
	//Delete - delete
	@RequestMapping(value="/BASTER", method=RequestMethod.DELETE)
	public HashMap<String, Object> deleteBaster(@RequestBody HashMap<String, String> param){
		return comCodeMngService.deleteBaster(param); 
	}
}
