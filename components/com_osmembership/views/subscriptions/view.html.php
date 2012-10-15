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
 * HTML View class for OSMembership component
 *
 * @static
 * @package		Joomla
 * @subpackage	OSMembership
 * @since 1.5
 */
class OSMembershipViewSubscriptions extends LegacyView
{	
	function display($tpl = null)
	{			
		$user = & JFactory::getUser();
		$userId = $user->get('id');
		if (!$userId) {
			$Itemid = JRequest::getInt('Itemid') ;
			$returnUrl = JRoute::_('index.php?option=com_osmembership&view=subscriptions&Itemid='.$Itemid);			
			$app = JFactory::getApplication() ;
			$url = JRoute::_('index.php?option=com_users&view=login&return='.base64_encode($returnUrl)) ;
			$app->redirect($url, JText::_('OSM_PLEASE_LOGIN'));					
		}			
		$config = OSMembershipHelper::getConfig() ;
		$Itemid = JRequest::getInt('Itemid') ;	    											
		$items = & $this->get('Data');		
		$pagination = $this->get('Pagination');																			
		$this->assignRef('items', $items) ;													
		$this->assignRef('Itemid', $Itemid) ;
		$this->assignRef('config', $config) ;
		$this->assignRef('pagination', $pagination) ;
									
		parent::display($tpl);							
	}	
}