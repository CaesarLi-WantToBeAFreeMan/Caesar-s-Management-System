package com.caesarjlee.cms.utilities;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/*
@Component
public class SmsSenderUtility{
    @Value("${twilio.account-sid")
    private String accountSid;

    @Value("${twilio.auth-token}")
    private String authToken;

    @Value("${twilio.phone-number}")
    private String phoneNumber;

    public SmsSenderUtility(){
        Twilio.init(accountSid, authToken);
    }

    public void sendSms(String target, String content){
        Message.creator(
            new PhoneNumber(target),
            new PhoneNumber(phoneNumber),
            content
        ).create();
    }
}
*/