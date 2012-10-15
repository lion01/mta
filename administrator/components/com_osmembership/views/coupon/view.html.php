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

OSFactory::loadLibrary('viewform') ;
/**
 * HTML View class for OS Membership component
 *
 * @static
 * @package		Joomla
 * @subpackage	OS Membership
 * @since 1.5
 */
class OSMembershipViewCoupon extends OSViewForm
{
	function _buildListArray(&$lists, $item) {						
		$db = & JFactory::getDbo() ;
		$sql = 'SELECT id, title FROM #__osmembership_plans WHERE published = 1 ORDER BY ordering ';
		$db->setQuery($sql) ;
		$options = array();
		$options[] = JHTML::_('select.option', 0, JText::_('OSM_ALL_PLANS'), 'id', 'title');
		$options = array_merge($options, $db->loadObjectList()) ;
		$lists['plan_id'] = JHTML::_('select.genericlist', $options, 'plan_id', ' class="inputbox" ', 'id', 'title', $item->plan_id);
		
		$options = array() ;
		$options[] = JHTML::_('select.option', 0, JText::_('%'));
		//$options[] = JHTML::_('select.option', 1, OSMembershipHelper::getConfigValue('currency_symbol'));
		$options[] = JHTML::_('select.option', 1, '$');
		$lists['coupon_type'] = JHTML::_('select.genericlist', $options, 'coupon_type', 'class="inputbox"', 'value', 'text', $item->coupon_type);
		
		
		$this->nullDate = '0000-00-00' ;
		
		
		return true ;
	}
}