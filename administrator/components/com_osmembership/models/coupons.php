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

class OSMembershipModelCoupons extends OSModelList {
	function __construct($config) {
		$config['title_field'] = 'a.code' ;
		$config['state_vars'] = array(
									'filter_order' => array('a.code', 'string', 1),	
									'plan_id' => array(0, 'int', 1)
								) ;	
				
		parent::__construct($config) ;
	}

	function _buildContentWhereArray() {
		$state = $this->getState() ;
		$where = parent::_buildContentWhereArray() ;
		if ($state->plan_id >0)
			$where[] = ' a.plan_id='.$state->plan_id ;
			
		return $where ;
	}
}