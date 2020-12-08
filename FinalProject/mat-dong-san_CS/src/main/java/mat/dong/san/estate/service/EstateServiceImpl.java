package mat.dong.san.estate.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mat.dong.san.estate.dao.EstateDAO;
import mat.dong.san.estate.vo.Estate;
import mat.dong.san.member.vo.Member;
import mat.dong.san.estate.vo.SearchCondition;
import mat.dong.san.estate.vo.Note;
import mat.dong.san.estate.vo.PageInfo;
import mat.dong.san.estate.vo.ProductApplication;
import mat.dong.san.estate.vo.Review;


@Service("eService")
public class EstateServiceImpl implements EstateService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EstateDAO eDAO;

	@Override
	public Estate selectEstate(String p_id) {
		return eDAO.selectEstate(sqlSession, p_id);
	}

	@Override
	public int insertMessage(Note note) {
		return eDAO.insertMessage(sqlSession, note);
	}

	@Override
	public int getReviewCount(int e_id) {
		return eDAO.getReviewCount(sqlSession, e_id);
	}

	@Override
	public ArrayList<Review> selectReviewList(int e_id, PageInfo pi) {
		
		return eDAO.selectReviewList(sqlSession, e_id, pi);
	}
	
	@Override
	public int getTotalEstatePoint(int e_id) {
		return eDAO.getTotalEstatePoint(sqlSession, e_id);
	}

	@Override
	public int reviewIdCheck(String us_id, int e_id) {
		return eDAO.reviewIdCheck(sqlSession, us_id, e_id);
	}

	@Override
	public int updateEstatePoint(int e_id, float avg) {
		return eDAO.updateEstatePoint(sqlSession, e_id, avg);
		
	}

	@Override
	public int insertReview(Review review) {
		return eDAO.insertReview(sqlSession, review);
		
	}

	@Override
	public int deleteReview(int er_id) {
		return eDAO.deleteReview(sqlSession, er_id);
	}

	@Override
	public Estate selectEstateInfo(String us_id) {
		return eDAO.selectEstateInfo(sqlSession, us_id);
	}

	@Override
	public int updateMember(Member m) {
		return eDAO.updateMember(sqlSession, m);
	}
	
	@Override
	public int mdelete(String us_id) {
		return eDAO.mdelete(sqlSession, us_id);
	}
	
	@Override
	public int updateEstate(Estate e) {
		return eDAO.updateEstate(sqlSession, e);
	}

	@Override
	public int edelete(int e_id) {
		return eDAO.edelete(sqlSession, e_id);
	
	}

	@Override
	public int checkEstate(String us_id) {
		return eDAO.checkEstate(sqlSession, us_id);
	}

	@Override
	public int getNoteCount(int e_id) {
		return eDAO.getNoteCount(sqlSession, e_id);
	}

	@Override
	public ArrayList<Note> selectNoteList(int e_id, PageInfo pi) {
		return eDAO.selectNoteList(sqlSession, e_id, pi);
	}

	@Override
	public int getSearchNoteListCount(SearchCondition sc, int e_id) {
		return eDAO.getSearchNoteListCount(sqlSession, sc, e_id);
	}

	@Override
	public ArrayList<Note> selectSearchNoteList(SearchCondition sc, PageInfo pi, int e_id) {
		return eDAO.selectSearchNoteList(sqlSession, sc, pi, e_id);
	}

	@Override
	public ArrayList<ProductApplication> selectPropertyList(int e_id, PageInfo pi) {
		return eDAO.selectPropertyList(sqlSession, e_id, pi);
	}

	@Override
	public int getPropertyListCount(int e_id) {
		return eDAO.getPropertyListCount(sqlSession, e_id);
	}

	@Override
	public int getSearchPropertyListCount(SearchCondition sc, int e_id) {
		return eDAO.getSearchPropertyListCount(sqlSession, sc, e_id);
	}

	@Override
	public ArrayList<ProductApplication> selectSearchPropertyList(SearchCondition sc, PageInfo pi, int e_id) {
		return eDAO.selectSearchPropertyList(sqlSession, sc, pi, e_id);
	}

	@Override
	public int cancelProductApplication(int a_id) {
		return eDAO.cancelProductApplication(sqlSession, a_id);
	}

	@Override
	public int cancelProduct(int p_id) {
		return eDAO.cancelProduct(sqlSession, p_id);
	}

	@Override
	public int getSearchProductApplicationListCount(SearchCondition sc, int e_id) {
		return eDAO.getSearchProductApplicationListCount(sqlSession, sc, e_id);
	}
	
	@Override
	public ArrayList<ProductApplication> selectSearchProductApplicationList(SearchCondition sc, PageInfo pi, int e_id) {
		return eDAO.selectSearchProductApplicationList(sqlSession, sc, pi, e_id);
	}

	@Override
	public int acceptProductApplication(int a_id) {
		return eDAO.acceptProductApplication(sqlSession, a_id);
	}

	@Override
	public int registProduct(int p_id) {
		return eDAO.registProduct(sqlSession, p_id);
	}

	
}
