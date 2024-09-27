package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginService implements CommandProcess {
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터 받기.
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		//DB 작업.
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.login(id,pwd);
		
		//응답.
		if(memberDTO != null) {
			//세션으로 로그인 성공.
			HttpSession session = request.getSession();
			session.setAttribute("memberDTO", memberDTO);
			session.setAttribute("memId", id);
			session.setAttribute("memNickname", memberDTO.getNickname());
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memEmail", memberDTO.getEmail());
			
			return "/member/loginOk.jsp";
		} else {
			return "/member/loginOk.jsp";
		}
	}
}
