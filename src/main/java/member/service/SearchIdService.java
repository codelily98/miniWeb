package member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class SearchIdService implements CommandProcess {
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);		
		
		String id = memberDAO.isExistSearchId(map);
		request.setAttribute("id", id);
		
		return "/member/searchId.jsp";
	}
}
