package member.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.EmailSender;

@WebServlet("/sendAuthCode")
public class AuthServlet extends HttpServlet {
    // 인증번호를 저장할 메모리 맵 (이메일 -> 인증번호 매핑)
	private static Map<String, String> authCodes = new HashMap<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html; charset=UTF-8");
    	response.setCharacterEncoding("UTF-8");

    	// 클라이언트로부터 이메일 파라미터 받기
        String email = request.getParameter("email");

        if (email == null || email.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "이메일을 입력해주세요.");
            return;
        }

        // 6자리 랜덤 인증번호 생성
        String authCode = String.valueOf(new Random().nextInt(900000) + 100000);
        authCodes.put(email, authCode);  // 인증번호 저장

        // 이메일 발송
        EmailSender emailSender = new EmailSender();
        emailSender.sendEmail(email, "404 홈페이지의 회원가입 인증번호\n", "인증번호는 " + authCode + " 입니다.");
        System.out.println("인증번호 : " + authCode);
        // 응답 상태 설정
        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().write(authCode + "|인증번호가 " + email + "로 발송되었습니다.");
    }

    // 인증번호 확인 메소드
    public boolean verifyCode(String email, String code) {
    	boolean result = code.equals(authCodes.get(email));
        return result;
    }
}