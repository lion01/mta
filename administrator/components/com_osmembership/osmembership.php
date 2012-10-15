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

//Require the controller
error_reporting(0);
require_once JPATH_ROOT.'/components/com_osmembership/helper/helper.php';
require_once JPATH_ROOT.'/components/com_osmembership/helper/fields.php';

require_once JPATH_ROOT.'/components/com_osmembership/plugins/os_payment.php';
require_once JPATH_ROOT.'/components/com_osmembership/plugins/os_payments.php';

//OS Framework
require_once JPATH_ROOT.'/administrator/components/com_osmembership/libraries/defines.php';
require_once JPATH_ROOT.'/administrator/components/com_osmembership/libraries/inflector.php';
require_once JPATH_ROOT.'/administrator/components/com_osmembership/libraries/factory.php';

$command = JRequest::getVar('task', 'display');

// Check for a controller.task command.
if (strpos($command, '.') !== false)
{
	list ($controller, $task) = explode('.', $command);	
	$path = JPATH_COMPONENT . '/controllers/' . $controller.'.php';
	if (file_exists($path)) {		
		require_once $path;
		$className =  'OSMembershipController'.ucfirst($controller) ;
		$controller	= new $className() ;
	} else {
		//Fallback to default controller
		OSFactory::loadLibrary('controller');
		$controller = new OSController( array('entity_name' => $controller, 'name' => 'OSMembership'));	
	}	
	JRequest::setVar('task', $task);
}
else
{			
	$path =  JPATH_COMPONENT.'/controller.php' ;	
	require_once $path;
	$className =  'OSMembershipController' ;
	$controller	= new $className() ;
}

//Ass css file

$document = & JFactory::getDocument() ;
$document->addStyleSheet(JURI::base(true).'/components/com_osmembership/assets/css/style.css') ;

if (version_compare(JVERSION, '3.0', 'le')) {
	OSMembershipHelper::loadBootstrap() ;	
}

// Perform the Request task
$controller->execute( JRequest::getCmd('task'));
$controller->redirect();
?>