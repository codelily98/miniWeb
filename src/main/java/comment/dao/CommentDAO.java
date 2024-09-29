package comment.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;
import comment.bean.CommentDTO;

public class CommentDAO {
	private static CommentDAO commentDAO = new CommentDAO();
	private SqlSessionFactory sessionFactory;

	
	public static CommentDAO getInstance() {
		return commentDAO;
	}
	
	public CommentDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); // -문자 단위
			sessionFactory = new SqlSessionFactoryBuilder().build(reader);		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void commentWrite(CommentDTO commentDTO) {
		SqlSession sqlSession = sessionFactory.openSession();
		
		sqlSession.insert("commentSQL.commentWrite", commentDTO);
		sqlSession.commit();
		sqlSession.close();
	}

	public List<CommentDTO> commentView(int ref) {
		List<CommentDTO> Clist = new ArrayList<CommentDTO>();
		SqlSession sqlSession = sessionFactory.openSession();
		System.out.println(ref);
		Clist = sqlSession.selectList("commentSQL.commentView", ref); 
		sqlSession.close();
		return Clist;
	}
}