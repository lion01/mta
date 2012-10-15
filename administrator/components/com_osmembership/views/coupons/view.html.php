<?php
/**
* @version		1.0.0
 * @package		Joomla
* @subpackage	OS Membership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2012 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */
// no direct access
defined( '_JEXEC' ) or die ;
OSFactory::loadLibrary('viewlist') ;
/**
 * HTML View class for OS Membership component
 *
 * @static
 * @package		Joomla
 * @subpackage	OS Membership
 * @since 1.5
 */
class OSMembershipViewCoupons extends OSViewList
{
	function _buildListArray(&$lists, $state) {
		$db = & JFactory::getDbo() ;
		$discountTypes = array(0 => '%', 1 => OSMembershipHelper::getConfigValue('currency_symbol')) ;		
		$nullDate = $db->getNullDate() ;		
		
		
		$sql = 'SELECT id, title FROM #__osmembership_plans WHERE published=1 ORDER BY ordering ';
		$db->setQuery($sql) ;		
		$options = array();
		$options[] = JHTML::_('select.option', 0, JText::_('OSM_PLAN'), 'id', 'title');
		$options = array_merge($options, $db->loadObjectList()) ;
		$lists['plan_id'] = JHTML::_('select.genericlist', $options, 'plan_id', ' class="inputbox" onchange="submit();"', 'id', 'title', $state->plan_id);		
		
		$this->dateFormat = OSMembershipHelper::getConfigValue('date_format');
		$this->nullDate = '0000-00-00' ;						
		$this->discountTypes = $discountTypes ;							
	}
}