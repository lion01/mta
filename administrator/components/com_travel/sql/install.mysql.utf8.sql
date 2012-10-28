CREATE TABLE IF NOT EXISTS `#__travel_packages` (
	`id` int(11) NOT NULL auto_increment,
	`params` text NOT NULL DEFAULT '',
	`title` VARCHAR(255) NOT NULL ,
	`content` TEXT ,
	`commission_rate` DECIMAL(10,2 ) NOT NULL ,
	`price` DECIMAL(10,2 ) NOT NULL ,
	`unit` FLOAT(10,2 ) NOT NULL DEFAULT 1 ,
	`ordering` INT(11) ,
	`published` TINYINT NOT NULL DEFAULT 0 ,
	`renewable` TINYINT NOT NULL DEFAULT 0 ,
	`creation_date` DATE ,
	`modification_date` DATE ,

	PRIMARY KEY  (`id`)
);

CREATE TABLE IF NOT EXISTS `#__travel_sales` (
	`id` int(11) NOT NULL auto_increment,
	`params` text NOT NULL DEFAULT '',
	`user_id` INT(11) NOT NULL ,
	`payment` DECIMAL(10,2 ) DEFAULT 0 ,
	`total_commission` DECIMAL(10,2 ) NOT NULL DEFAULT 0 ,
	`total_amount` DECIMAL(10,2 ) NOT NULL DEFAULT 0 ,
	`total_unit` FLOAT(10,2 ) NOT NULL DEFAULT 0 ,
	`status` VARCHAR(255) NOT NULL DEFAULT '1' ,
	`shipping` VARCHAR(255) NOT NULL DEFAULT '1' ,
	`order_date` DATETIME ,
	`modification_date` DATETIME ,
	`payment_reference_code` VARCHAR(255) ,

	PRIMARY KEY  (`id`)
);

CREATE TABLE IF NOT EXISTS `#__travel_carts` (
	`id` int(11) NOT NULL auto_increment,
	`params` text NOT NULL DEFAULT '',
	`package_id` INT(11) NOT NULL ,
	`quantity` INT(11) NOT NULL ,
	`user_id` INT(11) NOT NULL ,

	PRIMARY KEY  (`id`)
);

CREATE TABLE IF NOT EXISTS `#__travel_saleitems` (
	`id` int(11) NOT NULL auto_increment,
	`params` text NOT NULL DEFAULT '',
	`package_id` INT(11) NOT NULL ,
	`sale_id` INT(11) NOT NULL ,
	`quantity` INT(11) NOT NULL ,
	`unit` FLOAT(10,2 ) NOT NULL ,
	`price` DECIMAL(10,2 ) NOT NULL ,
	`commission_rate` DECIMAL(10,2 ) NOT NULL ,
	`renewal` TINYINT NOT NULL DEFAULT 0 ,

	PRIMARY KEY  (`id`)
);

CREATE TABLE IF NOT EXISTS `#__travel_commissions` (
	`id` int(11) NOT NULL auto_increment,
	`params` text NOT NULL DEFAULT '',
	`user_id` INT(11) ,
	`amount` DECIMAL(10,2 ) NOT NULL DEFAULT 0 ,
	`attachment` VARCHAR(255) ,
	`payment_date` DATE NOT NULL ,
	`created_date` DATETIME ,
	`type` VARCHAR(255) NOT NULL DEFAULT '1' ,

	PRIMARY KEY  (`id`)
);

CREATE TABLE IF NOT EXISTS `#__travel_agents` (
	`id` int(11) NOT NULL auto_increment,
	`params` text NOT NULL DEFAULT '',
	`user_id` INT(11) NOT NULL ,
	`parent` INT(11) ,
	`bank` VARCHAR(255) NOT NULL ,
	`bank_account_number` VARCHAR(255) NOT NULL ,
	`organization` VARCHAR(255) ,
	`street_address` VARCHAR(255) NOT NULL ,
	`address` VARCHAR(255) ,
	`postcode` VARCHAR(255) NOT NULL ,
	`city` VARCHAR(255) NOT NULL ,
	`state` VARCHAR(255) NOT NULL ,
	`country` VARCHAR(255) NOT NULL DEFAULT 'Malaysia' ,
	`contact_phone` VARCHAR(255) NOT NULL ,
	`expired_date` DATE NOT NULL ,

	PRIMARY KEY  (`id`)
);



