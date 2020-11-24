package mat.dong.san.product.service;

import java.util.ArrayList;

import mat.dong.san.member.vo.EstateAgent;
import mat.dong.san.product.vo.Note;
import mat.dong.san.product.vo.PageInfo;
import mat.dong.san.product.vo.Review;

public interface ProductService {

	EstateAgent selectEstateAgent(String p_id);

	int insertMessage(Note note);

	int getReviewCount(int e_id);

	ArrayList<Review> selectReviewList(int e_id, PageInfo pi);

	int getTotalEstateAgentPoint(int e_id);

	int reviewIdCheck(String us_id, int e_id);

	int updateEstateAgentPoint(int e_id, float avg);

	int insertReview(Review review);

	int deleteReview(int er_id);


	
}
