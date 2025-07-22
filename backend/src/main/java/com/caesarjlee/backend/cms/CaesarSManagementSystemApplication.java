package com.caesarjlee.backend.cms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

//mark this calss is a Spring Boot application start point
//a little bit like main method
@SpringBootApplication

//enable support for Spring Data Jpa repositories
@EnableJpaRepositories(basePackages = "com.caesarjlee.backend.cms.repositories")
public class CaesarSManagementSystemApplication{
	public static void main(String [] args){
		//run Spring Boot application
		SpringApplication.run(CaesarSManagementSystemApplication.class, args);

		//pring success message
		System.out.println("✔backend is running successfully✔");

		//banner.txt overwrites Spring Boot startup information

		/*
			classic Spring Boot project structure and package useage

			0.
				```
					projectPath
					├── controllers/ (controller)
					├── services/ (service)
					├── repositories/ (repository, repo)
					├── models/ (model, entities, entity)
					├── dtos/ (dto)
					├── configurations/ (config)
					├── exceptions/ (exception)
					├── securities/ (security)
					└── utilities/ (utils, util)
				```
			1. `controllers`: 		defines REST API endpoints, receive HTTP requests, return responses
			2. `service`:			contain business logic, handle processing between controllers and repositories layers
			3. `repositories`:		interfaces for data access using Spring Data JPA (or JDBC, etc.)
			4. `models`:			entity classes representing database tables
			5. `dtos`:				Data Transfer Objects, used to pass specific data between client and server
			6. `configurations`:	store configuration classes for beans, CORS, Swagger, etc
			7. `exceptions`:		custom exception classes and global error handling
			8. `security`:			contain authentication/authorization logic
			9. `utilities`:			utility/helper classes used across the project
		*/
	}
}