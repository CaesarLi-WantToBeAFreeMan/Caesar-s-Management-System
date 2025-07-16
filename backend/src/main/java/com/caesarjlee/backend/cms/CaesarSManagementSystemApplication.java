package com.caesarjlee.backend.cms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jdbc.repository.config.EnableJdbcRepositories;

//mark this calss is a Spring Boot application start point
//a little bit like main method
@SpringBootApplication

//enable support for Spring Data JDBC repositories
@EnableJdbcRepositories
public class CaesarSManagementSystemApplication{
	public static void main(String [] args){
		//run Spring Boot application
		SpringApplication.run(CaesarSManagementSystemApplication.class, args);

		//pring success message
		System.out.println("✔backend is running successfully✔");

		//banner.txt overwrites Spring Boot startup information
	}
}