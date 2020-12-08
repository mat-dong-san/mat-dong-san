package mat.dong.san.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mat.dong.san.model.dao.HomeDAO;
import mat.dong.san.product.model.vo.Product;

@Service("hService")
public class HomeServiceImpl implements HomeService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private HomeDAO hDAO;
	
	@Override
	public ArrayList<Product> selectProductTop() {

		return hDAO.selectProductTop(sqlSession);
	}
}
