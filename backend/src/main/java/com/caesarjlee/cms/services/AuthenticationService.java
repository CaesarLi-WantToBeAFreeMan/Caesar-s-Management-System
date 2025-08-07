package com.caesarjlee.cms.services;

import com.caesarjlee.cms.data_transfer_objects.AuthenticationResponseDto;
import com.caesarjlee.cms.data_transfer_objects.LoginRequestDto;
import com.caesarjlee.cms.data_transfer_objects.RegisterRequestDto;
import com.caesarjlee.cms.data_transfer_objects.ResetPasswordRequestDto;
import com.caesarjlee.cms.exceptions.LoginException;
import com.caesarjlee.cms.exceptions.PasswordResetException;
import com.caesarjlee.cms.exceptions.RegisterException;
import com.caesarjlee.cms.models.User;
import com.caesarjlee.cms.repositories.RoleRepository;
import com.caesarjlee.cms.repositories.UserRepository;
import com.caesarjlee.cms.utilities.JwtUtility;

import com.caesarjlee.cms.utilities.EmailSenderUtility;
//import com.caesarjlee.cms.utilities.SmsSenderUtility;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class AuthenticationService{
    private static final Logger logger = LoggerFactory.getLogger(AuthenticationService.class);
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private CustomUserDetailsService userDetailsService;
    @Autowired
    private JwtUtility jwtUtility;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private RedisTemplate <String, String> redisTemplate;
    @Autowired
    private EmailSenderUtility emailSenderUtility;
    //@Autowired
    //private SmsSenderUtility smsSenderUtility;
    private static final Duration RESET_CODE_TTL = Duration.ofMinutes(12);

    //register
    public AuthenticationResponseDto register(RegisterRequestDto request){
        if(!request.password().equals(request.confirmPassword())) {
            logger.error("registering user's passwords do not match");
            throw new RegisterException("passwords do not match");
        }

        userRepository.save(
            User.of(
                request.username(),
                passwordEncoder.encode(request.password()),
                request.firstName(),
                request.lastName(),
                request.email(),
                request.phone(),
                roleRepository  .findByName("employee")
                                .orElseThrow(
                                    () -> {
                                        logger.error("employee role does not exist");
                                        return new RegisterException("employee role not found");
                                    }
                                )
                                .getId()
            )
        );
        logger.info("user {} registered successfully", request.username());
        return new AuthenticationResponseDto(null, "register successfully");
    }

    //login
    public AuthenticationResponseDto login(LoginRequestDto request){
        try{
            authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.login(), request.password())
            );
            logger.info("user {} logged in successfully", request.login());
            return new AuthenticationResponseDto(
                jwtUtility.generateToken(userDetailsService.loadUserByUsername(request.login())),
                "login successfully"
            );
        }catch(Exception e){
            logger.error("user {} login failed, because {}", request.login(), e.getMessage());
            throw new LoginException("invalid credentials");
        }
    }

    //logout
    public AuthenticationResponseDto logout(String token){
        try{
            long ttl = jwtUtility.extractAllClaims(token)
                    .getExpiration()
                    .getTime()
                    - System.currentTimeMillis();
            if(ttl > 0){
                redisTemplate.opsForValue().set("blacklist:" + token, "revoked", Duration.ofMillis(ttl));
                logger.info("JWT token blacklisted with TTL {} ms", ttl);
            }
        }catch(Exception e){
            logger.warn("could not blacklist token, possibly already exipred: {}", e.getMessage());
        }

        logger.info("user with the token {} logged out successfully", token);
        return new AuthenticationResponseDto(null, "logout successfully");
    }

    //password reset
    public AuthenticationResponseDto requestPasswordReset(String emailOrPhone){
        var userOperation = emailOrPhone.contains("@")  ? userRepository.findByEmail(emailOrPhone)
                                                        : userRepository.findByPhone(emailOrPhone);
        if(userOperation.isEmpty()) {
            logger.error("user {} does not exist", emailOrPhone);
            throw new PasswordResetException("user not found");
        }

        String code = generateResetCode();

        //store the code in Redis with 12-minute expiration
        redisTemplate   .opsForValue()
                        .set(
                            "passwordReset:" + emailOrPhone,
                            code,
                            RESET_CODE_TTL
                        );

        if(emailOrPhone.contains("@"))
            emailSenderUtility.sendPasswordResetEmail(emailOrPhone, code);
        else
            System.out.println("we will create SMS sender method latter");
            //smsSenderUtility.sendSms(emailOrPhone, message);

        logger.info("sent password reset verification code: {}", code);
        return new AuthenticationResponseDto(null, "sent code successfully");
    }

    public AuthenticationResponseDto verifyThenResetPassword(ResetPasswordRequestDto request){
        String  key = "passwordReset:" + request.login(),
                stored = redisTemplate .opsForValue()
                                       .get(key);
        if(stored == null || !stored.equals(request.verificationCode())) {
            logger.error("invalid entered password reset verification code: {}", request.verificationCode());
            throw new PasswordResetException("invalid entered password reset verification code");
        }

        User user = request .login()
                            .contains("@")  ? userRepository    .findByEmail(request.login())
                                                                .orElseThrow(
                                                                    () -> {
                                                                        logger.error("user {} does not exist", request.login());
                                                                        return new PasswordResetException("user not found");
                                                                    }
                                                                )
                                            : userRepository    .findByPhone(request.login())
                                                                .orElseThrow(
                                                                    () -> {
                                                                        logger.error("user {} does not exist", request.login());
                                                                        return new PasswordResetException("user not found");
                                                                    }
                                                                );

        user.setPassword(passwordEncoder.encode(request.password()));
        user.setUpdatedAt(LocalDateTime.now());
        userRepository.save(user);
        redisTemplate.delete(key);
        logger.info("user {} reset password successfully", request.login());
        return new AuthenticationResponseDto(null, "password reset successfully");
    }

    private String generateResetCode(){
        return String.format("%06d", new Random().nextInt(1_000_000));
    }
}