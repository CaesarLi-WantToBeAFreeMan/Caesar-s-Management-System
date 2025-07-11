package com.caesarjlee.backend.cms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CaesarSManagementSystemApplication{
	public static void main(String [] args){
		SpringApplication.run(CaesarSManagementSystemApplication.class, args);
		System.out.println("✔backend is run successfully✔");
	}
}