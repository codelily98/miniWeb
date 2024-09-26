package member.dao;

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

import member.bean.MemberDTO;

public class MemberDAO {
	private static MemberDAO memberDAO = new MemberDAO();
	private SqlSessionFactory sessionFactory;
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	public MemberDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); // - 문자 단위
			sessionFactory = new SqlSessionFactoryBuilder().build(reader);		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void write(MemberDTO memberDTO) {
		SqlSession sqlSession = sessionFactory.openSession();
		sqlSession.insert("minimemberSQL.write", memberDTO);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public boolean isExistId(String id){
		boolean exist = false;
		MemberDTO memberDTO = null;
		SqlSession sqlSession = sessionFactory.openSession();
		memberDTO = sqlSession.selectOne("minimemberSQL.isExistId", id);
		if(memberDTO != null ) {
			exist = true;
		}
		sqlSession.close();
		
		return exist;
	}
	
	public boolean isExistNick(String nickname) {
		boolean exist = false;
		MemberDTO memberDTO = null;
		SqlSession sqlSession = sessionFactory.openSession();
		memberDTO = sqlSession.selectOne("minimemberSQL.isExistId", nickname);
		if(memberDTO != null ) {
			exist = true;
		}
		sqlSession.close();
		
		return exist;
	}

	public MemberDTO login(String id, String pwd) {
		SqlSession sqlSession = sessionFactory.openSession();

		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
	
		MemberDTO memberDTO = sqlSession.selectOne("minimemberSQL.login", map);
		sqlSession.close();
		return memberDTO;
	}

	public String isExistSearchId(Map<String, String> map) {
		String id = null;
		SqlSession sqlSession = sessionFactory.openSession();
		id = sqlSession.selectOne("minimemberSQL.isExistSearchId", map);
		sqlSession.close();
		
		return id;
	}
	
	public String isExistSearchPwd(Map<String, String> map) {
		String pwd = null;
		SqlSession sqlSession = sessionFactory.openSession();
		pwd = sqlSession.selectOne("minimemberSQL.isExistSearchPwd", map);
		
		sqlSession.close();
		return pwd;
	}
}