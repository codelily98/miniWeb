package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class InfoDeleteService implements CommandProcess {
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		int su = memberDAO.deleteInfo(id);
		
		if(su > 0) {
			session.invalidate();
			
			return "none";
		}
		
		return "none";
	}
}
