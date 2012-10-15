<?php
/**
 * @version		1.5.0
 * @package		Joomla
 * @subpackage	OS Membership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2011 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */
defined('_JEXEC') or die ;
OSFactory::loadLibrary('modellist');

class OSMembershipModelSubscriptions extends OSModelList {
	function __construct($config) {
		$config['main_table'] = '#__osmembership_subscribers' ;
				
		parent::__construct($config) ;
	}
	
	function _buildQuery() {
		$where		= $this->_buildContentWhere();
		$orderby	= $this->_buildContentOrderBy();
		$query = 'SELECT a.*, b.title AS plan_title, b.enable_renewal, b.recurring_subscription	FROM #__osmembership_subscribers  AS a '
		.' LEFT JOIN #__osmembership_plans AS b '
		.' ON a.plan_id = b.id '		
		. $where
		.' ORDER BY a.id DESC '
		;
		
		return $query ;
	}	
	/**
	 * Get array of conditions used to get data from database
	 * @see OSModelList::_buildContentWhereArray()
	 */
	function _buildContentWhereArray() {
		$user = & JFactory::getUser() ;
		$where = array();
		$where[] = ' a.user_id= '.$user->get('id');
		
		return $where ;				
	}
}