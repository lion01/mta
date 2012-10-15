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
class OSMembershipControllerConfiguration extends LegacyController
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
	 * Save the category
	 *
	 */
	function save() {
		jimport('joomla.filesystem.folder') ;
		$post = JRequest::get('post' , JREQUEST_ALLOWRAW);
		$model =  $this->getModel('configuration') ;		
		$ret =  $model->store($post);				
		if ($ret) {
			$msg = JText::_('OSM_CONFIGURATION_SAVED') ;
		} else {
			$msg = JText::_('OSM_CONFIGURATION_SAVING_ERROR');
		}						
		$this->setRedirect('index.php?option=com_osmembership&view=configuration', $msg);
	}	
	/**
	 * Cancel the configuration . Redirect user to pictures list page
	 *
	 */
	function cancel() {
		$this->setRedirect('index.php?option=com_osmembership&view=plans');
	}		
}