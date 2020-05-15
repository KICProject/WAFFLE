package com.waffle.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.waffle.dao.AduDAO;
import com.waffle.vo.AduVO;

@Service
public class AduServiceImpl implements AduService {
	
	@Inject
	AduDAO adudao;
	@Override
	public void updateAdu(AduVO aduVO) throws Exception {
		// TODO Auto-generated method stub
		
		adudao.updateAdu(aduVO);
	}

}
