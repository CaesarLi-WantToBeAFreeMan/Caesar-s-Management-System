/*
    database server type:               mysql 8.0
    database server host:               localhost:3306
    database name:                      cms_db
    served application:                 Caesar's Management  System
    database management application:    DBeaver Community Version
    SQL author:                         Caesar James LEE
*/

-- create database
DROP DATABASE IF EXISTS `cms_db`;
CREATE DATABASE `cms_db`
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
USE `cms_db`;

-- setting for full Unicode support
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;
SET collation_connection = 'utf8mb4_unicode_ci';

-- create genders table

DROP TABLE IF EXISTS `genders`;
CREATE TABLE `genders`(
    `id` TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique gender type ID',
    `name` VARCHAR(50) NOT NULL COMMENT 'gender name',
    `description` TEXT DEFAULT NULL COMMENT 'gender description',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'gender creation time in GMT'
)   ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'gender table';

-- records of genders table

INSERT INTO `genders` (`name`, `description`) VALUES
    ('male', 'A person who identifies as a man.'),
    ('demiboy', 'A person who partially identifies as male.'),
    ('female', 'A person who identifies as a woman.'),
    ('demigirl', 'A person who partially identifies as female.'),
    ('two-spirit', 'A Native American term for someone embodying both masculine and feminine spirits.'),
    ('cisgender', 'A person whose gender identity matches their assigned sex at birth.'),
    ('transgender', 'A person whose gender identity differs from their assigned sex at birth.'),
    ('non-binary', 'A person who does not identify strictly as male or female'),
    ('genderqueer', 'A person whose gender identity is outside traditional gender norms.'),
    ('genderfluid', 'A person whose gender identity shifts over time.'),
    ('agender', 'A person who identifies as having no gender.'),
    ('intersex', 'A person born with physical sex traits that don''t fit typical male or female definitions.'),
    ('androgynous', 'A person who expresses a mix of male and female traits.'),
    ('third gender', 'A person who identifies as a gender outside male and female.'),
    ('bigender', 'A person who identifies as both male and female (or other two genders).'),
    ('trigender', 'A person who identifies as three genders'),
    ('polygender', 'A person who identifies as multiple genders');


-- create departments table

DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique department ID',
    `name` VARCHAR(100) NOT NULL UNIQUE COMMENT 'department name',
    `description` TEXT DEFAULT NULL COMMENT 'department description',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'department creation time in GMT',
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'department update time in GMT'
)   ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'department table';

-- records of departments table
INSERT INTO `departments`(`name`, `description`) VALUES
    ('Legal Department', 'Manage legal affairs, ensuring compliance, handling contracts, IP, litigation, and risk management to protect the company from legal risks.'),
    ('Technical Department', 'Develops, implements, and maintains tech solutions, focusing on software, hardware, IT infrastructure, and cybersecurity.'),
    ('Operations Department', 'Optimize daily processes, logistics, and resource management to ensure smooth business operations, efficiency, and quality.'),
    ('Financial Department', 'Oversee budgeting, accounting, payroll, financial reporting, and ensures compliance with financial regulations to maintain the company''s financial health.'),
    ('Marketing Department', 'Promote the company''s products/services, manages advertising, market research, and digital strategies to enhance brand visibility.'),
    ('Strategy & Innovation Department', 'Define long-term strategy, explores new opportunities, and drives innovation through research, planning, and business development.'),
    ('Human Resources Department', 'Handle recruitment, training, performance, employee relations, and benefits to build a productive, aligned workforce.'),
    ('IT Department', 'Manage network, data security, software, and provides IT support to ensure smooth operation and efficient tools for employees.'),
    ('Compliance & Risk Department', 'Monitor adherence to laws and internal policies, conducts risk assessments, and develops strategies to minimize legal and financial risks.');

-- create teams table

DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique team ID',
    `name` VARCHAR(100) NOT NULL UNIQUE COMMENT 'team name',
    `description` TEXT DEFAULT NULL COMMENT 'team description',
    `department_id` BIGINT UNSIGNED NOT NULL COMMENT 'department of the team',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'team creation time in GMT',
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'team update time in GMT',
    FOREIGN KEY (`department_id`)
        REFERENCES `departments` (`id`)
        ON DELETE CASCADE
)   ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'team table';

-- records of teams table

INSERT INTO `teams`(`name`, `description`, `department_id`) VALUES
    --legal department
    ('copyright team', 'Protect the company''s intellectual property and manages copyright issues.', 1),
    ('litigation team', 'Handle legal disputes and represents the company in court.', 1),
    ('compliance team', 'Ensure company practices align with laws and regulations.', 1),

    --technical department
    ('backend development team', 'Build and maintains server-side logic, APIs, and database systems.', 2),
    ('frontend development team', 'Design and develops user interfaces for web and mobile platforms.', 2),
    ('data science team', 'Analyze data to support decision-making and build intelligent systems.', 2),
    ('security team', 'Protect systems from cyber threats and ensures data integrity.', 2),
    
    --operations department
    ('logistics team', 'Manage supply chains, inventory, and product distribution.', 3),
    ('project management team', 'Plan, execute, and monitor projects to ensure timely delivery.', 3),

    --financial department
    ('accounting team', 'Manage financial records, reporting, and ensures compliance with standards.', 4),
    ('investment team', 'Oversee company investments and develops financial growth strategies.', 4),

    --marketing department
    ('advertisement team', 'Design ad campaigns to boost brand awareness and product reach.', 5),
    ('market research team', 'Study market trends and consumer needs to guide strategy.', 5),
    ('digital marketing team', 'Promote the brand through digital platforms like social media and SEO.', 5),

    --strategy & innovation department
    ('innovation team', 'Explore new ideas and technologies to improve products or services.', 6),
    ('business development team', 'Identify growth opportunities and builds strategic partnerships.', 6),

    --human resources department
    ('recruitment team', 'Attract, interview, and hire top talent for the organization.', 7),
    ('training team', 'Develop programs to enhance employee skills and growth.', 7),
    ('employee relations team', 'Manage workplace issues and fosters a positive culture.', 7),

    --IT department
    ('network infrastructure team', 'Design and maintains network systems and hardware.', 8),
    ('software development team', 'Build internal tools and systems to support operations.', 8),
    ('it support team', 'Provide tech support and troubleshooting for all staff.', 8),

    --compliance & risk department
    ('risk management team', 'Assess and mitigates business and operational risks.', 9),
    ('audit team', 'Review internal processes to ensure accuracy and legal compliance.', 9);

-- create diplomas table

DROP TABLE IF EXISTS `diplomas`;
CREATE TABLE `diplomas`(
    `id` TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique diploma ID',
    `diploma_name` VARCHAR(255) NOT NULL COMMENT 'diploma name',
    `diploma_description` VARCHAR(255) NOT NULL COMMENT 'diploma description',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'diploma creation time in GMT'
)   ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'diploma table';

-- records of diplomas table

INSERT INTO `diplomas`(`name`, `description`) VALUES
    --under bachelor
    ('under high school', 'Education below high school level'),
    ('High School', 'high school diploma'),
    ('Associate of Arts', '2-year degree, humanities, social sciences'),
    ('Associate of Science', '2-year degree, science, technology'),
    ('Associate of Applied Science', 'Vocational/technical skills'),

    --bachelor
    ('Bachelor of Arts', 'Humanities, social sciences, languages, arts'),
    ('Bachelor of Science', 'STEM, economics, psychology, business (technical side)'),
    ('Bachelor of Fine Arts', 'Visual/performing arts'),
    ('Bachelor of Business Administration', 'Business, accounting, marketing, finance'),
    ('Bachelor of Science in Business Admin', 'Science-oriented business education'),
    ('Bachelor of Engineering', 'Engineering disciplines'),
    ('Bachelor of Science in Nursing', 'Nursing'),
    ('Bachelor of Education', 'Teaching & education'),
    ('Bachelor of Architecture', 'Architecture (5-year program)'),
    ('Bachelor of Music', 'Music theory, performance'),

    --master

    ('Master of Arts', 'Humanities, social sciences'),
    ('Master of Science', 'Science, tech, business'),
    ('Master of Business Administration', 'Business leadership, finance, strategy'),
    ('Master of Fine Arts', 'Creative writing, film, studio arts'),
    ('Master of Education', 'Curriculum, instruction, educational leadership'),
    ('Master of Social', 'Work	Social work practice'),
    ('Master of Public Administration', 'Government, nonprofits, policy'),
    ('Master of Public Health', 'Epidemiology, health policy, global health'),
    ('Master of Science in Nursing', 'Advanced nursing practice'),
    ('Master of Engineering', 'Professional engineering degree'),

    --professional degree

    ('Juris Doctor', 'Law (required to become a lawyer in the U.S.)'),
    ('Doctor of Medicine', 'Medicine (physician/doctor)'),
    ('Doctor of Osteopathic Medicine', 'Similar to MD, holistic medicine'),
    ('Doctor of Veterinary Medicine', 'Veterinarian'),
    ('Doctor of Dental Surgery', 'Dentist'),
    ('Doctor of Medicine in Dentistry', 'Dentist (equivalent to DDS)'),
    ('Doctor of Pharmacy', 'Pharmacist'),
    ('Doctor of Physical Therapy', 'Physical therapist'),

    --doctor

    ('Doctor of Philosophy', 'Research in any field: science, humanities, engineering, etc.'),
    ('Doctor of Education', 'Educational leadership, policy'),
    ('Doctor of Psychology', 'Clinical psychology'),
    ('Doctor of Science', 'Advanced research in science (rare in the U.S.)'),
    ('Doctor of Theology', 'Theology, religious studies');

-- create users table

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique user ID',
    `username` VARCHAR(50) NOT NULL UNIQUE COMMENT 'unique username for login',
    `password` VARCHAR(255) NOT NULL COMMENT 'BCrypt hashed password',
    `first_name` VARCHAR(100) NOT NULL COMMENT 'user first name',
    `last_name` VARCHAR(100) NOT NULL COMMENT 'user last name',
    `gender` TINYINT UNSIGNED NOT NULL COMMENT 'user gender',
    `email` VARCHAR(100) NOT NULL UNIQUE COMMENT 'user email',
    `phone` VARCHAR(20) NOT NULL UNIQUE COMMENT 'user phone in E.164 format',
    `address` VARCHAR(255) NOT NULL COMMENT 'user contact address',
    `diploma` TINYINT UNSIGNED DEFAULT NULL COMMENT 'user diploma',
    `department_id` BIGINT UNSIGNED DEFAULT NULL COMMENT 'user department ID',
    `team_id` BIGINT UNSIGNED DEFAULT NULL COMMENT 'user team ID',
    `hire_date` DATE DEFAULT NULL COMMENT 'user hire date',
    `salary` DECIMAL(14, 2) DEFAULT 0.00 COMMENT 'user salary',
    `currency` VARCHAR(3) DEFAULT 'USD' COMMENT 'user preferred currency in ISO 4217',
    `first_language` VARCHAR(5) DEFAULT 'en-US' COMMENT 'user first language in BCP 47',
    `second_language` VARCHAR(5) DEFAULT NULL COMMENT 'user second language in BCP 47',
    `third_language` VARCHAR(5) DEFAULT NULL COMMENT 'user third language in BCP 47',
    `first_nationality` VARCHAR(3) DEFAULT 'USA' COMMENT 'user first nationality in ISO 3166-1 alpha-3',
    `second_nationality` VARCHAR(3) DEFAULT NULL COMMENT 'user second nationality in ISO 3166-1 alpha-3',
    `user_status` BOOLEAN DEFAULT TRUE COMMENT 'user account status(TRUE = active, FALSE = inactive)',-- synonym (alias) for `TINYINT(1)`
    `icon` VARCHAR(255) DEFAULT NULL COMMENT 'user icon URL',
    `description` TEXT DEFAULT NULL COMMENT 'user description',
    `skills` TEXT DEFAULT NULL COMMENT 'user skills (comma-separated or JSON)',
    `position` VARCHAR(100) DEFAULT NULL COMMENT 'user job position',
    `provider` VARCHAR(50) DEFAULT NULL COMMENT 'social media provider',
    `provider_id` VARCHAR(255) DEFAULT NULL COMMENT 'social media provider user ID',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'account creation time in GMT',
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'account update time in GMT',
    FOREIGN KEY (`department_id`)
    	REFERENCES `departments` (`id`)
    	ON DELETE SET NULL,
    FOREIGN KEY (`team_id`)
        REFERENCES `teams` (`id`)
        ON DELETE SET NULL
)   ENGINE = InnoDB 
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'users table';

-- add manager_id column for department
ALTER TABLE `departments`
    ADD `manager_id` BIGINT UNSIGNED
        DEFAULT NULL COMMENT 'manager of the department',
    ADD FOREIGN KEY (`manager_id`)
        REFERENCES `users` (`id`)
        ON DELETE SET NULL;

-- create role table

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `roles`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique user_role mapping ID',
    `user_id` BIGINT UNSIGNED NOT NULL COMMENT 'user ID',
    `role` TINYINT NOT NULL COMMENT 'user role: CHAIRPERSON, DIRECTOR, CEO, CTO, CFO, CMO, CLO, COO, CSO, CCO, CIO, CHRO, MANAGER, EMPLOYEE',
    FOREIGN KEY (`user_id`)
    	REFERENCES `users` (`id`)
    	ON DELETE CASCADE
)   ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'user-role mappings table';

-- create skills table
DROP TABLE IF EXISTS `skills`;
CREATE TABLE `skills`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique skill ID',
    `name` VARCHAR(30) NOT NULL UNIQUE COMMENT 'skill name, for tags',
    `description` TEXT DEFAULT NULL COMMENT 'skill description',
    INDEX idx_skill_name (`name`)
)   ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'skills table';

-- create user_skills table
DROP TABLE IF EXISTS `user_skills`;
CREATE TABLE `user_skills`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique user_skill mapping ID',
    `user_id` BIGINT UNSIGNED NOT NULL COMMENT 'user ID',
    `skill_id` BIGINT UNSIGNED NOT NULL COMMENT 'skill ID',
    UNIQUE KEY `uk_user_skill` (`user_id`, `skill_id`),
    FOREIGN KEY (`user_id`)
    	REFERENCES `users` (`id`)
    	ON DELETE CASCADE,
    FOREIGN KEY (`skill_id`)
    	REFERENCES `skills` (`id`)
    	ON DELETE CASCADE
)   ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = "user-skill mappings table";

-- create requests table

DROP TABLE IF EXISTS `requests`;
CREATE TABLE `requests`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique request ID',
    `user_id` BIGINT UNSIGNED NOT NULL COMMENT 'user who made the request',
    `request_type` TINYINT NOT NULL COMMENT 'type of request',
    `request_details` TEXT DEFAULT NULL COMMENT 'request details',
    `request_status` TINYINT DEFAULT 0 COMMENT 'request status',
    `handler_id` BIGINT UNSIGNED DEFAULT NULL COMMENT 'user who approves/rejects the request',
    `handle_details` TEXT DEFAULT NULL COMMENT 'reasons for approval/rejection',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'request creation time in GMT',
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'request update time in GMT',
    FOREIGN KEY (`user_id`)
    	REFERENCES `users` (`id`)
    	ON DELETE CASCADE,
    FOREIGN KEY (`handler_id`)
    	REFERENCES `users`  (`id`)
    	ON DELETE SET NULL,
    INDEX idx_requester (`user_id`),
    INDEX idx_request_type (`request_type`),
    INDEX idx_request_status (`request_status`),
    INDEX idx_request_handler (`handler_id`)
)   ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'requests table';

-- create messages table

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique message id',
    `sender_id` BIGINT UNSIGNED NOT NULL COMMENT 'user who sent the message',
    `receiver_id` BIGINT UNSIGNED NOT NULL COMMENT 'user who receives the message',
    `message_title` VARCHAR(50) NOT NULL COMMENT 'message title',
    `message_content` TEXT NOT NULL COMMENT 'message content',
    `is_read` BOOLEAN DEFAULT FALSE COMMENT 'whether the message has been read',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'message creation time in GMT',
    FOREIGN KEY (`sender_id`)
    	REFERENCES `users` (`id`)
    	ON DELETE CASCADE,
    FOREIGN KEY (`receiver_id`)
    	REFERENCES `users` (`id`)
    	ON DELETE CASCADE,
    INDEX idx_message_sender (`sender_id`),
    INDEX idx_message_receiver (`receiver_id`)
)   ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'messages table';

-- create reports table

DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique report ID',
    `user_id` BIGINT UNSIGNED NOT NULL COMMENT 'user who generated the report',
    `report_type` TINYINT NOT NULL COMMENT 'report file type',
    `file_path` VARCHAR(255) NOT NULL COMMENT 'path to stored file',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'report creation time in GMT',
    FOREIGN KEY (`user_id`)
    	REFERENCES `users` (`id`)
    	ON DELETE CASCADE,
    INDEX idx_report_asker (`user_id`),
    INDEX idx_report_type (`report_type`)
)   ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = "reports table";

-- create uploads table

DROP TABLE IF EXISTS `uploads`;
CREATE TABLE `uploads`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique upload ID',
    `user_id` BIGINT UNSIGNED NOT NULL COMMENT 'user ID',
    `upload_type` TINYINT NOT NULL COMMENT 'upload file type',
    `file_path` VARCHAR(255) NOT NULL COMMENT 'path to stored file',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'upload time in GMT',
    FOREIGN KEY (`user_id`)
    	REFERENCES `users` (`id`)
    	ON DELETE CASCADE,
    INDEX idx_upload_asker (`user_id`),
    INDEX idx_upload_type (`upload_type`)
)   ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'uploads table';

-- create logs table

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique log ID',
    `user_id` BIGINT UNSIGNED NOT NULL COMMENT 'user ID',
    `action_type` TINYINT NOT NULL COMMENT 'action type',
    `action_details` TEXT DEFAULT NULL COMMENT 'action details',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'log creation time in GMT',
    FOREIGN KEY (`user_id`)
    	REFERENCES `users` (`id`)
    	ON DELETE CASCADE,
    INDEX idx_log_user (`user_id`),
    INDEX idx_log_action_type (`action_type`)
)   ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'user action logs table';


ALTER TABLE `users`
    ADD `diploma` TINYINT
        DEFAULT NULL COMMENT 'user diploma',
    ADD FOREIGN KEY (`diploma`)
    REFERENCES `diplomas` (`id`)
    ON DELETE SET NULL;

-- records of departments table



--records of diplomas table


-- records of users table

INSERT INTO `users`(
    `username`, `password`, `first_name`, `last_name`, `gender`, `email`, `phone`,
    `address`, `diploma`, `department_id`, `team_id`, `hire_date`, `salary`, `currency`, `first_language`,
    `second_language`, `third_language`, `first_nationality`, `second_nationality`, `status`, `position` 
) VALUES

    -- board members
    (
        -- password: CaesarIsAChairperson@0
        'chairperson_caesar', '$2b$12$rH9e.zA8OSgih7v4QreUrOHJtNBkfjyQN1DrnzOR9qJlP1VyKSARS',
        'caesar', 'lee', 2, 'caesar_cofounder@cjl.com', '+12345678900', '001 Main St, LA', 34,--doctor of Philosophy
        NULL, NULL, '2025-01-01', 300000.00, 'usd', 'zh_tw', 'en_us', NULL, 'twn', 'usa',
        TRUE, 'chairperson'
    ),
    (
        -- password: AliceCobuildTheCompany@1
        'director_alice', '$2b$12$4MuHfjzYWSesQEHPXVwHv.NWtBWGf5BkLqfB34hj4oJDtaYATyL/q',
        'alice', 'jackson', 1, 'alice_cofounder@cjl.com', '+12345678901', '002 Main St, LA', 34,
        NULL, NULL, '2025-01-01', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'director'
    ),
    (
        -- password: JohnInvestTheCompany@2
        'director_john', '$2b$12$5zQPjFSSGJvnl1RLl0GLGeEKL3RYy4D4Nlbtt.fkSxm0SEsdKeUyi',
        'john', 'lawrence', 0, 'john_investor@cjl.com', '+525512345678', '001 Main St, Mexico', 18,
        NULL, NULL, '2025-01-01', 300000.00, 'mxn', 'es_mx', 'en_us', NULL, 'mex', 'usa',
        TRUE, 'director'
    ),

    -- CEO

    (
        -- password: CaesarIsCEO!00
        'ceo_caesar', '$2b$12$cOaJkI.UtH6c8JGdGQjbaO3tbE7l0PeRYxGzjyAprQkoVyvcAJTv2',
        'caesar', 'lee', 2, 'caesar_ceo@cjl.com', '+886912345678', '001 Ketagalan Boulevard, Taipei', 34,
        NULL, NULL, '2025-01-01', 300000.00, 'ntd', 'zh_tw', 'en_us', NULL, 'twn', 'usa',
        TRUE, 'ceo'
    ),

    -- legal department

    (
        -- password: SteveLikesMinecraft#2009
        'fox_lawyer', '$2b$12$W7Ovvzni.3022oRiJmJE8OXyetRY1j.ee9r9ZVTKW4qePWVL3NTzW',
        'fox', 'washington', 0, 'fox_lawyer@cjl.com', '+12345678902', '003 Main St, LA', 26,
        1, NULL, '2025-01-02', 200000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'clo'
    ),
    (
        -- password: frankHaveToBeALawyer!~_~!233
        'frank_smith_legal_copyright_manager', '$2b$12$PQCemJZSk837oN3zDlvCBeLKMcYF832ywqQ0gq5s82DoHBqCxPizG',
        'frank', 'smith', 0, 'frank_smith_legal_copyright_manager@cjl.com', '+12345678903', '004 Main St, LA', 26,
        1, 1, '2025-01-02', 150000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: frankWannaPlaySteamF!O@R#E$V%E^R&000
        'frank_smith_loves_steam', '$2b$12$0HiSDI1KM1ZEkmmSo2Gox.FHu9aZZvtWgzusG6ySD4SXeQr73GteK',
        'frank', 'smith', 0, 'frank_smith_lawyer@cjl.com', '+12345678904', '005 Main St, LA', 26,
        1, 1, '2025-01-03', 150000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: narutoUzumakiLovesUzumakiNaruto(520)
        'uzumaki_naruto_ninja', '$2b$12$D/TDCEgDt6xefjumLz2Iou7jqcHn6z7XS6rRIM63I.yBm7p.B8eqq',
        'naruto', 'uzumaki', 0, 'naruto_ninja@cjl.com', '+813123445678', '001 Main St, Tokyo', 26,
        1, 1, '2025-01-02', 100000.00, 'jpy', 'ja_jp', 'en_us', NULL, 'jpn', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: jessica@Blink#2023
        'jessica_bp', '$2b$12$mLfj06n.oEmLba9bvYD/PemnTx18XCUy/yIzu7a5FZpPymTqCmsym',
        'jessica', 'lee', 1, 'jessica_blackpink@cjl.com', '+12345678905', '006 Main St, LA', 26,
        1, 2, '2025-01-02', 120000.00, 'usd', 'en_us', 'ko_kr', NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: Clark~superman~2025
        'clark_sm', '$2b$12$8XxQumDVN9zoj9InQJLKoeJ//NJ5tMdCpk0XGBsXQTYehlMk1LBym',
        'clark', 'smith', 2, 'clark_on_planet_krypton@cjl.com', '+12345678906', '007 Main St, LA', 26,
        1, 2, '2025-01-02', 100000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: MarvelBetterDC!!!Until2018!!!
        'bernard', '$2b$12$QlbQiE/cRBzsV0S6sPEIb.apRpDp6wtyYjsptXwDFFWrAz9089vUu',
        'james', 'bernard', 0, 'marvel_worser_2018@cjl.com', '+12345678907', '008 Main St, LA', 26,
        1, 2, '2025-01-03', 120000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        FALSE, 'employee'
    ),
    (
        -- password: Gidle#3@kr
        'jennie', '$2b$12$GE6DAJ1tpqQIrsBRwOfDl.AIjtbGCAz7wnyYVuVJIUOCNysIYveaG',
        'jennie', 'Li', 1, 'jennie_dislike_jennie@cjl.com', '+12345678908', '009 Main St, LA', 26,
        1, 3, '2025-01-03', 150000.00, 'usd', 'en_us', 'zh_cn', 'ko_kr', 'usa', 'can',
        TRUE, 'manager'
    ),
    (
        -- password: lily_likes_IDLE#2022
        'lily_neverland', '$2b$12$enPXm6/0OLD2ZkP6.yU3zuLRAsM05crQcL6FTNjm5VlUUUakWGh.S',
        'lily', 'park', 1, 'lily_neverland@cjl.com', '+12345678909', '010 Main St, LA', 26,
        1, 3, '2025-01-03', 150000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: lisa@Lalisa#000
        'la_lisa', '$2b$12$yBFJwiv7SHNyGh1qgL5yZ.efPaXKmHVd2unmLPBsjQ38NCn2aRwIq',
        'lisa', 'jackson', 1, 'la_lisa@cjl.com', '+12345678910', '011 Main St, LA', 2,
        1, 3, '2025-01-03', 120000.00, 'usd', 'en_us', 'ko_kr', NULL, 'usa', NULL,
        TRUE, 'employee'
    ),

    -- technical department
    (
        -- password: CaesarIsCTO!000
        'cto_caesar', '$2b$12$RXUS1sGFKxiDWQo6LTiPe.yzdMWz3mE32L2H66iY0Vqgq6mxDBU7m',
        'caesar', 'lee', 2, 'caesar_cto@cjl.com', '+12345678911', '001 Ketagalan Boulevard, Taipei', 34,
        NULL, NULL, '2025-01-01', 300000.00, 'ntd', 'zh_tw', 'en_us', NULL, 'twn', 'usa',
        TRUE, 'cto'
    ),
    (
        -- password: peterIs@!spiderman!@22
        'peter_park_spiderman', '$2b$12$jiIit1sxiyWsKp1heLaV.ef0Pfxw57MAAe9zI2eRPGm.Nxi8sEvHi',
        'peter', 'park', 0, 'pp_sm@cjl.com', '+12345678912', '001 Tech St, LA', 7,
        2, 4, '2025-01-03', 200000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: paterDefeatVoldmort!Y2K
        'harry_potter', '$2b$12$YKpHRX.rwjWJRoj9TIRQ9uVnFh72NcPmiRvdh1OKhYofriZBS/dRa',
        'pater', 'weasley', 0, 'happy_hppw@cjl.com', '+12345678913', 'Queens, NY', 7,
        2, 4, '2025-01-03', 200000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: finalAnswerIs:42
        'elon_musk', '$2b$12$Qvw1NHhtCX.8xCYaiMdcle4ikQW/0QEYkHITcIzfHJFveJChz9AZO',
        'elon', 'musk', 0, 'the_hitchhiker_s_guide_to_the_galaxy@cjl.com', '+12345678914', '001 Main St, South Africa', 34,
        2, 4, '2025-01-03', 300000.00, 'usd', 'en-za', 'en_ca', 'en_us', 'zaf', 'usa',
        FALSE, 'employee'
    ),
    (
        -- password: metaLlamaSucks#2025
        'mark_zuckerberg', '$2b$12$C/lSMFWUqjY0976cX1QxA.MO07gM4fS2pYWxDOkZiWGIx5RIshI3K',
        'mark', 'zuckerberg', 0, 'mark_zuck@cjl.com', '+12345678915', '001 Main St, NY', 34,
        2, 5, '2025-01-03', 300000.00, 'usd', 'en-us', 'zh-cn', NULL, 'usa', NULL,
        FALSE, 'manager'
    ),
    (
        -- password: blueOriginBetterSpaceX!2024
        'jeff', '$2b$12$EQYuoY8i/7fghcSstsbCo.0qIfHDvbLNHGXTTvTmsZ/uLwt3u1qEK',
        'jeff', 'bozes', 0, 'jeff_blue_origin@cjl.com', '+12345678916', '001 Main St, NM', 7,
        2, 5, '2025-01-03', 300000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        FALSE, 'manager'
    ),
    (
        -- password: SpongeBob@1999
        'spongebob', '$2b$12$/P5ixX4p3fH6oesB6giDu.SJSs2erYYq8ElxkHq/wesSCKwfqvK06',
        'spongebob', 'brown', 0, 'spongebob@cjl.com', '+12345678916', '002 Tech St, LA', 7,
        2, 5, '2025-01-03', 250000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: OptimusPrime@2025
        'autobot_optimus_prime', '$2b$12$zhk3ybxteG2LcfLH2XdwZejU5cLpTTp/xCBXEsp/pMwyGYfLNoaca',
        'optimus', 'prime', 3, 'autobot_optimus_prime@cjl.com', '+12345678917', '001 Autobot St, SF', 17,
        2, 6, '2025-01-04', 250000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        FALSE, 'manager'
    ),
    (
        -- password: Bumblebee@2025
        'autobot_bumblebee', '$2b$12$C.ByZmrL.1MayU5gnraTUODWNsIyV1hr/YSuhSUxkwhFTPAOtFL5G',
        'bumblebee', 'jones', 3, 'autobot_bumblebee@cjl.com', '+12345678918', '002 Autobot St, SF', 7,
        2, 6, '2025-01-04', 250000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: Ratchet@2025
        'autobot_ratchet', '$2b$12$KQuY1Fv7UrXYqgwrEIrhVOiMoE0n1C/ZtL.joXMcvy3Cofu3GqbsO',
        'ratchet', 'miller', 3, 'autobot_ratchet@cjl.com', '+12345678919', '003 Autobot St, SF', 7,
        2, 6, '2025-01-04', 250000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Megatron@2025
        'deception_megatron', '$2b$12$bEzpxRNzCCug0p9by6t.VuZNEG8IczDBK7pUjZYuCljX5rsuqDWjW',
        'megatron', 'martinez', 3, 'deception_megatron@cjl.com', '+12345678920', '001 Deception St, SF', 16,
        2, 7, '2025-01-04', 250000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: Starscream@2025
        'deception_starscream', '$2b$12$PmaIjp16SUlr.21ugVK.neAQhnfN/jnsJmgYQdL4kgdhlrv5vUL2O',
        'starscream', 'anderson', 3, 'deception_anderson@cjl.com', '+12345678921', '002 Deception St, SF', 6,
        2, 7, '2025-01-04', 250000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Shockwave@2025
        'deception_shockwave', '$2b$12$JFlYOizqyK0AMkmJMXKCiOpNeCIkpsU2TeCK3fVMHDEXQvPZQLw4C',
        'shockwave', 'moore', 3, 'deception_shockwave@cjl.com', '+12345678922', '003 Deception St, SF', 6,
        2, 7, '2025-01-04', 250000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        FALSE, 'employee'
    ),

    -- operating department

    (
        -- password:  ProfessorX@2025
        'x_men_professor_x_coo', '$2b$12$sL7hSJB7TTM51jkVbFEpUuMG13C3W22Ds8eH4vEacAsJmovwP6vEu',
        'charles', 'xavier', 0, 'charlesxavier@cjl.com', '+12345678923', '001 Xmen St, SF', 18, 
        3, NULL, '2025-01-04', 200000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'coo'
    ),
    (
        -- password: ProfessorX@2025
        'professor_x_manager', '$2b$12$N5ew.Yyo4Gpw7hsRsCslKuHc3pk369PF01SmoAwvaSjPL7AmVXRme',
        'charles', 'xavier', 0, 'professorx@cjl.com', '+4915112345679', '001 Xmen St, SF', 18,
        3, NULL, '2025-01-04', 200000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: Mystique@2025
        'mystique', '$2b$12$skiqizoOc3Frh/cbcy2ybOEyKRG1kTOrLMfVN6fKCZLmKc5/z//VS',
        'raven', 'Darkhölme', 1, 'mystique@cjl.com', '+12345678924', '002 Xmen St, SF', 2,
        3, 8, '2025-01-04', 200000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Wolverine@2025
        'wolverine', '$2b$12$88U68dszOcF31SHPKWh6yOCVu1/DP4a4KR69WjVjxqLklR3eedhke',
        'james', 'howlett', 0, 'wolverine@cjl.com', '+12345678925', '003 Xmen St, SF', 16,
        3, 8, '2025-01-04', 200000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Phoenix@2025
        'phoenix', '$2b$12$4DQjsUV25xHZtubHM0n9UuWF1pMV7vuxgyV3pryddVkyaYZPr40By',
        'jean', 'grey', 1, 'phoenix@cjl.com', '+12345678926', '004 Xmen St, SF', 6,
        3, 9, '2025-01-04', 200000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: Beast@2025
        'beast', '$2b$12$/FCCfP6nNOMB/E1TqqC/MO.u/BsOEa4X8JmwscdLtWJTKOZPAHj6S',
        'henry', 'mccoy', 0, 'beast@cjl.com', '+12345678927', '005 Xmen St, SF', 6,
        3, 9, '2025-01-04', 200000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Magneto@2025
        'magneto', '$2b$12$.W6jSVcW/ARvhiiK5xe//ecYRCSkqY4paxVMPKwdsKz5IeznKI7Ma',
        'max', 'eisenhardt', 0, 'magneto@cjl.com', '+12345678928', '006 Xmen St, SF', 6,
        3, 9, '2025-01-04', 200000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),

    -- financial department

    (
        -- password: AliceCobuildTheCompany@1
        'alice_cfo', '$2b$12$rstVqLCdNFPus8WmJj3A1uy/pxtqzu/4Gjv3oxieQ.EjcHdxTfLUS',
        'alice', 'jackson', 1, 'alice_cfo@cjl.com', '+12345678929', '002 Main St, LA', 34,
        4, NULL, '2025-01-01', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        FALSE, 'cfo'
    ),
    (
        -- password: CaptainAmerica@2025
        'captain_america', '$2b$12$DmQOzmjRhno3ZAprWK5yZerxI4hQOO974nRpsrhc0ySc.Wv4Y4IVi',
        'steve', 'rogers', 0, 'captain_america@cjl.com', '+12345678930', '001 Marvel St, LA', 2,
        4, NULL, '2025-01-04', 250000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'cfo'
    ),
    (
        -- password: IronMan@2025
        'iron_man', '$2b$12$BGegCT6ysZYs2c4aH.xyEeSeM2c9H9esxsMsd8Qh.Jeb4Vk883GwC',
        'tony', 'stack', 0, 'iron_man@cjl.com', '+12345678931', '002 Marvel St, LA', 17,
        4, 10, '2025-01-04', 250000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: Thor@2025
        'thor', '$2b$12$w6Tzk5.CpXA959WTQGJRnuoomI1rbbR61I7.7gs4527vkOVf8dLra',
        'thor', 'thor', 0, 'thor@cjl.com', '+12345678932', '003 Marvel St, LA', 1,
        4, 10, '2025-01-04', 250000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: BlackWidow@2025
        'black_widow', '$2b$12$H6ffT4i/kwZEO3SOKajfFeW4fK6C4FpxrxbilZ.luGv0M2GM1Oodm',
        'natasha', 'romanoff', 1, 'black_widow@cjl.com', '+12345678933', '004 Marvel St, LA', 1,
        4, 10, '2025-01-04', 250000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: YelenaBelova@2025
        'yelena_belova', '$2b$12$M3/nwYA5lVjbuOcNNDW9COqzFh1glUyWgPLxbbdRk4w3rtC871j0y',
        'yelena', 'belova', 1, 'yelena_belova@cjl.com', '+12345678934', '005 Marvel St, LA', 1,
        4, 11, '2025-01-04', 250000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: BuckyBarnes@2025
        'bucky_barnes', '$2b$12$JxXVlyYMKOM3NHlR7EOIWOrBHdfuTgOq372nVc6FH8xg3QVuR5ld6',
        'bucky', 'barnes', 0, 'bucky_barnes@cjl.com', '+12345678935', '006 Marvel St, LA', 7,
        4, 11, '2025-01-04', 250000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Hulk@2025
        'hulk', '$2b$12$.icyPyFDdjhiDNMqhsaHquoBCbKUFd9BO6tfS/uxflEWGqWAAo80S',
        'bruce', 'banner', 0, 'bruce_banner@cjl.com', '+12345678936', '007 Marvel St, LA', 34,
        4, 11, '2025-01-04', 250000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),

    -- marketing department

    (
        -- password: Wanda@2025
        'wanda_maximoff', '$2b$12$djxysZ5Dj96xQIklP0.ccOO5rT3nKawTESMY9OrU02K9CPt73wYie',
        'wanda', 'maximoff', 1, 'wanda_maximoff@cjl.com', '+12345678937', '008 Marvel St, LA', 6,
        5, NULL, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'cmo'
    ),
    (
        -- password: Vision@2025
        'vision', '$2b$12$yvLfx/7nAkIkYOAnqQiE5O8WpOHYH77oHLd/.f8CFnu1n7USK8/1q',
        'vision', 'vision', 3, 'vision@cjl.com', '+12345678938', '009 Marvel St, LA', 7,
        5, 12, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: Falcon@2025
        'falcon', '$2b$12$ZAtvCEnVNZIuN/6J9zlg4OcjFW0bU6wBkZgntJym7q1R9s.HNUjXq',
        'sam', 'wilson', 0, 'falcon@cjl.com', '+12345678939', '010 Marvel St, LA', 11,
        5, 12, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: SpiderMan@2025
        'spider_man', '$2b$12$FlqdmEz5fFhBK4jRYedpKuYVEaqnON9IT4hGkOmpGQmdBZUYuLqlG',
        'peter', 'parker', 0, 'spider_man@cjl.com', '+12345678940', '011 Marvel St, LA', 1,
        5, 12, '2025-01-04', 3000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'intern'
    ),
    (
        -- password: BlackPanther@2025
        'black_panther', '$2b$12$WW/EhXPVQf2deDwdOKemfudJFBaecc21rS2Yq4K9TnnXn/rv5QVYu',
        't', 'challa', 0, 'black_panther@cjl.com', '+12345678941', '012 Marvel St, LA', 6,
        5, 13, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: IAmGroot@2025
        'groot', '$2b$12$bHKL1aRBaqiCcekOEvVJbuccgsMJbgdscYYCbRpzeKmZWumRHEGwS',
        'groot', 'groot', 3, 'i_am_groot@cjl.com', '+12345678942', '013 Marvel St, LA', 1,
        5, 13, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Rocket@2025
        'rocket', '$2b$12$XyqascqmOton9w2pFIjFi.ZXlLUwvLGM1E4JyP1KMCoica7WeGism',
        'rocket', 'rocket', 0, 'rocket@cjl.com', '+12345678943', '014 Marvel St, LA', 1,
        5, 13, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Gamora@2025
        'gamora', '$2b$12$bdUQOSyLx0mY2KKKAoi8jek.3Wju5STQaPGldcL8cfEaOZQT4nfaa',
        'gamora', 'gamora', 1, 'rocket@cjl.com', '+12345678944', '015 Marvel St, LA', 6,
        5, 14, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: StarLord@2025
        'star_lord', '$2b$12$f1DcZutEQgIWKEjXSIF0SeASLVx9tQ/EeR2m8T4pBG4ZZchj45EOq',
        'peter', 'quill', 0, 'star_lord@cjl.com', '+12345678945', '016 Marvel St, LA', 7,
        5, 14, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Thanos@2025
        'thanos', '$2b$12$QGWvkxBywUeODe3tApL9GeqNr2Z.Qdq1Y9naJwJmHPsEHW66lOjEO',
        'thanos', 'thanos', 0, 'thanos@cjl.com', '+12345678946', '017 Marvel St, LA', 6,
        5, 14, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    )

    -- strategy & innovation department

    (
        -- password: ErenYeager@2025
        'eren_yeager', '$2b$12$tvd93mqLhAbYl6c20VxtIOGNjjSQYrq/S8MdfEIVCsyNaKimReBDO',
        'eren', 'yeager', 0, 'eren_yeager@cjl.com', '+12345678947', '001 Attack on Titan St, LA', 7,
        6, NULL, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'cso'
    ),
    (
        -- password: MikasaAckerman@2025
        'mikasa_ackerman', '$2b$12$cFrajuXW1DFcZrfKx/K3yOczl/cPgN5cxzKqrJ3MeArJAOwNawJZ6',
        'mikasa', 'ackerman', 1, 'mikasa_ackerman@cjl.com', '+12345678948', '002 Attack on Titan St, LA', 6,
        6, 15, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: ArminArlert@2025
        'armin_arlert', '$2b$12$8vnkqZS460GDsOlW0IGy.eJrXZsZVNGRR2Hiu5l3AQEjSssInRhNq',
        'armin', 'arlert', 0, 'armin_arlert@cjl.com', '+12345678949', '003 Attack on Titan St, LA', 7,
        6, 15, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: ReinerBraun@2025
        'reiner_braun', '$2b$12$4z7IAroEZe8EMXVVF2nJR.9lFFWtAXIfQ60nTmD3ysHEc8r8Au.AC',
        'reiner', 'braun', 0, 'reiner_braun@cjl.com', '+12345678950', '004 Attack on Titan St, LA', 7,
        6, 15, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: BertholdtHoover@2025
        'berthold_hoover', '$2b$12$iF9nkzYAlrn0Fk3YEojnA.aCkcYY/r7l4iTCJ8b7MN3h33oU8pVGW',
        'berthold', 'hoover', 0, 'berthold_hoover@cjl.com', '+12345678951', '005 Attack on Titan St, LA', 7,
        6, 16, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: AnnieLeonhart@2025
        'annie_leonhart', '$2b$12$mHmJR4oBHp9nc8dH3PGFkOvsjvtJW/1wAXazedkRLdRQHIw7BxTTq',
        'annie', 'leonhart', 0, 'annie_leonhart@cjl.com', '+12345678952', '006 Attack on Titan St, LA', 7,
        6, 16, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: ConnieSpringer@2025
        'connie_springer', '$2b$12$YpyA7pzsySdTvXbB41ISWea2R6dRIt93685P9BVhad4cKKPQ4C7Am',
        'connie', 'springer', 0, 'connie_springer@cjl.com', '+12345678953', '007 Attack on Titan St, LA', 13,
        6, 16, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),

    -- human resources department

    (
        -- password: SashaBlouse@2025
        'sasha_blouse', '$2b$12$TQahxBJVM0kxukjn/JJpDOZa3tTWwjD9.iWuDp2jX37C7vS1il9Zm',
        'sasha', 'blouse', 1, 'sasha_blouse@cjl.com', '+12345678954', '008 Attack on Titan St, LA', 6,
        7, NULL, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'chro'
    ),
    (
        -- password: HistoriaReiss@2025
        'historia_reiss', '$2b$12$s2liH34KmvxaSWK3czu35.anBqGF3/.N2y4Amn9pdDh5cTFJP0Rdq',
        'historia', 'reiss', 1, 'historia_reiss@cjl.com', '+12345678955', '009 Attack on Titan St, LA', 6,
        7, 17, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: ChristaLenz@2025
        'christa_lenz', '$2b$12$gtT4RoAUTpFxbFDfpKcgeekRFifNvHIxInD9klvLT4fhJrl0h75U2',
        'christa', 'lenz', 1, 'christa_lenz@cjl.com', '+12345678956', '010 Attack on Titan St, LA', 6,
        7, 17, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: ymir@2025
        'ymir', '$2b$12$seYW7zIf6LzLMpkpipRuoe3erlh0gwYNCt9FpVSQ9psnRTYtSqo0K',
        'ymir', 'ymir', 1, 'ymir@cjl.com', '+12345678957', '011 Attack on Titan St, LA', 6,
        7, 17, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: FlochForster@2025
        'floch_forster', '$2b$12$hSh1TxbH4IEco5fqpIfEgOguEzlgV5nSv5S4XCmc9ZhRprZtOTyvK',
        'floch', 'forster', 0, 'floch_forster@cjl.com', '+12345678958', '012 Attack on Titan St, LA', 6,
        7, 18, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: ErwinSmith@2025
        'erwin_smith', '$2b$12$RnClpE1SecGPpL2YJDXNp.DANFAo9GC8BJl.9Ru3hpwbLpIDpliE6',
        'erwin', 'smith', 0, 'erwin_smith@cjl.com', '+12345678959', '013 Attack on Titan St, LA', 6,
        7, 18, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: LeviAckerman@2025
        'levi_ackerman', '$2b$12$GkaAdrtAx3iZVnv8quCZVOm9HP88GH9sPY9SMmoWGtxNtx696zgyW',
        'levi', 'ackerman', 0, 'levi_ackerman@cjl.com', '+12345678960', '014 Attack on Titan St, LA', 6,
        7, 18, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: HangeZoe@2025
        'hange_zoe', '$2b$12$2xNALeW4zlfOsWJm8XVr4eIwJn7ZKsttY9oiaZRctsPkWIlqXu09m',
        'hange', 'zoe', 1, 'hange_zoe@cjl.com', '+12345678961', '015 Attack on Titan St, LA', 6,
        7, 19, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: MarloFredenburg@2025
        'marlo_fredenburg', '$2b$12$8BbdwiVNiOR/5iEB/9VLi.aOZ.cPVzmzRf.641SPJ98GER.XpedO.',
        'marlo', 'fredenburg', 0, 'marlo_fredenburg@cjl.com', '+12345678962', '016 Attack on Titan St, LA', 6,
        7, 19, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: HitchDreyse@2025
        'hitch_dreyse', '$2b$12$q0XGYaR4EzFxiZfVIGnSR.QKUNltsgs4OyyvgxkSMRHAcXLcGsVu2',
        'hitch', 'dreyse', 1, 'hitch_dreyse@cjl.com', '+12345678963', '017 Attack on Titan St, LA', 6,
        7, 19, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),

    -- IT department

    (
        -- password: YmirFritz@2025
        'ymir_fritz', '$2b$12$Y5pmyXuClJAsU32X4k8S7.ZM73K1.VhyvY1m7nWuc4IWUSW0yEDYG',
        'ymir', 'fritz', 1, 'ymir_fritz@cjl.com', '+12345678964', '018 Attack on Titan St, LA', 6,
        8, NULL, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'cio'
    ),
    (
        -- password: MariaFritz@2025
        'maria_fritz', '$2b$12$kpjmFJnuN4xXGibmJBLAPuJBlOxZpg2TStAythCI1pxWsF7wyQ7f.',
        'maria', 'fritz', 1, 'maria_fritz@cjl.com', '+12345678965', '019 Attack on Titan St, LA', 6,
        8, 20, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: RoseFritz@2025
        'rose_fritz', '$2b$12$0yD4dgYep9U8SokGElPUx.7EGYrj2ozrmpQI.8bcrlwxxB3/ziDiq',
        'rose', 'fritz', 1, 'rose_fritz@cjl.com', '+12345678966', '020 Attack on Titan St, LA', 6,
        8, 20, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: SinaFritz@2025
        'sina_fritz', '$2b$12$6.wsks4VCm/MiGrwtMhKqunvid7r97UsojXIoGTcMiFneYq0lLHGy',
        'sina', 'fritz', 1, 'sina_fritz@cjl.com', '+12345678967', '021 Attack on Titan St, LA', 6,
        8, 20, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: GrishaYeager@2025
        'grisha_yeager', '$2b$12$RDOtgJkTsO2K7F.EQbOOOumP6Oyu8agCFMBdsrVtkjzIf0duQmjjO',
        'grisha', 'yeager', 0, 'grisha_yeager@cjl.com', '+12345678968', '022 Attack on Titan St, LA', 6,
        8, 21, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: CarlaYeager@2025
        'carla_yeager', '$2b$12$IWPCYgfbc1KapNhbjhxshu2qWcgf4PuAneYVZoqGGc6oxVTEZq7Rq',
        'carla', 'yeager', 1, 'carla_yeager@cjl.com', '+12345678969', '023 Attack on Titan St, LA', 6,
        8, 21, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: ZekaYeager@2025
        'zeka_yeager', '$2b$12$N36Da0ZZah3y9lR6XbCCJOzFVe9oLh/.iaKshCP76gkxvFFRinch2',
        'zeka', 'yeager', 0, 'zeka_yeager@cjl.com', '+12345678970', '024 Attack on Titan St, LA', 6,
        8, 21, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: PieckFinger@2025
        'pieck_finger', '$2b$12$xIPB3YMuXOTM/xyUlZlmCuguM4MA4uzqKduRkLWNGHFyymNJUP7zS',
        'pieck', 'finger', 1, 'pieck_finger@cjl.com', '+12345678971', '025 Attack on Titan St, LA', 6,
        8, 22, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: GabiBraun@2025
        'gabi_braun', '$2b$12$oQ.Epx0NPCx78Oisz0J1aeIH1ItgsDF9BlQl1XTnvGwteDlenHK0.',
        'gabi', 'braun', 1, 'gabi_braun@cjl.com', '+12345678972', '026 Attack on Titan St, LA', 6,
        8, 22, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: FalcoGrice@2025
        'falco_grice', '$2b$12$JQ80rdF0pkgxGNa1B4zEs.rCQu.RBCXFqo3/TIKoNsF6YHtuMk1yK',
        'falco', 'grice', 1, 'falco_frice@cjl.com', '+12345678973', '027 Attack on Titan St, LA', 6,
        8, 22, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),

    -- compliance & risk department

    (
        -- password: Yelena@2025
        'yelena_aot', '$2b$12$3hCFM3B3PESvFz4bB9tfeOzh4dpLCtGtuIFkenLo2yNskbApMQRw2',
        'yelena', 'yelena', 1, 'yelena_aot@cjl.com', '+12345678974', '028 Attack on Titan St, LA', 6,
        9, NULL, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'cco'
    ),
    (
        -- password: Onyankopon@2025
        'onyankopon', '$2b$12$DkKMwp8gH5iW/QhkY.5h5.MiMycLrWD1JXnhNU6kB9stGDQh7Zzam',
        'onyankopon', 'onyankopon', 0, 'onyankopon@cjl.com', '+12345678975', '029 Attack on Titan St, LA', 6,
        9, 23, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: JessicaJones@2025
        'jessica_jones', '$2b$12$E9P.MMCVc7b8SiXgsGt6sO2x.N.hUNjGpVrPdlTiqbgJ2//WVWpLG',
        'jessica', 'jones', 1, 'jessica_jones@cjl.com', '+12345678976', '001 Jessica Jones St, LA', 6,
        9, 23, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: LukeCage@2025
        'luke_cage', '$2b$12$vfpyLsZ6HYLp.fLU08nCW.gEphmooo1G5Ince9dVIGMD.KdoVRECy',
        'luke', 'cage', 0, 'luke_cage@cjl.com', '+12345678977', '002 Jessica Jones St, LA', 6,
        9, 23, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: PatriciaWalker@2025
        'patricia_walker', '$2b$12$zutR4zvqXUAufL2CFfrw0eOLyawT3Q1p3DEFjrNb6M1Xv5UGaytt.',
        'patricia', 'walker', 1, 'patricia_walker@cjl.com', '+12345678978', '003 Jessica Jones St, LA', 6,
        9, 24, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: Daredevil@2025
        'daredevil', '$2b$12$r3eDonEmKdx7oPIy7QBeJ.hdKB/2xQvCZpTyaSQF8Q/thMWEJlFdq',
        'matt', 'murdock', 0, 'daredevil@cjl.com', '+12345678979', '001 Defenders St, LA', 6,
        9, 24, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password:  IronFist@2025
        'iron_fist', '$2b$12$lzOdeIzrsaKt1xI9u7/jMOZF95u1D5NVrTEo/NrVos6T2jpYzbsiu',
        'danny', 'rand', 1, 'iron_fist@cjl.com', '+12345678980', '002 Defenders St, LA', 6,
        9, 24, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    );