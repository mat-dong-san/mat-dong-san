package mat.dong.san.product.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mat.dong.san.product.dao.ProductDAO;


@Service("pService")
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProductDAO pDAO;

	
}
