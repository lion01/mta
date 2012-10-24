<?php
/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version        1.0.0
* @package        Travel
* @subpackage    Packages
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

jimport('joomla.utilities.date');

/**
 * Travel Packages Controller
 *
 * @package        Joomla
 * @subpackage    Travel
 *
 */
class TravelControllerPackages extends TravelController
{
    var $ctrl = 'packages';
    var $singular = 'package';

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
        $this->registerTask( 'unpublish',  'unpublish' );
        $this->registerTask( 'apply',  'apply' );






    }

    function display( )
    {
        parent::display();

        if (JRequest::getMethod() == 'POST') {
            $packages_id = isset($_POST['cid']) ? $_POST['cid'] : array();

            $cart = JFactory::getSession()->get('cart', array());

            foreach ($packages_id as $package_id) {
                if (isset($cart[$package_id])) {
                    $cart[$package_id] += 1;
                } else {
                    $cart[$package_id] = 1;
                }
            }

            JFactory::getSession()->set('cart', $cart);

            $this->setRedirect('index.php/travel-packages/cart');
            return;
        }

        if (!JRequest::getCmd('option',null, 'get'))
        {
            //Kill the post and rebuild the url
            $this->setRedirect(TravelHelper::urlRequest());
            return;
        }

    }

    function publish()
    {
        if (!$this->can('core.edit.state', JText::_("TRAVEL_JTOOLBAR_PUBLISH")))
            return;

        // Check for request forgeries
        JRequest::checkToken() or JRequest::checkToken('get') or jexit( 'Invalid Token' );

        $cid = JRequest::getVar( 'cid', array(), 'post', 'array' );
        if (empty($cid))
            $cid = JRequest::getVar( 'cid', array(), 'get', 'array' );

        JArrayHelper::toInteger($cid);

        if (count( $cid ) < 1) {
            JError::raiseWarning(500, JText::sprintf( "TRAVEL_ALERT_PLEASE_MAKE_A_SELECTION_FROM_THE_LIST_TO", strtolower(JText::_("PUBLISH")) ) );
        }
        else
        {
            $model = $this->getModel('package');
            if ($model->publish($cid)){
                $app = JFactory::getApplication();
                $app->enqueueMessage(JText::_( 'DONE' ));

            } else
                JError::raiseWarning( 1000, JText::_("ERROR") );
        }

        $vars = array();
        JRequest::setVar( 'view'  , 'packages');
        JRequest::setVar( 'layout', 'default' );
        JRequest::setVar( 'cid', null );

        $this->setRedirect(TravelHelper::urlRequest($vars));

    }

    function unpublish()
    {
        if (!$this->can('core.edit.state', JText::_("TRAVEL_JTOOLBAR_UNPUBLISH")))
            return;

        // Check for request forgeries
        JRequest::checkToken() or JRequest::checkToken('get') or jexit( 'Invalid Token' );

        $cid = JRequest::getVar( 'cid', array(), 'post', 'array' );
        if (empty($cid))
            $cid = JRequest::getVar( 'cid', array(), 'get', 'array' );

        JArrayHelper::toInteger($cid);

        if (count( $cid ) < 1) {
            JError::raiseWarning(500, JText::sprintf( "TRAVEL_ALERT_PLEASE_MAKE_A_SELECTION_FROM_THE_LIST_TO", strtolower(JText::_("UNPUBLISH")) ) );
        }
        else
        {
            $model = $this->getModel('package');
            if ($model->publish($cid, 0)){
                $app = JFactory::getApplication();
                $app->enqueueMessage(JText::_( 'DONE' ));

            } else
                JError::raiseWarning( 1000, JText::_("ERROR") );

        }

        $vars = array();
        JRequest::setVar( 'view'  , 'packages');
        JRequest::setVar( 'layout', 'default' );
        JRequest::setVar( 'cid', null );

        $this->setRedirect(TravelHelper::urlRequest($vars));

    }

    function orderup()
    {
        if (!$this->can('core.edit.state', JText::_("TRAVEL_JTOOLBAR_CHANGE_ORDER")))
            return;

        // Check for request forgeries
        JRequest::checkToken() or JRequest::checkToken('get') or jexit( 'Invalid Token' );


        $model = $this->getModel('package');
        $item = $model->getItem();    //Set the Id from request
        $model->move(-1);

        $vars = array();
        JRequest::setVar( 'view'  , 'packages');
        JRequest::setVar( 'layout', 'default' );
        JRequest::setVar( 'cid', null );

        $this->setRedirect(TravelHelper::urlRequest($vars));
    }

    function orderdown()
    {
        if (!$this->can('core.edit.state', JText::_("TRAVEL_JTOOLBAR_CHANGE_ORDER")))
            return;

        // Check for request forgeries
        JRequest::checkToken() or jexit( 'Invalid Token' );


        $model = $this->getModel('package');
        $item = $model->getItem();    //Set the Id from request
        $model->move(1);

        $vars = array();
        JRequest::setVar( 'view'  , 'packages');
        JRequest::setVar( 'layout', 'default' );
        JRequest::setVar( 'cid', null );

        $this->setRedirect(TravelHelper::urlRequest($vars));
    }

    function saveorder()
    {
        if (!$this->can('core.edit.state', JText::_("TRAVEL_JTOOLBAR_CHANGE_ORDER")))
            return;

        // Check for request forgeries
        JRequest::checkToken() or jexit( 'Invalid Token' );


        $cid     = JRequest::getVar( 'cid', array(), 'post', 'array' );
        $order     = JRequest::getVar( 'order', array(), 'post', 'array' );
        JArrayHelper::toInteger($cid);
        JArrayHelper::toInteger($order);

        $model = $this->getModel('package');
        $model->saveorder($cid, $order);


        $vars = array();
        JRequest::setVar( 'view'  , 'packages');
        JRequest::setVar( 'layout', 'default' );
        JRequest::setVar( 'cid', null );

        $this->setRedirect(TravelHelper::urlRequest($vars));
    }






}
