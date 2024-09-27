package member.service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/verifyAuthCode")
public class VerifyAuthCodeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html; charset=UTF-8");
    	response.setCharacterEncoding("UTF-8");

    	// 클라이언트로부터 이메일과 인증번호를 파라미터로 받기
        String email = request.getParameter("email");
        String inputCode = request.getParameter("ckechnum");

        // AuthServlet에서 인증번호 확인 (메모리 맵 접근)
        AuthServlet authServlet = new AuthServlet();
        boolean isVerified = authServlet.verifyCode(email, inputCode);

        // 인증 결과 반환
        if (isVerified) {
            response.getWriter().write("인증 성공!");
        } else {
            response.getWriter().write("인증 실패! 잘못된 인증번호입니다.");
        }
    }
}