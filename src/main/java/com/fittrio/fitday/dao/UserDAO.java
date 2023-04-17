package com.fittrio.fitday.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserDAO {
	
	String getNickNameByUserSeq(int userSeq);
}
