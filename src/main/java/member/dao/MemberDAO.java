package member.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
	private static MemberDAO memberDAO = new MemberDAO();
	private SqlSessionFactory sessiongFactory;
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	public MemberDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); // - 문자 단위
			sessiongFactory = new SqlSessionFactoryBuilder().build(reader);		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void write(MemberDTO memberDTO) {
		SqlSession sqlSession = sessiongFactory.openSession();
		sqlSession.insert("memberSQL.write", memberDTO);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public boolean isExistId(String id){
		boolean exist = false;
		MemberDTO memberDTO = null;
		SqlSession sqlSession = sessiongFactory.openSession();
		memberDTO = sqlSession.selectOne("memberSQL.isExistId", id);
		if(memberDTO != null ) {
			exist = true;
		}
		sqlSession.close();
		
		return exist;
	}
	
	public boolean isExistNick(String nickname) {
		boolean exist = false;
		MemberDTO memberDTO = null;
		SqlSession sqlSession = sessiongFactory.openSession();
		memberDTO = sqlSession.selectOne("memberSQL.isExistId", nickname);
		if(memberDTO != null ) {
			exist = true;
		}
		sqlSession.close();
		
		return exist;
	}
}