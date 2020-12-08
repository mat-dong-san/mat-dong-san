package com.san.dong.productApplication.model.service;

import java.util.ArrayList;

import com.san.dong.member.model.vo.MemberPageInfo;
import com.san.dong.productApplication.model.vo.ProductApplication;
import com.san.dong.productApplication.model.vo.ProductApplicationSearch;

public interface ProductApplicationService {

	int getProductApplicationListCount(ProductApplicationSearch pas);

	ArrayList<ProductApplication> selectProductApplicationList(ProductApplicationSearch pas, MemberPageInfo pi);

}
