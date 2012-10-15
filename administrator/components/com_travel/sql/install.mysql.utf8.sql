CREATE TABLE IF NOT EXISTS `#__travel_packages` (
	`id` int(11) NOT NULL auto_increment,
	`params` text NOT NULL DEFAULT '',
	`title` VARCHAR(255) NOT NULL ,
	`content` TEXT ,
	`commission_type` VARCHAR(255) NOT NULL DEFAULT '0' ,
	`commission_rate` INT(11) NOT NULL ,
	`price` DECIMAL(10,2 ) NOT NULL ,
	`value` DECIMAL(10,2 ) ,
	`ordering` INT(11) ,
	`checked_out` INT(11) NOT NULL DEFAULT 0 ,
	`published` TINYINT ,
	`creation_date` DATE ,
	`modification_date` DATE ,

	PRIMARY KEY  (`id`)
);

CREATE TABLE IF NOT EXISTS `#__travel_sales` (
	`id` int(11) NOT NULL auto_increment,
	`params` text NOT NULL DEFAULT '',
	`package_id` INT(11) NOT NULL ,
	`quantity` INT(11) NOT NULL ,
	`agent` INT(11) NOT NULL ,
	`payment` DECIMAL(10,2 ) DEFAULT 0 ,
	`completed` TINYINT DEFAULT 0 ,
	`creation_date` DATE ,
	`modification_date` DATE ,
	`comission_rate` DECIMAL(10,2 ) NOT NULL ,
	`comission_type` VARCHAR(255) NOT NULL DEFAULT '0' ,

	PRIMARY KEY  (`id`)
);

CREATE TABLE IF NOT EXISTS `#__travel_withdraws` (
	`id` int(11) NOT NULL auto_increment,
	`params` text NOT NULL DEFAULT '',
	`amount` DECIMAL(10,2 ) NOT NULL ,
	`agent` INT(11) NOT NULL ,
	`creation_date` DATE ,

	PRIMARY KEY  (`id`)
);

CREATE TABLE IF NOT EXISTS `#__travel_carts` (
	`id` int(11) NOT NULL auto_increment,
	`params` text NOT NULL DEFAULT '',
	`package` INT(11) ,
	`quantity` INT(11) ,
	`user` INT(11) ,

	PRIMARY KEY  (`id`)
);



