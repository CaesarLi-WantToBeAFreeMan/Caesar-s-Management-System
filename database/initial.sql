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

-- create table departments

DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique department ID',
    `name` VARCHAR(100) NOT NULL UNIQUE COMMENT 'department name',
    `description` TEXT DEFAULT NULL COMMENT 'department description',
    `parent_department_id` BIGINT UNSIGNED DEFAULT NULL COMMENT 'parent department ID',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'department creation time in GMT',
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'department update time in GMT',
    FOREIGN KEY (`parent_department_id`)
    REFERENCES `departments` (`id`)
    ON DELETE SET NULL,
    INDEX idx_department_name (`name`)
)   ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'department table';

-- create roles table

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique role ID',
    `name` VARCHAR(12) UNIQUE NOT NULL COMMENT 'role name',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'role creation time in GMT',
    INDEX idx_role_name (`name`)
)   ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'role table';

-- create users table

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique user ID',
    `username` VARCHAR(50) NOT NULL UNIQUE COMMENT 'unique username for login',
    `password` VARCHAR(255) NOT NULL COMMENT 'BCrypt hashed password',
    `first_name` VARCHAR(100) NOT NULL COMMENT 'user first name',
    `last_name` VARCHAR(100) NOT NULL COMMENT 'user last name',
    `gender` ENUM(
        'male',
        'female',
        'non-binary',
        'other'
    ) NOT NULL COMMENT 'user gender',
    `email` VARCHAR(100) NOT NULL UNIQUE COMMENT 'user email',
    `phone` VARCHAR(20) NOT NULL UNIQUE COMMENT 'user phone in E.164 format',
    `address` VARCHAR(255) NOT NULL COMMENT 'user contact address',
    `diploma` VARCHAR(255) DEFAULT NULL COMMENT 'user educational qualification',
    `department_id` BIGINT UNSIGNED DEFAULT NULL COMMENT 'user department id',
    `hire_date` DATE DEFAULT NULL COMMENT 'user hire date',
    `salary` DECIMAL(14, 2) DEFAULT 0.00 COMMENT 'user salary',
    `currency` CHAR(3) DEFAULT 'USD' COMMENT 'user preferred currency in ISO 4217',
    `first_language` CHAR(5) DEFAULT 'en-US' COMMENT 'user first language in BCP 47',
    `second_language` CHAR(5) DEFAULT NULL COMMENT 'user second language in BCP 47',
    `third_language` CHAR(5) DEFAULT NULL COMMENT 'user third language in BCP 47',
    `first_nationality` CHAR(3) DEFAULT 'USA' COMMENT 'user first nationality in ISO 3166-1 alpha-3',
    `second_nationality` CHAR(3) DEFAULT NULL COMMENT 'user second nationality in ISO 3166-1 alpha-3',
    `status` BOOLEAN DEFAULT TRUE COMMENT 'user account status(TRUE = active, FALSE = inactive)',-- synonym (alias) for `TINYINT(1)`
    `icon` VARCHAR(255) DEFAULT NULL COMMENT 'user icon URL',
    `description` TEXT DEFAULT NULL COMMENT 'user description',
    `skills` TEXT DEFAULT NULL COMMENT 'user skills (comma-separated or JSON)',
    `position` VARCHAR(100) DEFAULT NULL COMMENT 'user job position',
    `provider` VARCHAR(50) DEFAULT NULL COMMENT 'social media provider',
    `provider_id` VARCHAR(255) DEFAULT NULL COMMENT 'social media provider user ID',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'account creation time in GMT',
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'account update time in GMT',
    `comment` TEXT DEFAULT NULL COMMENT 'manager comments on user',
    `remark` TEXT DEFAULT NULL COMMENT 'manager remarks on user',
    FOREIGN KEY (`department_id`)
    REFERENCES `departments` (`id`)
    ON DELETE SET NULL,
    INDEX idx_username (`username`),
    INDEX idx_email (`email`),
    INDEX idx_phone (`phone`),
    INDEX idx_department (`department_id`)
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

-- create user_role table

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`(
    `user_id` BIGINT UNSIGNED NOT NULL COMMENT 'user ID',
    `role_id` BIGINT UNSIGNED NOT NULL COMMENT 'role ID',
    PRIMARY KEY (`user_id`, `role_id`),
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE CASCADE,
    FOREIGN KEY (`role_id`)
    REFERENCES `roles` (`id`)
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
    `user_id` BIGINT UNSIGNED NOT NULL COMMENT 'user ID',
    `skill_id` BIGINT UNSIGNED NOT NULL COMMENT 'skill ID',
    PRIMARY KEY (`user_id`, `skill_id`),
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
    `request_type` ENUM(
        'promotion',
        'salary_increase',
        'quit'
    ) NOT NULL COMMENT 'type of request',
    `details` TEXT DEFAULT NULL COMMENT 'request details',
    `status` ENUM(
        'pending',
        'approved',
        'rejected'
    ) DEFAULT 'pending' COMMENT 'request status',
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
    INDEX idx_request_status (`status`),
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
    `title` VARCHAR(50) NOT NULL COMMENT 'message title',
    `content` TEXT NOT NULL COMMENT 'message content',
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
    `report_type` ENUM(
        'excel',
        'markdown',
        'latex',
        'csv',
        'tsv'
    ) NOT NULL COMMENT 'report file type',
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
    `upload_type` ENUM(
        'excel',
        'markdown',
        'latex',
        'csv',
        'tsv'
    ) NOT NULL COMMENT 'upload file type',
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
    `action_type` ENUM(
        'register',
        'login',
        'logout',
        'reset-password',
        'update-info',
        'view-info',
        'report-data',
        'load-data',
        'create-department',
        'update-department',
        'delete-department',
        'create-role',
        'update-role',
        'delete-role',
        'update-user',
        'delete-user',
        'create-skill',
        'update-skill',
        'delete-skill',
        'send-request',
        'view-request',
        'approve-request',
        'reject-request',
        'send-message',
        'view-message'
    ) NOT NULL COMMENT 'action type',
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