<?php
/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version        1.0.0
* @package        Travel
* @subpackage    Sales
* @copyright    Copyright 2012, All rights reserved
* @author        Edward Khor - www.enfonius.com - edward@enfonius.com
* @license        GNU/GPL
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
 * @package        Joomla
 * @subpackage    Sales
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
        $option    = JRequest::getCmd('option');
        $db = JFactory::getDBO();

        $user     = JFactory::getUser();

        $access = TravelHelper::getACL();

        $model    = $this->getModel();
        $model->activeAll();
        $model->active('predefined', 'sale');

        $document    = &JFactory::getDocument();
        $document->title = $document->titlePrefix . JText::_("TRAVEL_LAYOUT_SALE") . $document->titleSuffix;




        $lists = array();

        //get the sale
        $sale    = $model->getItem();
        $isNew        = ($sale->id < 1);

        //load saleitems
        $query = 'SELECT i.*, p.title AS package_name FROM #__travel_saleitems i INNER JOIN #__travel_packages p ON i.package_id = p.id WHERE sale_id = '.$sale->id;
        $db->setQuery($query);
        $sale_items = $db->loadObjectList();

        //For security, execute here a redirection if not authorized to enter a form
        if (($isNew && !$access->get('core.create'))
        || (!$isNew && !$sale->params->get('access-edit')))
        {
                JError::raiseWarning(403, JText::sprintf( "JERROR_ALERTNOAUTHOR") );
                TravelHelper::redirectBack();
        }


        $lists['enum']['sales.status'] = TravelHelper::enumList('sales', 'status');

        $lists['enum']['sales.shipping'] = TravelHelper::enumList('sales', 'shipping');

        $lists['fk']['user_id'] = TravelJUserHelper::userList();

        //Status
        $lists['select']['status'] = new stdClass();
        $lists['select']['status']->list = $lists['enum']['sales.status'];
        array_unshift($lists['select']['status']->list, array("value"=>"", "text" => JText::_("TRAVEL_FIELD_NULL_STATUS")));
        $lists['select']['status']->value = $sale->status;

        //Shipping
        $lists['select']['shipping'] = new stdClass();
        $lists['select']['shipping']->list = $lists['enum']['sales.shipping'];
        array_unshift($lists['select']['shipping']->list, array("value"=>"", "text" => JText::_("TRAVEL_FIELD_NULL_SHIPPING")));
        $lists['select']['shipping']->value = $sale->shipping;

        // Toolbar
        jimport('joomla.html.toolbar');
        $bar = & JToolBar::getInstance('toolbar');
        if ($access->get('core.edit') || ($isNew && $access->get('core.create') || $access->get('core.edit.own')))
            $bar->appendButton( 'Standard', "save", "JTOOLBAR_SAVE", "save", false);
        if ($access->get('core.edit') || $access->get('core.edit.own'))
            $bar->appendButton( 'Standard', "apply", "JTOOLBAR_APPLY", "apply", false);
        $bar->appendButton( 'Standard', "cancel", "JTOOLBAR_CANCEL", "cancel", false, false );




        $config    = JComponentHelper::getParams( 'com_travel' );

        JRequest::setVar( 'hidemainmenu', true );

        $this->assignRef('user',        JFactory::getUser());
        $this->assignRef('access',        $access);
        $this->assignRef('lists',        $lists);
        $this->assignRef('sale',        $sale);
        $this->assignRef('sale_items', $sale_items);
        $this->assignRef('config',        $config);
        $this->assignRef('isNew',        $isNew);

        parent::display($tpl);
    }




}
