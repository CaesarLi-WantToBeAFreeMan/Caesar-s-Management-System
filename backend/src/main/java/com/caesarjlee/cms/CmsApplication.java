package com.caesarjlee.cms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CmsApplication{
	public static void main(String [] args){
		SpringApplication.run(CmsApplication.class, args);
		System.out.println(
			"""
			
			+-----------------------------------+
			|	Caesar's Management System		|
			|	Has Been Launched				|
			+-----------------------------------+
			
			"""
		);
	}
}