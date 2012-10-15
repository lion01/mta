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

require_once JPATH_ROOT.'/administrator/components/com_osmembership/legacy/controller.php';
/**
 * OS Membership controller
 *
 * @package		Joomla
 * @subpackage	OS Membership
 * @since 1.5
 */
class OSMembershipController extends LegacyController
{
	/**
	 * Constructor function
	 *
	 * @param array $config
	 */
	function __construct($config = array())
	{
		parent::__construct($config);							
	}
	/**
	 * Display information
	 *
	 */
	function display( )
	{				    	
		$task = $this->getTask();				
		$view = JRequest::getVar('view', '');
		if (!$view) {
			JRequest::setVar('view', 'plans') ;	
		}						
		parent::display();
		if (version_compare(JVERSION, '1.6.0', 'ge')) {
		    //Add sub-menus, only needed for Joomla 1.6 and future versions
		    OSMembershipHelper::addSubmenus(JRequest::getVar('view', 'plans')); 
		}
		OSMembershipHelper::displayCopyRight();
	}	
		
	/**
	 * Upgrade database schema
	 */
	function upgrade() {
		require_once JPATH_COMPONENT.'/install.osmembership.php' ;
		com_install();
	}
}