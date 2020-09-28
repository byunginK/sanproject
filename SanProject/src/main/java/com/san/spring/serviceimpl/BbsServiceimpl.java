package com.san.spring.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.san.spring.dao.BbsDao;
import com.san.spring.dto.BbsDto;
import com.san.spring.dto.BbsLikeDto;
import com.san.spring.service.BbsService;

@Service
public class BbsServiceimpl implements BbsService {
	
	@Autowired
	private BbsDao bbsDao;

	@Override
	public List<BbsDto> allBbsList() {
		
		List<BbsDto> list = bbsDao.allBbsList();
		List<BbsDto> bbslist = new ArrayList<BbsDto>();
		for (int i = 0; i < list.size(); i++) {
			BbsDto dto = list.get(i);
			String[] imgs = dto.getImgname().split("-");
			dto.setImgs(imgs);
			
			bbslist.add(dto);
		}
		return bbslist;
	}

	@Override
	public int getBbsCount(BbsDto bbsDtd) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean addBbs(BbsDto bbsDto) {
		System.out.println("ServiceImpl addBbs");
		return bbsDao.addBbs(bbsDto);
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

	@Override
	public int getLikeCount(int seq) {
		// TODO Auto-generated method stub
		return 0;
	}

}
