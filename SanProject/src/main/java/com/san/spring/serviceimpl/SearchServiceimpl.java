package com.san.spring.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.san.spring.dao.SearchDao;
import com.san.spring.dto.BbsDto;
import com.san.spring.service.SearchService;

@Service
public class SearchServiceimpl implements SearchService {

	@Autowired
	SearchDao searchDao;
	
	@Override
	public List<BbsDto> getSearchList(HashMap<String, Object> map) {
		
		List<BbsDto> list = searchDao.getSearchList(map);
		List<BbsDto> searchList = new ArrayList<BbsDto>();
		for (int i = 0; i < list.size(); i++) {
			BbsDto dto = list.get(i);
			String[] imgs = dto.getImgname().split("-");
			dto.setImgs(imgs);
			
			/*
			//시퀀스에 대한 좋아요 개수 넣기
			int like = likeCount(dto.getPost_number());
			dto.setLikecount(like);
			*/
			searchList.add(dto);
		}
		
		return searchList;
	}

}
