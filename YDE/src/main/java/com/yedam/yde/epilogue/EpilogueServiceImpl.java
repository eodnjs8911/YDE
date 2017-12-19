package com.yedam.yde.epilogue;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EpilogueServiceImpl implements EpilogueService {
	
	@Autowired EpilogueDAO epilogueDAO;
	
	@Override
	public void insert(EpilogueVO vo) {
		// TODO Auto-generated method stub
		epilogueDAO.insert(vo);
	}

	@Override
	public void delete(EpilogueVO vo) {
		// TODO Auto-generated method stub
		epilogueDAO.delete(vo);
	}

	@Override
	public void update(EpilogueVO vo) {
		// TODO Auto-generated method stub
		epilogueDAO.update(vo);
	}

	@Override
	public EpilogueVO selectOne(EpilogueVO vo) {
		// TODO Auto-generated method stub
		return epilogueDAO.selectOne(vo);
	}

	@Override
	public List<EpilogueVO> selectList() {
		// TODO Auto-generated method stub
		return epilogueDAO.selectList();
	}

}
