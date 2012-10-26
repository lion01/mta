<?php
/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Commissions
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



// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die( 'Restricted access' );

jimport( 'joomla.application.component.view');

/**
 * HTML View class for the Travel component
 *
 * @static
 * @package		Joomla
 * @subpackage	Commissions
 *
 */
class TravelViewCommission extends JView
{
	function display($tpl = null)
	{
		$layout = $this->getLayout();
		switch($layout)
		{
			case 'commission':

				$fct = "display_" . $layout;
				$this->$fct($tpl);
				break;
		}

	}
	function display_commission($tpl = null)
	{
		$app = JFactory::getApplication();
		$option	= JRequest::getCmd('option');

		$user 	= JFactory::getUser();

		$access = TravelHelper::getACL();

		$model	= $this->getModel();
		$model->activeAll();
		$model->active('predefined', 'commission');

		$document	= &JFactory::getDocument();
		$document->title = $document->titlePrefix . JText::_("TRAVEL_LAYOUT_COMMISSION") . $document->titleSuffix;




		$lists = array();

		//get the commission
		$commission	= $model->getItem();
		$isNew		= ($commission->id < 1);

		//For security, execute here a redirection if not authorized to enter a form
		if (($isNew && !$access->get('core.create'))
		|| (!$isNew && !$commission->params->get('access-edit')))
		{
				JError::raiseWarning(403, JText::sprintf( "JERROR_ALERTNOAUTHOR") );
				TravelHelper::redirectBack();
		}


		$lists['enum']['commissions.type'] = TravelHelper::enumList('commissions', 'type');

		$lists['fk']['user_id'] = TravelJUserHelper::userList();

		//Type
		$lists['select']['type'] = new stdClass();
		$lists['select']['type']->list = $lists['enum']['commissions.type'];
		array_unshift($lists['select']['type']->list, array("value"=>"", "text" => JText::_("TRAVEL_FIELD_NULL_TYPE")));
		$lists['select']['type']->value = $commission->type;

		// Toolbar
		jimport('joomla.html.toolbar');
		$bar = & JToolBar::getInstance('toolbar');
		if (!$isNew && ($access->get('core.delete') || $commission->params->get('access-delete')))
			$bar->appendButton( 'Standard', "delete", "JTOOLBAR_DELETE", "delete", false);
		if ($access->get('core.edit') || ($isNew && $access->get('core.create') || $access->get('core.edit.own')))
			$bar->appendButton( 'Standard', "save", "JTOOLBAR_SAVE", "save", false);
		if ($access->get('core.edit') || $access->get('core.edit.own'))
			$bar->appendButton( 'Standard', "apply", "JTOOLBAR_APPLY", "apply", false);
		$bar->appendButton( 'Standard', "cancel", "JTOOLBAR_CANCEL", "cancel", false, false );




		$config	= JComponentHelper::getParams( 'com_travel' );

		JRequest::setVar( 'hidemainmenu', true );

		$this->assignRef('user',		JFactory::getUser());
		$this->assignRef('access',		$access);
		$this->assignRef('lists',		$lists);
		$this->assignRef('commission',		$commission);
		$this->assignRef('config',		$config);
		$this->assignRef('isNew',		$isNew);

		parent::display($tpl);
	}




}