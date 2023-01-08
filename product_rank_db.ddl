-- -----------------------------------------------------
-- Schema product_rank_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `product_rank_db` DEFAULT CHARACTER SET utf8 ;
USE `product_rank_db` ;

-- -----------------------------------------------------
-- Table `bookmark`
-- -----------------------------------------------------
CREATE TABLE `bookmark` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`user_id` INT UNSIGNED NOT NULL,
	`product_id` INT UNSIGNED NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	KEY `idx_bookmark_user_id` (`user_id`) USING BTREE,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;
