<?php
/**
 * @version		1.5.0
 * @package		Joomla
 * @subpackage	OS Membership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2010 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */
// no direct access
defined( '_JEXEC' ) or die ;

require_once JPATH_ROOT.'/administrator/components/com_osmembership/legacy/view.php';
/**
 * HTML View class for the Booking component
 *
 * @static
 * @package		Joomla
 * @subpackage	OS Membership
 * @since 1.0
 */
class OSMembershipViewCancel extends LegacyView
{
	function display($tpl = null)
	{		
	    $this->setLayout('default') ;		
		$message = OSMembershipHelper::getConfigValue('cancel_message') ;		
		$this->assignRef('message', $message);				
		parent::display($tpl);				
	}
}