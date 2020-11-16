package mat.dong.san.product.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import mat.dong.san.product.vo.Product;

@Repository("pDAO")
public class ProductDAO {

	public Product selectProductRoom(SqlSessionTemplate sqlSession, Product p) {
		
		return sqlSession.selectOne("productMapper.selectProductRoom", p);
	}

}
