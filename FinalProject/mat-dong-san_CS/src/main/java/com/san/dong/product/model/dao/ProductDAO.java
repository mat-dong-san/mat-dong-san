package com.san.dong.product.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.san.dong.product.model.vo.Product;

@Repository("pDAO")
public class ProductDAO {

	public Product selectProductRoom(SqlSessionTemplate sqlSession, Product p) {
		
		return sqlSession.selectOne("productMapper.selectProductRoom", p);
	}

}
