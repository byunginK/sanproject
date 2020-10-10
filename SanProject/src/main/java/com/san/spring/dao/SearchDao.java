package com.san.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.san.spring.dto.BbsDto;

public interface SearchDao {

	List<BbsDto> getSearchList(HashMap<String, Object> map);
}
