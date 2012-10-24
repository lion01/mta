<?php

/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Users
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
 * @subpackage	Users
 *
 */
class TravelViewUsers extends JView
{
	/*
	 * Define here the default list limit
	 */
	protected $_default_limit = null;

	function display($tpl = null)
	{
		$app = JFactory::getApplication();
		$config = JFactory::getConfig();

		$option	= JRequest::getCmd('option');
		$view	= JRequest::getCmd('view');
		$layout = $this->getLayout();



		switch($layout)
		{
			case 'ajax':

				$fct = "display_" . $layout;
				$this->$fct($tpl);
				break;
		}

	}
	function display_ajax($tpl = null)
	{
		$render	= JRequest::getVar('render');
		$token	= JRequest::getVar('token');
		$values	= JRequest::getVar('values');


		$model = $this->getModel();
		$model->activeAll();
		$items = $model->getItems();


		switch($render)
		{
			case 'select1':
				/* Ajax List : Users
				 * Called from: view:sale, layout:sale
				 */
				//Init or override the list of joined values for entry point
				if (is_array($values) && isset($values[0]) && $values[0])   //First value available
				{
					$model_item = JModel::getInstance('user', 'TravelModel');

					$model_item->setId($values[0]);				//Ground value
					$selectedItem = $model_item->getItem();

					//Redefine the ajax chain key values
					if ($model_item->getId() > 0)
					{

					}

				}

				$selected = (is_array($values))?$values[count($values)-1]:null;


				$event = 'jQuery("#user_id").val(this.value);';
				echo "<div class='ajaxchain-filter ajaxchain-filter-hz'>";
				echo JDom::_('html.form.input.select', array(
					'dataKey' => '__ajx_user_id',
					'dataValue' => $selected,
					'list' => $items,
					'listKey' => 'id',
					'labelKey' => 'name',
					'nullLabel' => "TRAVEL_JSEARCH_SELECT_USER",

					'selectors' => array(
										'onchange' => $event
									)
					));
				echo "</div>";



				break;

			case 'select2':
				/* Ajax List : Users
				 * Called from: view:commission, layout:commission
				 */
				//Init or override the list of joined values for entry point
				if (is_array($values) && isset($values[0]) && $values[0])   //First value available
				{
					$model_item = JModel::getInstance('user', 'TravelModel');

					$model_item->setId($values[0]);				//Ground value
					$selectedItem = $model_item->getItem();

					//Redefine the ajax chain key values
					if ($model_item->getId() > 0)
					{

					}

				}

				$selected = (is_array($values))?$values[count($values)-1]:null;


				$event = 'jQuery("#user_id").val(this.value);';
				echo "<div class='ajaxchain-filter ajaxchain-filter-hz'>";
				echo JDom::_('html.form.input.select', array(
					'dataKey' => '__ajx_user_id',
					'dataValue' => $selected,
					'list' => $items,
					'listKey' => 'id',
					'labelKey' => 'name',
					'nullLabel' => "TRAVEL_JSEARCH_SELECT_USER",

					'selectors' => array(
										'onchange' => $event
									)
					));
				echo "</div>";



				break;


		}

		jexit();
	}





}