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

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );


/**
 * Travel Sales Controller
 *
 * @package        Joomla
 * @subpackage    Travel
 *
 */
class TravelControllerSales extends TravelController
{
    var $ctrl = 'sales';
    var $singular = 'sale';

    function __construct($config = array())
    {

        parent::__construct($config);

        $layout = JRequest::getCmd('layout');
        $render    = JRequest::getCmd('render');

        $this->context = strtolower('com_' . $this->getName() . '.' . $this->ctrl
                    . ($layout?'.' . $layout:'')
                    . ($render?'.' . $render:'')
                    );

        $app = JFactory::getApplication();
        $this->registerTask( 'new',  'new_' );
        $this->registerTask( 'apply',  'apply' );






    }

    function display( )
    {



        parent::display();

        if (!JRequest::getCmd('option',null, 'get'))
        {
            //Kill the post and rebuild the url
            $this->setRedirect(TravelHelper::urlRequest());
            return;
        }

    }

    function new_()
    {
        if (!$this->can('core.create', JText::_("JTOOLBAR_NEW")))
            return;

        $vars = array();
        //Predefine fields depending on filters values
        $app = JFactory::getApplication();
        //User > Name
        $filter_user_id = $app->getUserState( $this->context . ".filter.user_id");
        if ($filter_user_id) $vars["filter_user_id"] = $filter_user_id;

        //Order Date
        $filter_order_date = $app->getUserState( $this->context . ".filter.order_date");
        if ($filter_order_date) $vars["filter_order_date"] = $filter_order_date;

        //Status
        $filter_status = $app->getUserState( $this->context . ".filter.status");
        if ($filter_status) $vars["filter_status"] = $filter_status;



        JRequest::setVar( 'cid', 0 );
        JRequest::setVar( 'view'  , 'sale');
        JRequest::setVar( 'layout', 'sale' );

        $this->setRedirect(TravelHelper::urlRequest($vars));
    }

    function edit()
    {
        //Check Component ACL
        if (!$this->can(array('core.edit', 'core.edit.own'), JText::_("JTOOLBAR_EDIT")))
            return;

        $model = $this->getModel('sale');
        $item = $model->getItem();

        //Check Item ACL
        if (!$this->can('access-edit', JText::_("JTOOLBAR_EDIT"), $item->params))
            return;

        $vars = array();
        JRequest::setVar( 'view'  , 'sale');
        JRequest::setVar( 'layout', 'sale' );

        $this->setRedirect(TravelHelper::urlRequest($vars));
    }

    function delete()
    {
        if (!$this->can(array('core.delete', 'core.delete.own'), JText::_("JTOOLBAR_DELETE")))
            return;

        // Check for request forgeries
        JRequest::checkToken() or JRequest::checkToken('get') or jexit( 'Invalid Token' );


        $model = $this->getModel('sale');
        $item = $model->getItem();

        //Check Item ACL
        if (!$this->can('access-delete', JText::_("JTOOLBAR_DELETE"), $item->params))
            return;

        $cid = JRequest::getVar( 'cid', array(), 'post', 'array' );
        if (empty($cid))
            $cid = JRequest::getVar( 'cid', array(), 'get', 'array' );

        JArrayHelper::toInteger($cid);

        if (count( $cid ) < 1) {
            JError::raiseWarning(500, JText::sprintf( '_ALERT_PLEASE_MAKE_A_SELECTION_FROM_THE_LIST_TO', strtolower(JText::_("DELETE")) ) );
            $this->setRedirect(TravelHelper::urlRequest());
            return;
        }

        $vars = array();
        if (parent::_delete($cid))
        {
            JRequest::setVar( 'view'  , 'sales');
            JRequest::setVar( 'layout', 'default' );
            JRequest::setVar( 'cid', null );

        }

        $this->setRedirect(TravelHelper::urlRequest($vars));

    }

    function save()
    {
        // Check for request forgeries
        JRequest::checkToken() or jexit( 'Invalid Token' );

        $model = $this->getModel('sale');
        $item = $model->getItem();

        if ($model->getId() == 0)
        {    //New item

            if (!$this->can('core.create', JText::_("JTOOLBAR_SAVE")))
                return;

        }
        else
        {    //Existing item
            if (!$this->can(array('core.edit', 'core.edit.own'), JText::_("JTOOLBAR_SAVE")))
                return;

            //Check Item ACL
            if (!$this->can('access-edit', JText::_("JTOOLBAR_SAVE"), $item->params))
                return;

            $this->complete_order($item);
        }


        $post    = JRequest::get('post');
        $post['id'] = $model->getId();



        if ($cid = parent::_save($post))
        {
            $vars = array();
            JRequest::setVar( 'view'  , 'sales');
            JRequest::setVar( 'layout', 'default' );
            JRequest::setVar( 'cid', null );

            $this->setRedirect(TravelHelper::urlRequest($vars));
        }
        else
            //Keep the post and stay on page
            parent::display();

    }

    function apply()
    {
        // Check for request forgeries
        JRequest::checkToken() or jexit( 'Invalid Token' );

        $model = $this->getModel('sale');
        $item = $model->getItem();

        if ($model->getId() == 0)
        {    //New item

            if (!$this->can('core.create', JText::_("JTOOLBAR_APPLY")))
                return;

        }
        else
        {    //Existing item
            if (!$this->can(array('core.edit', 'core.edit.own'), JText::_("JTOOLBAR_APPLY")))
                return;

            //Check Item ACL
            if (!$this->can('access-edit', JText::_("JTOOLBAR_APPLY"), $item->params))
                return;

            $this->complete_order($item);
        }


        $post    = JRequest::get('post');
        $post['id'] = $model->getId();



        if ($cid = parent::_apply($post))
        {
            $vars = array();
            JRequest::setVar( 'view'  , 'sale');
            JRequest::setVar( 'layout', 'sale' );

            $this->setRedirect(TravelHelper::urlRequest($vars));
        }
        else
            //Keep the post and stay on page
            parent::display();


    }



    function cancel()
    {
        // Check for request forgeries
        JRequest::checkToken() or jexit( 'Invalid Token' );


        $vars = array();
        JRequest::setVar( 'view'  , 'sales');
        JRequest::setVar( 'layout', 'default' );
        JRequest::setVar( 'cid', null );

        $this->setRedirect(TravelHelper::urlRequest($vars));

    }

    function complete_order($model)
    {
        if ($model->status != 2 && isset($_POST['status']) && $_POST['status'] == 2) {
            if ($_POST['payment'] <= 0.00) {
                $_POST['payment'] = $_POST['total_amount'];
            }

            $db = JFactory::getDBO();

            $query = 'SELECT id FROM #__travel_saleitems WHERE sale_id = '.$model->id.' AND renewal = 1';
            $db->setQuery($query);
            $rows = $db->loadObjectList();

            $renewal_count = 0;
            $renewal_items_id = array();

            foreach ($rows as $row) {
                $renewal_count ++;
                $renewal_items_id[] = $row->id;
            }

            if ( ! empty($renewal_items_id)) {
                $query = 'UPDATE #__travel_saleitems SET renewal = 2 WHERE id IN ('.implode(',', $renewal_items_id).')';
                $db->setQuery($query);
                $db->query();
            }

            if ($renewal_count > 0) {
                $query = 'SELECT expired_date FROM #__travel_agents WHERE user_id = '.$model->user_id;
                $db->setQuery($query);
                $agent = $db->loadObject();

                $expired_date = $agent->expired_date && $agent->expired_date != '0000-00-00' ? date('Y-m-d', strtotime($agent->expired_date)) : date('Y-m-d');
                $expired_date = date('Y-m-d', strtotime('+6 month', strtotime($expired_date)));
                $query = 'UPDATE #__travel_agents SET expired_date = "'.$expired_date.'" WHERE user_id = '.$model->user_id;
                $db->setQuery($query);
                $db->query();
            }
        }
    }
}
