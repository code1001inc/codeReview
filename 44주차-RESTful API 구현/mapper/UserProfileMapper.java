package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.model.UserProfile;

@Mapper
public interface UserProfileMapper {
	@Select("SELECT * FROM CodeReview WHERE id=#{id}")
	UserProfile getUserProfile(@Param("id") String id);
	
	@Select("SELECT * FROM CodeReview")
	List<UserProfile> getUserProfileList();
	
	@Insert("INSERT INTO CodeReview VALUES(#{id}, #{grade}, #{name}, #{phone})")
	int putUserProfile(@Param("id") String id ,@Param("grade") String grade ,@Param("name") String name, @Param("phone") String phone);
	
	@Update("UPDATE CodeReview SET grade=#{grade}, name=#{name}, phone=#{phone} WHERE id=#{id}")
	int postUserProfile(@Param("id") String id ,@Param("grade") String grade ,@Param("name") String name, @Param("phone") String phone);
	
	@Delete("DELETE FROM CodeReview WHERE id=#{id}")
	int deleteUser(@Param("id") String id);
}
