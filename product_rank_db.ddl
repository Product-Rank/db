-- -----------------------------------------------------
-- Schema product_rank_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `product_rank_db` DEFAULT CHARACTER SET utf8 ;
USE `product_rank_db` ;

-- -----------------------------------------------------
-- Table `bookmark`
-- -----------------------------------------------------
CREATE TABLE `bookmark` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`user_id` INT UNSIGNED NOT NULL,
	`product_id` INT UNSIGNED NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	KEY `idx_bookmark_user_id` (`user_id`) USING BTREE,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;
-- -----------------------------------------------------
-- Table `ranking`
-- -----------------------------------------------------
CREATE TABLE `ranking` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`product_id` INT UNSIGNED NOT NULL,
	`type` VARCHAR(255) NOT NULL,
	`year` SMALLINT,
	`month` TINYINT,
	`week` TINYINT,
	`day` TINYINT,
	`rank` TINYINT,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	KEY `idx_ranking_product_id` (`product_id`) USING BTREE,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;
-- -----------------------------------------------------
-- Table `questionnaire`
-- -----------------------------------------------------
CREATE TABLE `questionnaire` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`user_id` INT UNSIGNED NOT NULL,
	`question` TEXT,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	KEY `idx_questionnaire_user_id` (`user_id`) USING BTREE,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;
-- -----------------------------------------------------
-- Table `community`
-- -----------------------------------------------------
CREATE TABLE `community` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`user_id` INT UNSIGNED NOT NULL,
	`title` VARCHAR(255) NOT NULL,
	`contents` TEXT,
	`view` INT UNSIGNED NOT NULL DEFAULT 0,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	KEY `idx_community_user_id` (`user_id`) USING BTREE,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;
-- -----------------------------------------------------
-- Table `product_user`
-- -----------------------------------------------------
create table `product_user`
(
    id            bigint       not null auto_increment,
    thumbnail_url varchar(255),
    email         varchar(255) not null,
    nick_name     varchar(255),
    sns_type      varchar(255) not null,
    user_name     varchar(255) not null,
    primary key (id)
) engine = InnoDB;
-- -----------------------------------------------------
-- Table `company`
-- -----------------------------------------------------
create table `company`
(
    `id`                  bigint       not null auto_increment,
    `company_description` varchar(255),
    `company_name`       varchar(255) not null,
    `company_number`     varchar(255) not null,
    user_id             bigint,
    primary key (id)
) engine = InnoDB;
-- -----------------------------------------------------
-- Table `product`
-- -----------------------------------------------------
create table `product`
(
    id                  bigint       not null auto_increment,
    thumbnail_url       varchar(255),
    like_cnt            bigint,
    product_description varchar(255),
    product_name        varchar(255) not null,
    company_id          bigint,
    primary key (id)
) engine = InnoDB;
-- -----------------------------------------------------
-- Table `product_image`
-- -----------------------------------------------------
create table `product_image`
(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `product_id` INT UNSIGNED NOT NULL,
	`url` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	KEY `idx_product_image_product_id` (`product_id`) USING BTREE,
    primary key (id)
) engine = InnoDB;
-- -----------------------------------------------------
-- Table `comments`
-- -----------------------------------------------------
create table `comments`
(
    `id`         bigint       not null auto_increment,
    `comment`    varchar(255) not null,
    `like_cnt`   bigint,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    parents_id bigint,
    product_id bigint,
    user_id    bigint,
    primary key (id)
) engine = InnoDB;
