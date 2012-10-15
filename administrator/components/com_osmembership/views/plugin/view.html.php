<?php
/**
* @version		1.0.0
 * @package		Joomla
* @subpackage	OS Membership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2012 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */
// no direct access
defined( '_JEXEC' ) or die ;

OSFactory::loadLibrary('viewform') ;
/**
 * HTML View class for OS Membership component
 *
 * @static
 * @package		Joomla
 * @subpackage	OS Membership
 * @since 1.5
 */
class OSMembershipViewPlugin extends OSViewForm
{
	function _buildListArray(&$lists, $item) {						
		$registry = new JRegistry;
		$registry->loadString($item->params);
		$data = new stdClass() ;
		$data->params = $registry->toArray() ;
		$form = JForm::getInstance('osmembership', JPATH_ROOT.'/components/com_osmembership/plugins/'.$item->name.'.xml', array(), false, '//config') ;
		$form->bind($data);		
		$this->form = $form ;
				
		return true ;
	}
}