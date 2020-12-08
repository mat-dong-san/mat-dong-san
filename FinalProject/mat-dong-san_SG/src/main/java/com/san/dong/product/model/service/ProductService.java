package com.san.dong.product.model.service;

import java.util.ArrayList;

import com.san.dong.member.model.vo.MemberPageInfo;
import com.san.dong.member.model.vo.MemberSearch;
import com.san.dong.product.model.vo.Product;

public interface ProductService {

	int postRoom(Product b);

	// 제품 정보
	Product selectBoardDetail(String us_id);

	int productListCount(MemberSearch ms);

	ArrayList<Product> selectProductList(MemberSearch ms, MemberPageInfo ppi);

	int getProductListCount();
}
