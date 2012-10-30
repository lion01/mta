<?php

/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Sales
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
jimport( 'joomla.html.parameter');

/**
 * HTML View class for the Travel component
 *
 * @static
 * @package		Joomla
 * @subpackage	Sales
 *
 */
class TravelViewSale extends JView
{
	function display($tpl = null)
	{
		$layout = $this->getLayout();
		switch($layout)
		{
			case 'sale':

				$fct = "display_" . $layout;
				$this->$fct($tpl);
				break;
		}

	}
	function display_sale($tpl = null)
	{
		$app = JFactory::getApplication();
		$option	= JRequest::getCmd('option');

		$user 	= JFactory::getUser();

		$access = TravelHelper::getACL();

		$model	= $this->getModel();
		$model->activeAll();
		$model->active('predefined', 'sale');

		$document	= &JFactory::getDocument();
		$document->title = $document->titlePrefix . JText::_("TRAVEL_LAYOUT_SALE") . $document->titleSuffix;



		$lists = array();

		//get the sale
		$sale	= $model->getItem();
		$isNew		= ($sale->id < 1);

		//For security, execute here a redirection if not authorized to view
		if (!$sale->params->get('access-view'))
		{
				JError::raiseWarning(403, JText::sprintf( "JERROR_ALERTNOAUTHOR") );
				TravelHelper::redirectBack();
		}



		$lists['enum']['sales.status'] = TravelHelper::enumList('sales', 'status');

		$lists['enum']['sales.shipping'] = TravelHelper::enumList('sales', 'shipping');

		// Toolbar
		jimport('joomla.html.toolbar');
		$bar = & JToolBar::getInstance('toolbar');
		if (!$isNew && ($access->get('core.delete') || $sale->params->get('access-delete')))
			$bar->appendButton( 'Standard', "delete", "TRAVEL_JTOOLBAR_DELETE", "delete", false);
		$bar->appendButton( 'Standard', "cancel", "TRAVEL_JTOOLBAR_CANCEL", "cancel", false, false );

		$lists['toolbar'] = $bar;



		$config	= JComponentHelper::getParams( 'com_travel' );

		$this->assignRef('user',		JFactory::getUser());
		$this->assignRef('access',		$access);
		$this->assignRef('lists',		$lists);
		$this->assignRef('sale',		$sale);
		$this->assignRef('config',		$config);
		$this->assignRef('isNew',		$isNew);

		parent::display($tpl);
	}




}