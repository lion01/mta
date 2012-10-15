<?php
/**
 * @version		1.5.0
 * @package		Joomla
 * @subpackage	OS Membership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2011 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die ;
require_once JPATH_ROOT.'/administrator/components/com_osmembership/legacy/view.php';
/**
 * HTML View class for OS Membership component
 *
 * @static
 * @package		Joomla
 * @subpackage	OS Membership
 * @since 1.5
 */
class OSMembershipViewSubscription extends LegacyView
{
	function display($tpl = null)
	{	
		$db = & JFactory::getDbo() ;
		$user = JFactory::getUser() ;	    	    	     		   
	    $config = OSMembershipHelper::getConfig(); 	    					        								
		$Itemid = JRequest::getInt('Itemid', 0) ;
		$item = $this->get('Data') ;
		if ($item->user_id != $user->get('id')) {
			$app = JFactory::getApplication() ;
			$app->redirect('index.php', JText::_('OSM_INVALID_ACTION'));
		}					
		$sql = 'SELECT a.name FROM #__osmembership_fields AS a WHERE a.is_core=1 AND a.published=1';
		$db->setQuery($sql);
		if (version_compare(JVERSION, '3.0', 'ge'))
			$coreFields = $db->loadColumn() ;
		else
			$coreFields = $db->loadResultArray() ;
		$this->coreFields = $coreFields ;
												
		//Get renew and upgrade option
		$sql = "SELECT id AS `value`, CONCAT(number_days, ' ".JText::_('OSM_DAYS')."', ' (', price,'$config->currency_symbol)') AS `text` FROM #__osmembership_renewrates WHERE plan_id=".$item->plan_id ;
		$db->setQuery($sql) ;							
		$rates = $db->loadObjectList();		
		$lists = array();			
				
		if (count($rates)) {
			$this->renewOption = true ;
			$options = array();
			$options[] = JHTML::_('select.option', 0, JText::_('OSM_CHOOSE_RENEW_OPTION'));
			$options = array_merge($options, $rates) ;
			$lists['renew_option_id'] = JHTML::_('select.genericlist', $options, 'renew_option_id', ' class="inputbox" ', 'value', 'text');			 						
		} else {
			$this->renewOption = false ;
		}
					
		$sql = "SELECT a.id AS `value`, CONCAT(b.title,' (', a.price,'$config->currency_symbol)') AS `text` FROM #__osmembership_upgraderules AS a INNER JOIN #__osmembership_plans AS b ON a.to_plan_id = b.id WHERE a.published=1 AND from_plan_id=".$item->plan_id.' AND (min_presence = 0 OR min_presence <='.$item->presence.') AND (max_presence = 0 OR max_presence>='.$item->presence.')' ;
		$db->setQuery($sql);
		$upgradeRules = $db->loadObjectList();
							
		if (count($upgradeRules)) {
			$this->upgradeOption = true ;
			$options = array();
			$options[] = JHTML::_('select.option', 0, JText::_('OSM_CHOOSE_UPGRADE_OPTION'));
			$options = array_merge($options, $upgradeRules) ;
			$lists['upgrade_option_id'] = JHTML::_('select.genericlist', $options, 'upgrade_option_id', ' class="inputbox" ', 'value', 'text');			
		} else {
			$this->upgradeOption = false ;
		}
						
		$this->Itemid = $Itemid ;
		$this->config = $config ;
		$this->item = $item ;								
		$this->lists = $lists ;
		
		
		//Custom field goes here
		$customField = false ;
		if ($item->plan_id) {
			$jcFields = new OSMFields($item->plan_id);
			if ($jcFields->getTotal()) {
				$customField = true ;
				$fields = $jcFields->renderCustomFieldsValue($item->id) ;
				$this->assignRef('fields', $fields) ;
			}
		}
		$this->assignRef('customField', $customField) ;
		
				
		parent::display($tpl);										
	}		
}