package com.san.dong.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.san.dong.member.model.vo.MemberPageInfo;
import com.san.dong.member.model.vo.MemberSearch;
import com.san.dong.product.model.vo.Product;

@Repository("pDAO")
public class ProductDAO {

	public int postRoomConfirm(SqlSessionTemplate sqlSession, Product p) {
		
		/* return (Product)sqlSession.selectOne("ProductMapper.memberLogin", m); */
		return sqlSession.insert("productMapper.postRoom", p);
	}

	// 회원의 매물 가져오기
	public Product selectBoardDetail(SqlSessionTemplate sqlSession, String us_id) {
		return (Product) sqlSession.selectOne("productMapper.selectBoardDetail", us_id);
	}

	// 매물 카운트 가져오기
	public int productListCount(SqlSessionTemplate sqlSession, MemberSearch ms) {
		return sqlSession.selectOne("productMapper.productListCount", ms);
	}

	// 회원의 매물 리스트
	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession, MemberSearch ms, MemberPageInfo ppi) {
		int offset = (ppi.getCurrentPage() - 1) * ppi.getMemberLimit();
		RowBounds rowBounds = new RowBounds(offset, ppi.getMemberLimit());
		
		return (ArrayList)sqlSession.selectList("productMapper.selectProductList" , ms, rowBounds);
	}
}
