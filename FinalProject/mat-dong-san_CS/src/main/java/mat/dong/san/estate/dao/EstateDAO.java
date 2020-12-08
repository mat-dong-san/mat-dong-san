package mat.dong.san.estate.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import mat.dong.san.estate.vo.Estate;
import mat.dong.san.member.vo.Member;
import mat.dong.san.estate.vo.SearchCondition;
import mat.dong.san.estate.vo.Note;
import mat.dong.san.estate.vo.PageInfo;
import mat.dong.san.estate.vo.ProductApplication;
import mat.dong.san.estate.vo.Review;

@Repository("eDAO")
public class EstateDAO {

	public Estate selectEstate(SqlSessionTemplate sqlSession, String p_id) {
		return sqlSession.selectOne("estateMapper.selectEstate", p_id);
	}

	public int insertMessage(SqlSessionTemplate sqlSession, Note note) {
		return sqlSession.insert("estateMapper.insertMessage", note);
	}

	public int getReviewCount(SqlSessionTemplate sqlSession, int e_id) {
		
		return sqlSession.selectOne("estateMapper.getReviewCount", e_id);
	}

	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, int e_id, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		System.out.println(rowBounds);
		
		return (ArrayList)sqlSession.selectList("estateMapper.selectReviewList", e_id, rowBounds);
	}

	public int getTotalEstatePoint(SqlSessionTemplate sqlSession, int e_id) {
		return sqlSession.selectOne("estateMapper.getTotalEstatePoint", e_id);
	}

	public int reviewIdCheck(SqlSessionTemplate sqlSession, @Param("us_id") String us_id, @Param("e_id") int e_id) {
		Map map = new HashMap();
		map.put( "us_id", us_id );
		map.put( "e_id", e_id );
		return sqlSession.selectOne("estateMapper.reviewIdCheck", map);
	}

	public int updateEstatePoint(SqlSessionTemplate sqlSession, @Param("e_id") int e_id, @Param("avg") double avg) {
		Map map = new HashMap();
		map.put( "e_id", e_id );
		map.put( "avg", avg );
		return sqlSession.update("estateMapper.updateEstatePoint", map);
	}

	public int insertReview(SqlSessionTemplate sqlSession, Review review) {
		return sqlSession.insert("estateMapper.insertReview", review);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, int er_id) {
		return sqlSession.update("estateMapper.deleteReview", er_id);
	}

	public Estate selectEstateInfo(SqlSessionTemplate sqlSession, String us_id) {
		return sqlSession.selectOne("estateMapper.selectEstateInfo", us_id);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("estateMapper.updateMember", m);
	}

	public int mdelete(SqlSessionTemplate sqlSession, String us_id) {
		return sqlSession.update("estateMapper.mdelete", us_id);
	}
	
	public int updateEstate(SqlSessionTemplate sqlSession, Estate e) {
		return sqlSession.update("estateMapper.updateEstate", e);
	}

	public int edelete(SqlSessionTemplate sqlSession, int e_id) {
		return sqlSession.update("estateMapper.edelete", e_id);
	}

	public int checkEstate(SqlSessionTemplate sqlSession, String us_id) {
		return sqlSession.selectOne("estateMapper.checkEstate", us_id);
	}

	public int getNoteCount(SqlSessionTemplate sqlSession, int e_id) {
		return sqlSession.selectOne("estateMapper.getNoteCount", e_id);
	}

	public ArrayList<Note> selectNoteList(SqlSessionTemplate sqlSession, int e_id, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("estateMapper.selectNoteList", e_id, rowBounds);
	}

	public int getSearchNoteListCount(SqlSessionTemplate sqlSession, SearchCondition sc, int e_id) {
		Map map = new HashMap();
		map.put( "e_id", e_id );
		map.put( "sc", sc );
		return sqlSession.selectOne("estateMapper.getSearchNoteListCount", map);
	}

	public ArrayList<Note> selectSearchNoteList(SqlSessionTemplate sqlSession, SearchCondition sc, PageInfo pi, int e_id) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		Map map = new HashMap();
		map.put( "e_id", e_id );
		map.put( "sc", sc );
		return (ArrayList)sqlSession.selectList("estateMapper.selectSearchNoteList", map, rowBounds);
	}

	public ArrayList<ProductApplication> selectPropertyList(SqlSessionTemplate sqlSession, int e_id,
			PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("estateMapper.selectPropertyList", e_id, rowBounds);
	}

	public int getPropertyListCount(SqlSessionTemplate sqlSession, int e_id) {
		return sqlSession.selectOne("estateMapper.getPropertyListCount", e_id);
	}

	public int getSearchPropertyListCount(SqlSessionTemplate sqlSession, SearchCondition sc, int e_id) {
		Map map = new HashMap();
		map.put( "e_id", e_id );
		map.put( "sc", sc );
		return sqlSession.selectOne("estateMapper.getSearchPropertyListCount", map);
	}

	public ArrayList<ProductApplication> selectSearchPropertyList(SqlSessionTemplate sqlSession, SearchCondition sc,
			PageInfo pi, int e_id) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		Map map = new HashMap();
		map.put( "e_id", e_id );
		map.put( "sc", sc );
		return (ArrayList)sqlSession.selectList("estateMapper.selectSearchPropertyList", map, rowBounds);
	}

	public int cancelProductApplication(SqlSessionTemplate sqlSession, int a_id) {

		return sqlSession.update("estateMapper.cancelProductApplication", a_id);
	}

	public int cancelProduct(SqlSessionTemplate sqlSession, int p_id) {
		
		return sqlSession.update("estateMapper.cancelProduct", p_id);
	}

	public int getSearchProductApplicationListCount(SqlSessionTemplate sqlSession, SearchCondition sc, int e_id) {
		Map map = new HashMap();
		map.put( "e_id", e_id );
		map.put( "sc", sc );
		return sqlSession.selectOne("estateMapper.getSearchProductApplicationListCount", map);
	}

	public ArrayList<ProductApplication> selectSearchProductApplicationList(SqlSessionTemplate sqlSession,
			SearchCondition sc, PageInfo pi, int e_id) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		Map map = new HashMap();
		map.put( "e_id", e_id );
		map.put( "sc", sc );
		return (ArrayList)sqlSession.selectList("estateMapper.selectSearchProductApplicationList", map, rowBounds);
	}

	public int acceptProductApplication(SqlSessionTemplate sqlSession, int a_id) {
		return sqlSession.update("estateMapper.acceptProductApplication", a_id);
	}

	public int registProduct(SqlSessionTemplate sqlSession, int p_id) {
		return sqlSession.update("estateMapper.registProduct", p_id);
	}

}
