package com.san.spring.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.san.spring.dao.BbsDao;
import com.san.spring.dto.BbsDto;
import com.san.spring.dto.BbsLikeDto;
import com.san.spring.service.BbsService;

@Service
public class BbsServiceimpl implements BbsService {
	
	//@Autowired
	//private BbsDao bbsDao;

	@Override
	public List<BbsDto> allBbsList(BbsDto bbsDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getBbsCount(BbsDto bbsDtd) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean addBbs(BbsDto bbsDto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public BbsDto getBbs(String seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean removeBbs(String seq) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateBbs(BbsDto bbsDto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addLike(BbsLikeDto bbsLike) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateLike(BbsLikeDto bbsLike) {
		// TODO Auto-generated method stub
		return false;
	}

}
