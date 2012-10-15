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
class OSMembershipViewSubscribers extends OSViewList
{	
	function _buildListArray(&$lists, $state) {
		$db = & JFactory::getDbo() ;
		$config = OSMembershipHelper::getConfig();
		$dateFormat = $config->date_format ;
		
		$sql = 'SELECT id, title FROM #__osmembership_plans WHERE published = 1 ORDER BY ordering ';
		$db->setQuery($sql) ;
		$options = array();
		$options[] = JHTML::_('select.option', 0, JText::_('OSM_ALL_PLANS'), 'id', 'title');
		$options = array_merge($options, $db->loadObjectList()) ;
		$lists['plan_id'] = JHTML::_('select.genericlist', $options, 'plan_id', ' class="inputbox" onchange="submit();" ', 'id', 'title', $state->plan_id);
		
		$options = array();
		$options[] = JHTML::_('select.option', -1, JText::_('OSM_ALL'));
		$options[] = JHTML::_('select.option', 0, JText::_('OSM_PENDING'));
		$options[] = JHTML::_('select.option', 1, JText::_('OSM_ACTIVE'));
		$options[] = JHTML::_('select.option', 2, JText::_('OSM_EXPIRED'));
		$options[] = JHTML::_('select.option', 3, JText::_('OSM_CANCELLED_PENDING'));
		$options[] = JHTML::_('select.option', 4, JText::_('OSM_CANCELLED_REFUNDED'));		
		$lists['published'] = JHTML::_('select.genericlist', $options, 'published', ' class="inputbox" onchange="submit();" ', 'value', 'text', $state->published);
				
		$this->dateFormat = $dateFormat ;	
		$this->config = $config ;
						
		return true ;
	}
}