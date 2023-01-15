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

create table `company`
(
    `id`                  bigint       not null auto_increment,
    `company_description` varchar(255),
    `company_name`       varchar(255) not null,
    `company_number`     varchar(255) not null,
    user_id             bigint,
    primary key (id)
) engine = InnoDB;

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
alter table comments
    add constraint FKj9to9e3tjoimlgn3w4vjm4xe3 foreign key (product_id) references product (id);
alter table comments
    add constraint FKd0asydy8kwqj5f6l6okr43hbl foreign key (user_id) references product_user (id);
alter table company
    add constraint FKsgw1969061fdsrl9d4hv3ouq1 foreign key (user_id) references product_user (id);
alter table product
    add constraint FKghawd5rtv8ok565nwpdyyuto9 foreign key (company_id) references company (id);
