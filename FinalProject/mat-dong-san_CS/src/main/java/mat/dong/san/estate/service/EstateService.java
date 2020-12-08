package mat.dong.san.estate.service;

import java.util.ArrayList;

import mat.dong.san.estate.vo.Estate;
import mat.dong.san.member.vo.Member;
import mat.dong.san.estate.vo.SearchCondition;
import mat.dong.san.estate.vo.Note;
import mat.dong.san.estate.vo.PageInfo;
import mat.dong.san.estate.vo.ProductApplication;
import mat.dong.san.estate.vo.Review;

public interface EstateService {

	Estate selectEstate(String p_id);

	int insertMessage(Note note);

	int getReviewCount(int e_id);

	ArrayList<Review> selectReviewList(int e_id, PageInfo pi);

	int getTotalEstatePoint(int e_id);

	int reviewIdCheck(String us_id, int e_id);

	int updateEstatePoint(int e_id, float avg);

	int insertReview(Review review);

	int deleteReview(int er_id);

	Estate selectEstateInfo(String us_id);
	
	int updateMember(Member m);
	
	int mdelete(String us_id);

	int updateEstate(Estate e);

	int edelete(int e_id);

	int checkEstate(String us_id);

	int getNoteCount(int e_id);

	ArrayList<Note> selectNoteList(int e_id, PageInfo pi);

	int getSearchNoteListCount(SearchCondition sc, int e_id);

	ArrayList<Note> selectSearchNoteList(SearchCondition sc, PageInfo pi, int e_id);

	ArrayList<ProductApplication> selectPropertyList(int e_id, PageInfo pi);

	int getPropertyListCount(int e_id);

	int getSearchPropertyListCount(SearchCondition sc, int e_id);

	ArrayList<ProductApplication> selectSearchPropertyList(SearchCondition sc, PageInfo pi, int e_id);

	int cancelProductApplication(int a_id);

	int cancelProduct(int p_id);

	int getSearchProductApplicationListCount(SearchCondition sc, int e_id);

	ArrayList<ProductApplication> selectSearchProductApplicationList(SearchCondition sc, PageInfo pi, int e_id);

	int acceptProductApplication(int a_id);

	int registProduct(int p_id);
	
}
