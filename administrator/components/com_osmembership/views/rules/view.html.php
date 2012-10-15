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
class OSMembershipViewRules extends OSViewList
{
	function _buildListArray(&$lists, $state) {
		$db = & JFactory::getDbo() ;
		$sql = 'SELECT id, title FROM #__osmembership_plans WHERE published=1 ORDER BY ordering ';
		$db->setQuery($sql) ;
		$plans = $db->loadObjectList() ;
		$options = array();
		$options[] = JHTML::_('select.option', 0, JText::_('OSM_FROM_PLAN'), 'id', 'title');
		$options = array_merge($options, $plans) ;
		$lists['from_plan_id'] = JHTML::_('select.genericlist', $options, 'from_plan_id', ' class="inputbox" onchange="submit();"', 'id', 'title', $state->from_plan_id);
		
		$options = array();
		$options[] = JHTML::_('select.option', 0, JText::_('OSM_TO_PLAN'), 'id', 'title');
		$options = array_merge($options, $plans) ;
		$lists['to_plan_id'] = JHTML::_('select.genericlist', $options, 'to_plan_id', ' class="inputbox" onchange="submit();"', 'id', 'title', $state->to_plan_id);	
	}	
}