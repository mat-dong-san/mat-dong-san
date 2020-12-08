package mat.dong.san.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import mat.dong.san.product.model.vo.Product;

@Repository("hDAO")
public class HomeDAO {

	public ArrayList<Product> selectProductTop(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("SearchRoomMapper.selectTopList");
	}

}
