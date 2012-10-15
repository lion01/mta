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
 * HTML View class for OS Membership Component
 *
 * @static
 * @package		Joomla
* @subpackage	OS Membership
 * @since 1.5
 */
class OSMembershipViewFields extends OSViewList
{	

	function _buildListArray(&$lists, $state) {
		$db = & JFactory::getDbo() ;
		$sql = 'SELECT id, title FROM #__osmembership_plans WHERE published = 1 ORDER BY ordering ';
		$db->setQuery($sql) ;
		$options = array();
		$options[] = JHTML::_('select.option', 0, JText::_('OSM_ALL_PLANS'), 'id', 'title');
		$options = array_merge($options, $db->loadObjectList()) ;
		$lists['plan_id'] = JHTML::_('select.genericlist', $options, 'plan_id', ' class="inputbox" onchange="submit();" ', 'id', 'title', $state->plan_id);
		$options = array() ;
		$options[] = JHTML::_('select.option', 1, JText::_('Yes'));
		$options[] = JHTML::_('select.option', 2, JText::_('No'));			
		$lists['show_core_field'] = JHTML::_('select.genericlist', $options, 'show_core_field', ' class="inputbox" onchange="submit();" ', 'value', 'text', $state->show_core_field);
		
		return true ;
	}		
}