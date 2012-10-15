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
class OSMembershipViewSubscriber extends OSViewForm
{
	function _buildListArray(&$lists, $item) {
	
		$db = & JFactory::getDbo() ;
		$sql = 'SELECT id, title FROM #__osmembership_plans WHERE published = 1 ORDER BY ordering ';
		$db->setQuery($sql) ;
		$options = array();
		$options[] = JHTML::_('select.option', 0, JText::_('OSM_ALL_PLANS'), 'id', 'title');
		$options = array_merge($options, $db->loadObjectList()) ;
		$lists['plan_id'] = JHTML::_('select.genericlist', $options, 'plan_id', ' class="inputbox" ', 'id', 'title', $item->plan_id);
		
		$sql = 'SELECT id, username FROM #__users';
		$db->setQuery($sql);
		$options = array();
		$options[] = JHTML::_('select.option', 0, JText::_('JOPTION_NO_USER'), 'id', 'username');
		$options = array_merge($options, $db->loadObjectList()) ;
								
		$lists['user_id'] = JHTML::_('select.genericlist', $options, 'user_id', ' class="inputbox" ', 'id', 'username', $item->user_id);
		
		$sql = 'SELECT a.name FROM #__osmembership_fields AS a WHERE a.is_core=1 AND a.published=1';
		$db->setQuery($sql);
		if (version_compare(JVERSION, '3.0', 'ge')) {
			$coreFields = $db->loadColumn() ;
		} else {
			$coreFields = $db->loadResultArray() ;
		}				
		$this->coreFields = $coreFields ;
		
		$config = OSMembershipHelper::getConfig();		
		$this->config = $config ;
		
		
		$sql = 'SELECT name AS value, name AS text FROM #__osmembership_countries ORDER BY name';
		$db->setQuery($sql);
		$rowCountries = $db->loadObjectList();
		$options = array();
		$options[] =  JHTML::_('select.option', '', JText::_('OSM_SELECT_COUNTRY'));
		$options = array_merge($options, $rowCountries);
		$lists['country_list'] = JHTML::_('select.genericlist', $options, 'country', '', 'value', 'text', $item->country);
				
		//Subscription status
		$options = array();
		$options[] = JHTML::_('select.option', -1, JText::_('OSM_ALL'));
		$options[] = JHTML::_('select.option', 0, JText::_('OSM_PENDING'));
		$options[] = JHTML::_('select.option', 1, JText::_('OSM_ACTIVE'));
		$options[] = JHTML::_('select.option', 2, JText::_('OSM_EXPIRED'));
		$options[] = JHTML::_('select.option', 3, JText::_('OSM_CANCELLED_PENDING'));
		$options[] = JHTML::_('select.option', 4, JText::_('OSM_CANCELLED_REFUNDED'));
		$lists['published'] = JHTML::_('select.genericlist', $options, 'published', ' class="inputbox" ', 'value', 'text', $item->published);
						
		//Get list of payment methods
		$sql = 'SELECT name, title FROM #__osmembership_plugins WHERE published=1 ORDER BY ordering';
		$db->setQuery($sql) ;
		$options = array();
		$options[] = JHTML::_('select.option', '', JText::_('OSM_PAYMENT_METHOD'), 'name', 'title');
		$options = array_merge($options, $db->loadObjectList()) ;		
		$lists['payment_method'] = JHTML::_('select.genericlist', $options, 'payment_method', ' class="inputbox" ', 'name', 'title', $item->payment_method);						
		//Custom fields processing goes here
		$customField = false ;
		if ($item->plan_id) {			
			$jcFields = new OSMFields($item->plan_id);
			if ($jcFields->getTotal()) {
				$customField = true ;
				$fields = $jcFields->renderCustomFieldsEdit($item->id) ;
				$this->assignRef('fields', $fields) ;
			}	
		}			
		$this->assignRef('customField', $customField) ;
				
		return true ;
	}
}