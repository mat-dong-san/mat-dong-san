package com.san.dong.productApplication.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.san.dong.member.model.vo.MemberPageInfo;
import com.san.dong.productApplication.model.dao.ProductApplicationDAO;
import com.san.dong.productApplication.model.vo.ProductApplication;
import com.san.dong.productApplication.model.vo.ProductApplicationSearch;

@Service("paService")
public class ProductApplicationServicelmpl implements ProductApplicationService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProductApplicationDAO paDAO;

	@Override
	public int getProductApplicationListCount(ProductApplicationSearch pas) {
		return paDAO.getProductApplicationListCount(sqlSession , pas);
	}

	@Override
	public ArrayList<ProductApplication> selectProductApplicationList(ProductApplicationSearch pas, MemberPageInfo pi) {
		return paDAO.selectProductApplicationList(sqlSession, pas, pi);
	}

}
