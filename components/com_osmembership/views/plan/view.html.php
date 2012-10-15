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
class OSMembershipViewPlan extends LegacyView
{
	function display($tpl = null)
	{		    	    	     		   
	    $config = OSMembershipHelper::getConfig(); 	    					        				
		$db = & JFactory::getDBO();			
		$Itemid = JRequest::getInt('Itemid', 0) ;																												
		$item = $this->get('Data') ;															
		$this->assignRef('item', $item) ;															
		$this->assignRef('Itemid', $Itemid) ;
		$this->assignRef('config', $config) ;
				
		parent::display($tpl);										
	}		
}