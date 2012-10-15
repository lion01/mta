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

require_once JPATH_ROOT.'/administrator/components/com_osmembership/legacy/view.php';
/**
 * HTML View class for OS Membership component
 *
 * @static
 * @package		Joomla
 * @subpackage	OS Membership
 * @since 1.5
 */
class OSMembershipViewFailure extends LegacyView
{
	function display($tpl = null)
	{										
	    $this->setLayout('default') ;	
		$reason =  isset($_SESSION['reason']) ? $_SESSION['reason'] : '';
		if (!$reason) {
			$reason = JRequest::getVar('failReason', '') ;
		}
		
		$this->assignRef('reason', $reason);												
		parent::display($tpl);				
	}
}