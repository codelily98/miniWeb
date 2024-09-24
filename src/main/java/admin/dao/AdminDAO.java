package admin.dao;

import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class AdminDAO {
	private static AdminDAO adminDAO = new AdminDAO();
	private SqlSessionFactory sessiongFactory;
	
	public static AdminDAO getInstance() {
		return adminDAO;
	}
	
	public AdminDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); // - 문자 단위
			sessiongFactory = new SqlSessionFactoryBuilder().build(reader);		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}