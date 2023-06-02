package com.board.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {

	String idOver(String id);

	String emailOver(String email);

	String nickOver(String nickName);

	int join(HashMap<String, Object> params);

}
