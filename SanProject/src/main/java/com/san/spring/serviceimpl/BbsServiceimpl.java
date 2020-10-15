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


	public List<BbsDto> allBbsList(BbsDto bbsDto) {
		
		List<BbsDto> list = bbsDao.allBbsList(bbsDto);
		List<BbsDto> bbslist = new ArrayList<BbsDto>();
		for (int i = 0; i < list.size(); i++) {
			BbsDto dto = list.get(i);
			String[] imgs = dto.getImgname().split("-");
			dto.setImgs(imgs);
			
			//시퀀스에 대한 좋아요 개수 넣기
			int like = likeCount(dto.getPost_number());
			dto.setLikecount(like);
			
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
		
			BbsDto dto = bbsDao.getBbs(seq);
			String[] imgs = dto.getImgname().split("-");
			dto.setImgs(imgs);
			
			//시퀀스에 대한 좋아요 개수 넣기
			int like = likeCount(dto.getPost_number());
			dto.setLikecount(like);
			
		return dto;
	}

	@Override
	public boolean removeBbs(String seq) {
		return bbsDao.removeBbs(seq);
	}

	@Override
	public int updateBbs(BbsDto bbsDto) {
		return bbsDao.updateBbs(bbsDto);
	}


	@Override
	public int getLikeCount(int seq) {
		return bbsDao.getLikeCount(seq);
	}

	@Override
	public int checkLike(BbsLikeDto bbsLike) {
		BbsLikeDto dto = bbsDao.checkLike(bbsLike);	// check 만약 1이면 좋아요를 눌렀다는것이고 0이면 안누른 상태
		System.out.println(dto);
		if(dto == null) {
			bbsDao.addLike(bbsLike);
			return 1;
		}
		else {
			bbsDao.updateLike(dto);
			BbsLikeDto like = bbsDao.checkLike(dto);
			return like.getLike_count();
	
		}
	}

	@Override
	public int likeCount(int post_number) {
		return bbsDao.likeCount(post_number);
	}

}
