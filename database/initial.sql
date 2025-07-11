/*
    database server type:   mysql 8.0
    database server host:   localhost:3306
    database schema:        cms_test
    served application:     Caesar's Management  System
*/

-- use character set utf8
SET NAMES utf8mb4;

-- cms_test database

DROP DATABASE IF EXISTS `cms_test`;
CREATE DATABASE `cms_test`;
USE `cms_test`;

-- user table

DROP TABLE IF EXISTS `cms_users`;
CREATE TABLE `cms_users`(
    `id` INT PRIMARY KEY AUTO_INCREMENT COMMENT 'user id',
    `email` VARCHAR(255) NOT NULL  DEFAULT '' COMMENT 'user email',
    `username` VARCHAR(30) UNIQUE NOT NULL DEFAULT '' COMMENT 'user display name',
    `password` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'user password',
    `creation_datetime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'user creation time in UTC',
    `status` BOOLEAN NOT NULL DEFAULT TRUE COMMENT 'account status, true for active and false for disabled'
);

-- records of cms_users

INSERT INTO `cms_users`(
    email, username, password, creation_datetime, status
)VALUES(
    'caesar@caesar.com',
    'Caesar James LEE',
    'FuckCPP@8964!CPPMustBeDie#FreeChina',
    '2025-07-10 00:00:00',
    TRUE
);
INSERT INTO `cms_users`(
    email, username, password, creation_datetime, status
)VALUES(
    'caesar@caesa.com',
    'James',
    'FuckCPP@8964!CPPMustBeDie#FreeChina',
    '2025-07-10 01:00:02',
    FALSE
);