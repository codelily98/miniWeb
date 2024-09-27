package member.service;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class EmailSender {

    public void sendEmail(String to, String subject, String body) {
        // 이메일 발송자 정보 (네이버 또는 Gmail 사용)
        final String username = "gustlr887@naver.com"; // 네이버 이메일 주소
        final String password = "orakard1@#";  // 네이버 이메일 비밀번호

        // SMTP 서버 설정
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true"); // TLS 사용
        props.put("mail.smtp.host", "smtp.naver.com");  // 네이버 SMTP 서버 주소
        props.put("mail.smtp.port", "587");             // SMTP 포트

        // 인증 정보 설정
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // 이메일 메시지 작성
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));          // 발신자 설정
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));  // 수신자 설정
            message.setSubject(subject);                             // 이메일 제목
            message.setText(body);                                   // 이메일 내용

            // 이메일 발송
            Transport.send(message);
            System.out.println("이메일 발송 완료");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}