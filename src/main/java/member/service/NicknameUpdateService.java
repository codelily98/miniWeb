package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class NicknameUpdateService implements CommandProcess{
   @Override
   public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      String id = request.getParameter("id");
      String nickname = request.getParameter("nickname");
      
      MemberDAO memberDAO = MemberDAO.getInstance();
      memberDAO.nicknameUpdate(id, nickname);
      
      return "none";
   }
}