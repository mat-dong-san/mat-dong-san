package com.san.dong.product.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.san.dong.product.model.dao.ProductDAO;
import com.san.dong.product.model.vo.Product;


@Service("pService")
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProductDAO pDAO;

	@Override
	public Product selectProductRoom(Product p) {
		return pDAO.selectProductRoom(sqlSession, p);
	}
}
