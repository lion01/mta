CREATE TABLE IF NOT EXISTS `#__travel_packages` (
	`id` int(11) NOT NULL auto_increment,
	`params` text NOT NULL DEFAULT '',
	`title` VARCHAR(255) NOT NULL ,
	`content` TEXT ,
	`commission_type` VARCHAR(255) NOT NULL DEFAULT '0' ,
	`comisssion_rate` DECIMAL(10,2 ) NOT NULL ,
	`price` DECIMAL(10,2 ) NOT NULL ,
	`value` DECIMAL(10,2 ) NOT NULL ,
	`ordering` INT(11) ,
	`creation_date` DATE ,
	`modification_date` DATE ,
	`published` TINYINT ,

	PRIMARY KEY  (`id`)
);

CREATE TABLE IF NOT EXISTS `#__travel_sales` (
	`id` int(11) NOT NULL auto_increment,
	`params` text NOT NULL DEFAULT '',
	`user_id` INT(11) NOT NULL ,
	`payment` DECIMAL(10,2 ) DEFAULT 0 ,
	`completed` TINYINT NOT NULL DEFAULT 0 ,
	`creation_date` DATE ,
	`modification_date` DATE ,
	`completion_date` DATE ,
	`total_commission` DECIMAL(10,2 ) NOT NULL ,
	`total_amount` DECIMAL(10,2 ) ,

	PRIMARY KEY  (`id`)
);

CREATE TABLE IF NOT EXISTS `#__travel_withdraws` (
	`id` int(11) NOT NULL auto_increment,
	`params` text NOT NULL DEFAULT '',
	`amount` DECIMAL(10,2 ) NOT NULL ,
	`total_paid` DECIMAL(10,2 ) NOT NULL DEFAULT 0 ,
	`user_id` INT(11) NOT NULL ,
	`creation_date` DATE ,
	`payment_date` DATE ,

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
	`comission_rate` DECIMAL(10,2 ) NOT NULL ,
	`comission_type` VARCHAR(255) NOT NULL DEFAULT '0' ,

	PRIMARY KEY  (`id`)
);

CREATE TABLE IF NOT EXISTS `#__travel_withdrawitems` (
	`id` int(11) NOT NULL auto_increment,
	`params` text NOT NULL DEFAULT '',
	`sale_id` INT(11) ,
	`withdraw_id` INT(11) ,
	`total_comission` DECIMAL(10,2 ) ,

	PRIMARY KEY  (`id`)
);



