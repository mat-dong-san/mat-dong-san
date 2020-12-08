package com.san.dong.productApplication.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.san.dong.member.model.vo.MemberPageInfo;
import com.san.dong.productApplication.model.vo.ProductApplication;
import com.san.dong.productApplication.model.vo.ProductApplicationSearch;

@Repository("paDAO")
public class ProductApplicationDAO {

	public int getProductApplicationListCount(SqlSessionTemplate sqlSession, ProductApplicationSearch pas) {
		return sqlSession.selectOne("productApplicationMapper.getProductApplicationListCount", pas);
	}

	public ArrayList<ProductApplication> selectProductApplicationList(SqlSessionTemplate sqlSession,
			ProductApplicationSearch pas, MemberPageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getMemberLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getMemberLimit());
		
		return (ArrayList)sqlSession.selectList("productApplicationMapper.selectProductApplicationList" , pas , rowBounds);
	}

}
