<?php
/**
 * @version		1.5.0
 * @package		Joomla
 * @subpackage	OS Membership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2012 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */
// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die ;

OSFactory::loadLibrary('model') ;
/**
 * EventBooking Component Picture Model
 *
 * @package		Joomla
* @subpackage	Quick Gallery
 * @since 1.5
 */
class OSMembershipModelRule extends OSModel
{
	function __construct($config) {
		$config['table_name'] = '#__osmembership_upgraderules' ;

		parent::__construct($config);
	}	
}