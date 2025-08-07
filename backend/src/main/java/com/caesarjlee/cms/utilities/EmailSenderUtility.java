package com.caesarjlee.cms.utilities;

import com.caesarjlee.cms.exceptions.PasswordResetException;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring6.SpringTemplateEngine;

@Component
public class EmailSenderUtility {
    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private SpringTemplateEngine springTemplateEngine;

    @Value("${spring.mail.username}")
    private String fromMail;

    public void sendPasswordResetEmail(String target, String code){
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        try{
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
            mimeMessageHelper.setTo(target);
            mimeMessageHelper.setSubject("🔒Password Reset Verification Code");

            Context context = new Context();
            context.setVariable("email", target);
            context.setVariable("code", code);
            mimeMessageHelper.setText(springTemplateEngine.process("password-reset-email", context), true);

            mailSender.send(mimeMessage);
        }catch(MessagingException e){
            throw new PasswordResetException("cannot send password reset verification code email");
        }
    }
}