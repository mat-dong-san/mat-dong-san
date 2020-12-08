package com.san.dong.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.san.dong.member.model.vo.MemberPageInfo;
import com.san.dong.member.model.vo.MemberSearch;
import com.san.dong.product.model.dao.ProductDAO;
import com.san.dong.product.model.vo.Product;

@Service("pService")
public class ProductServicelmpl implements ProductService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProductDAO pDAO;
	
	@Override
	public int postRoom(Product p) {
		return pDAO.postRoomConfirm(sqlSession, p);
	}

	@Override
	public Product selectBoardDetail(String us_id) {
		return (Product)pDAO.selectBoardDetail(sqlSession, us_id);
	}

	@Override
	public int productListCount(MemberSearch ms) {
		return pDAO.productListCount(sqlSession, ms);
	}

	@Override
	public ArrayList<Product> selectProductList(MemberSearch ms, MemberPageInfo ppi ) {
		return pDAO.selectProductList(sqlSession, ms, ppi);
	}

	@Override
	public int getProductListCount() {
		return pDAO.getProductListCount(sqlSession);
	}

}
