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

OSFactory::loadLibrary('modellist');

class OSMembershipModelFields extends OSModelList {
	function __construct($config) {		
		$config['title_field'] = array('a.name', 'a.title');
		$config['state_vars'] = array('show_core_field' => array(0, 'int', true),
									  'plan_id' => array(0, 'int', true)															
				);
				
		parent::__construct($config) ;
	}	
}