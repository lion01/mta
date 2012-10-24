<?php
/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Agents
* @copyright	Copyright 2012, All rights reserved
* @author		Edward Khor - www.enfonius.com - edward@enfonius.com
* @license		GNU/GPL
*
* /!\  Joomla! is free software.
* This version may have been modified pursuant to the GNU General Public License,
* and as distributed it includes or is derivative of works licensed under the
* GNU General Public License or other free or open source software licenses.
*
*             .oooO  Oooo.     See COPYRIGHT.php for copyright notices and details.
*             (   )  (   )
* -------------\ (----) /----------------------------------------------------------- +
*               \_)  (_/
*/


// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
if(!defined('DS')) define('DS',DIRECTORY_SEPARATOR);

@define('JPATH_ADMIN_TRAVEL', JPATH_ADMINISTRATOR . DS . 'components' . DS . 'com_travel');
@define('JPATH_SITE_TRAVEL', JPATH_SITE . DS . 'components' . DS . 'com_travel');
@define('JQUERY', 'BETA');

//Shortcut to include component libraries
if (!function_exists('cimport')){
	function cimport($namespace, $option = 'com_travel', $className = null){
		//Check if class already exists
		if (($className) && class_exists($className))
			return;
		@require_once JPATH_ADMINISTRATOR .DS. 'components' .DS. $option . DS . str_replace(".", DS, $namespace) . '.php';
	}
}

require_once(JPATH_ADMIN_TRAVEL .DS.'helpers'.DS.'helper.php');
JHTML::_("behavior.framework");

// Set the table directory
JTable::addIncludePath(JPATH_ADMIN_TRAVEL . DS . 'tables');

//Document title
$document	= &JFactory::getDocument();
$document->titlePrefix = "Travel - ";
$document->titleSuffix = "";

if (defined('JDEBUG') && count($_POST))
	$_SESSION['Travel']['$_POST'] = $_POST;

//FILE INDIRECT ACCESS
$task	= JRequest::getVar('task');
if ($task == 'file')
{
	require_once(JPATH_ADMIN_TRAVEL .DS. "classes" .DS. "file.php");
	TravelFile::returnFile('db');
}

$view = JRequest::getCmd( 'view');

switch ($view)
{

		case 'packages' :
		case 'package' :



        	$controllerName = "packages";

		break;
		case 'sales' :
		case 'sale' :



        	$controllerName = "sales";

		break;
		case 'carts' :
		case 'cart' :



        	$controllerName = "carts";

		break;
		case 'commissions' :
		case 'commission' :



        	$controllerName = "commissions";

		break;

		default:
			$view = 'packages';
			$layout = 'default';

			JRequest::setVar( 'view', $view);
			JRequest::setVar( 'layout', $layout);
			$controllerName = "packages";
			break;
}

require_once(JPATH_ADMIN_TRAVEL .DS.'classes'.DS.'jcontroller.php');
if ($controllerName)
	require_once( JPATH_SITE_TRAVEL .DS.'controllers'.DS.$controllerName.'.php' );

$controllerName = 'TravelController'.$controllerName;


// Create the controller
$controller = new $controllerName();

// Perform the Request task
$controller->execute( JRequest::getCmd('task') );

// Redirect if set by the controller
$controller->redirect();

