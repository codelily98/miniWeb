package member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class SearchPwdService implements CommandProcess {
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable { 
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		System.out.println("id="+id);
		System.out.println("name="+name);
		System.out.println("email="+email);
		MemberDAO memberDAO = MemberDAO.getInstance();

		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		
		String pwd = memberDAO.isExistSearchPwd(map);
		request.setAttribute("pwd", pwd);
		System.out.println(pwd);
		return "/member/searchPwd.jsp";
	}
}
