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

class OSMembershipModelSubscribers extends OSModelList {
	function __construct($config) {
		$config['title_field'] = array('a.first_name', 'a.last_name') ;
		$config['default_ordering'] = ' a.created_date' ;
		$config['state_vars'] = array('plan_id' => array(0, 'int', true),
									  'filter_order' => array('a.created_date', 'string', true),
									  'published' => array(-1, 'int', true)										 														
				);
				
		parent::__construct($config) ;
	}	
	
	
	function _buildQuery() {
		$where		= $this->_buildContentWhere();
		$orderby	= $this->_buildContentOrderBy();
		$query = 'SELECT a.*, b.title AS plan_title, c.username AS username FROM #__osmembership_subscribers  AS a '
		.' LEFT JOIN #__osmembership_plans AS b '
		.' ON a.plan_id = b.id '
		.' LEFT JOIN #__users AS c '
		.' ON a.user_id = c.id '
		. $where
		. $orderby
		;
				
		return $query ;				
	}
	
	
	function _buildContentWhereArray() {		
		$where = parent::_buildContentWhereArray() ;
		$state = $this->getState() ;
		if ($state->plan_id) {
			$where[] = ' a.plan_id = '.$state->plan_id ;	
		}		
		if ($state->published != -1) {
			$where[] = ' a.published = '.$state->published ;
		}
		
		return $where ;
	}
	
}