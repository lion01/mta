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

OSFactory::loadLibrary('controller') ;
/**
 * OSMembership Plugin controller
 *
 * @package		Joomla
 * @subpackage	OS Membership
 * @since 1.5
 */
class OSMembershipControllerPlugin extends OSController
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

	function install() {
		$model = & $this->getModel('plugin') ;
		$ret = $model->install();
		if ($ret) {
			$msg = JText::_('OSM_PLUGIN_INSTALLED');
		} else {
			$msg = JRequest::getVar('msg', 'OSM_PLUGIN_INSTALL_ERROR') ;
		}
		$this->setRedirect('index.php?option=com_osmembership&view=plugins', $msg);
	}
}