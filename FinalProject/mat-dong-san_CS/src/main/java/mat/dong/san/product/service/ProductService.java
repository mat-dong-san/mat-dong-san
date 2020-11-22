package mat.dong.san.product.service;

import mat.dong.san.member.vo.EstateAgent;
import mat.dong.san.product.vo.Note;

public interface ProductService {

	EstateAgent selectEstateAgent(String p_id);

	int insertMessage(Note note);

	
}
