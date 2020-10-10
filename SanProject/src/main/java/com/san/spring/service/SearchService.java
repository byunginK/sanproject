package com.san.spring.service;

import java.util.HashMap;
import java.util.List;

import com.san.spring.dto.BbsDto;

public interface SearchService {

	List<BbsDto> getSearchList(HashMap<String, Object> map);
}
