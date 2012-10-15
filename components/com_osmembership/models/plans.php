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
class OSMembershipModelPlans extends OSModelList {
	function __construct($config) {
										
		parent::__construct($config) ;
	}	
	/**
	 * 
	 * @see OSModelList::_buildContentWhereArray()
	 */
	function _buildContentWhereArray() {
		$where = array();
		$categoryId = JRequest::getInt('category_id') ;
		$where[] = ' a.published = 1 ';
		if($categoryId) {
			$where[] = 'a.category_id='.$categoryId ;
		}
		
		return $where ;
	}
}