package com.example.demo.controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.mapper.UserProfileMapper;
import com.example.demo.model.UserProfile;

@RestController
public class UserProfileController {
//	private Map<String, UserProfile> userMap;
//	
//	@PostConstruct
//	public void init() {
//		userMap = new HashMap<String, UserProfile>();
//		userMap.put("67", new UserProfile("67", "사원", "맹정열", "070-7166-1725"));
//		userMap.put("70", new UserProfile("70", "사원", "엄예지", "070-7166-1709"));
//		userMap.put("71", new UserProfile("71", "사원", "천수영", "070-7166-1705"));
//	}
	
	private UserProfileMapper mapper;
	
	public UserProfileController(UserProfileMapper mapper) {
		this.mapper = mapper;
	}
	
	@GetMapping("/user/{id}")
	public UserProfile getUserProfile(@PathVariable("id") String id) {
		//return userMap.get(id);
		return mapper.getUserProfile(id);
	}
	
	@GetMapping("/user/all")
	public List<UserProfile> getUserProfileList() {
		//return new ArrayList<UserProfile>(userMap.values());
		return mapper.getUserProfileList();
	}
	
	@PutMapping("/user/{id}")
	public void putUserProfile(@PathVariable("id") String id, @RequestParam("grade") String grade, @RequestParam("name") String name, @RequestParam String phone) {
		//UserProfile userProfile = new UserProfile(id, grade, name, phone);
		//userMap.put(id, userProfile);
		mapper.putUserProfile(id, grade, name, phone);
	}
	
	@PostMapping("/user/{id}")
	public void postUserProfile(@PathVariable("id") String id, @RequestParam("grade") String grade, @RequestParam("name") String name, @RequestParam String phone) {
//		UserProfile userProfile = userMap.get(id);
//		userProfile.setGrade(grade);
//		userProfile.setName(name);
//		userProfile.setPhone(phone);
		mapper.postUserProfile(id, grade, name, phone);
	}
	
	@DeleteMapping("/user/{id}")
	public void deleteUserProfile(@PathVariable("id") String id) {
//		userMap.remove(id);
		mapper.deleteUser(id);
	}
}
