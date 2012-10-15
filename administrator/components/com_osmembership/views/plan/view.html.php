<?php
/**
 * @version		1.5.0
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
class OSMembershipViewPlan extends OSViewForm
{
	function _buildListArray(&$lists, $item) {
	
		JPluginHelper::importPlugin( 'osmembership' );
		$dispatcher =& JDispatcher::getInstance();		
		$db = JFactory::getDbo() ;
		$nullDate = $db->getNullDate();
		//Trigger plugins		
		$results = $dispatcher->trigger( 'onEditSubscriptionPlan', array($item));				
								
		$lists['enable_renewal'] = JHTML::_('select.booleanlist', 'enable_renewal', ' class="inputbox" ', $item->enable_renewal);
		$lists['recurring_subscription'] = JHTML::_('select.booleanlist', 'recurring_subscription', ' class="inputbox" ', $item->recurring_subscription);
		$lists['thumb'] = JHTML::_('list.images', 'thumb', $item->thumb, ' ', '/media/com_osmembership/');
				
		//Get list of renewal options	
		if ($item->id > 0) {
			$sql = 'SELECT number_days, price FROM #__osmembership_renewrates WHERE plan_id='.$item->id.' ORDER BY id ';
			$db->setQuery($sql) ;
			$prices = $db->loadObjectList() ;
		} else {
			$prices = array();	
		}
		
		$sql = 'SELECT id, title FROM #__osmembership_categories WHERE published = 1 ORDER BY title ';
		$db->setQuery($sql) ;
		$options = array();
		$options[] = JHTML::_('select.option', 0, JText::_('OSM_SELECT_CATEGORY'), 'id', 'title');
		$options = array_merge($options, $db->loadObjectList()) ;
		$lists['category_id'] = JHTML::_('select.genericlist', $options, 'category_id', ' class="inputbox" ', 'id', 'title', $item->category_id);
									
		$this->prices = $prices ;
		$this->plugins = $results ;		
		$this->nullDate = $nullDate ;
									
		return true ;
	}
}