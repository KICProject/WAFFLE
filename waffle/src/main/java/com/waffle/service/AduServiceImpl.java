package com.waffle.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.waffle.dao.AduDAO;
import com.waffle.vo.AduVO;

@Service
public class AduServiceImpl implements AduService {
	
	@Inject
	AduDAO adudao;
	
	//�½��� 
	@Override
	public void updateAdu(AduVO aduVO) throws Exception {
		// TODO Auto-generated method stub
		
		adudao.updateAdu(aduVO);
	}
	
	//���� DB
	@Override
	public String lightView() throws Exception {
	// TODO Auto-generated method stub
	return adudao.lightView();
	}
	//���� db���� 
	@Override
	public void lightonoff(AduVO aduVO) throws Exception {
		adudao.lightonoff(aduVO);
		
	}
	@Override
	public String tvView() throws Exception {
		// TODO Auto-generated method stub
		return adudao.tvView();
	}
	
	@Override
	public void tvonoff(AduVO aduVO) throws Exception {
		// TODO Auto-generated method stub
		adudao.tvonoff(aduVO);
		
	}
	@Override
	public String airView() throws Exception {
		// TODO Auto-generated method stub
		return adudao.airView();
	}
	
	@Override
	public void aironoff(AduVO aduVO) throws Exception {
		// TODO Auto-generated method stub
		adudao.aironoff(aduVO);
		
	}
	@Override
	public String windowView() throws Exception {
		// TODO Auto-generated method stub
		return adudao.windowView();
	}
	@Override
	public void windowonoff(AduVO aduVO) throws Exception {
		adudao.windowonoff(aduVO);
		
	}
	
}
