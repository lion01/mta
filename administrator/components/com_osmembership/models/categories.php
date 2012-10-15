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

class OSMembershipModelCategories extends OSModelList {
	function __construct($config) {		
		$config['state_vars'] = array(
				'filter_order' => array('a.title', 'string', 1)				
		) ;
	
		parent::__construct($config) ;
	}
}