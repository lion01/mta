<?php
/**
 * @version		$Id: mod_k2_jcarousel.php 1492 2012-02-22 17:40:09Z joomlaworks@gmail.com $
 * @package		K2
 * @author		JoomlaWorks http://www.joomlaworks.net
 * @copyright	Copyright (c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.
 * @license		GNU/GPL license: http://www.gnu.org/copyleft/gpl.html
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

if(K2_JVERSION == '16'){
	$language = &JFactory::getLanguage();
	$language->load('mod_k2.j16', JPATH_ADMINISTRATOR, null, true);
}

require_once(dirname(__FILE__).DS.'helper.php');

// Params
$moduleclass_sfx = $params->get('moduleclass_sfx','');
$getTemplate = $params->get('getTemplate','Default');
$itemAuthorAvatarWidthSelect = $params->get('itemAuthorAvatarWidthSelect','custom');
$itemAuthorAvatarWidth = $params->get('itemAuthorAvatarWidth',50);
$itemCustomLinkTitle = $params->get('itemCustomLinkTitle','');
if($params->get('itemCustomLinkMenuItem')) {
	$menu = &JMenu::getInstance('site');
	$menuLink = $menu->getItem($params->get('itemCustomLinkMenuItem'));
	if(!$itemCustomLinkTitle){
		$itemCustomLinkTitle = (K2_JVERSION == '16') ? $menuLink->title : $menuLink->name;
	}
	$params->set('itemCustomLinkURL', JRoute::_($menuLink->link.'&Itemid='.$menuLink->id));
}

// Get component params
$componentParams = & JComponentHelper::getParams('com_k2');

// User avatar
if($itemAuthorAvatarWidthSelect=='inherit'){
	$avatarWidth = $componentParams->get('userImageWidth');
} else {
	$avatarWidth = $itemAuthorAvatarWidth;
}

$items = modK2jCarouselHelper::getItems($params);

if(count($items)){require(JModuleHelper::getLayoutPath('mod_k2_jcarousel', $getTemplate.DS.'default'));}

//Attach styles and scripts

$document =& JFactory::getDocument();
$app = JFactory::getApplication();
$templateDir = JURI::base() . 'templates/' . $app->getTemplate();


switch($params->get("theme")){
	case 'ie7':
		$document->addStyleSheet('modules/mod_k2_jcarousel/themes/ie7/skin.css');
		break;
	case 'tango':
		$document->addStyleSheet('modules/mod_k2_jcarousel/themes/tango/skin.css');
		break;
	case 'custom':
		$document->addStyleSheet($templateDir.'/css/jquery.jcarousel.css');
		break;
	};

switch($params->get("script")){
	case 'default':
		$document->addScript('modules/mod_k2_jcarousel/js/jquery.jcarousel.js');
		break;
	case 'minified':
		$document->addScript('modules/mod_k2_jcarousel/js/jquery.jcarousel.min.js');
		break;
	case 'custom':
		$document->addScript($templateDir.'/js/jquery.jcarousel.js');
		break;
	}; 

if($params->get("easing") !== 'linear' && $params->get("easing") !== 'swing'){
	$document->addScript('modules/mod_k2_jcarousel/js/jquery.easing.1.3.js');
}
