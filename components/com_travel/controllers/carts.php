<?php
/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Carts
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


/**
 * Travel Carts Controller
 *
 * @package		Joomla
 * @subpackage	Travel
 *
 */
class TravelControllerCarts extends TravelController
{
	var $ctrl = 'carts';
	var $singular = 'cart';

	function __construct($config = array())
	{

		parent::__construct($config);

		$layout = JRequest::getCmd('layout');
		$render	= JRequest::getCmd('render');

		$this->context = strtolower('com_' . $this->getName() . '.' . $this->ctrl
					. ($layout?'.' . $layout:'')
					. ($render?'.' . $render:'')
					);

		$app = JFactory::getApplication();
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

	function delete()
	{
		if (!$this->can(array('core.delete', 'core.delete.own'), JText::_("TRAVEL_JTOOLBAR_DELETE")))
			return;

		// Check for request forgeries
		JRequest::checkToken() or JRequest::checkToken('get') or jexit( 'Invalid Token' );


		$model = $this->getModel('cart');
		$item = $model->getItem();

		//Check Item ACL
		if (!$this->can('access-delete', JText::_("TRAVEL_JTOOLBAR_DELETE"), $item->params))
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
			JRequest::setVar( 'view'  , 'carts');
			JRequest::setVar( 'layout', 'carts' );
			JRequest::setVar( 'cid', null );

		}

		$this->setRedirect(TravelHelper::urlRequest($vars));

	}

        function order()
        {
            $user = JFactory::getUser();
            $user_id = $user->get('id');

	    $model = $this->getModel('carts');
            $model->activeAll();
            $model->active('predefined', 'carts');

            $items = $model->getItems();

            $total_commission = 0.0;
            $total_amount = 0.0;

            foreach ($items as $item) {
                $total_commission += $item->quantity * ($item->_package_id_commission_type == 0 ? $item->_package_id_comission_rate : $item->_package_id_price * ($item->_package_id_comission_rate / 100));
                $total_amount += $item->quantity * $item->_package_id_price;
            }

            $sale = $this->getModel('sale');
            $data = array(
                'id' => NULL,
                'user_id' => $user_id,
                'payment' => 0.0,
                'completed' => FALSE,
                'creation_date' => date('Y-m-d H:i:s'),
                'total_commission' => $total_commission,
                'total_amount' => $total_amount,
            );

            $sale->save($data);
            $carts_id = array();

            foreach ($items as $item) {
                $saleitem = $this->getModel('saleitemsitem');
                $data = array(
                    'id' => NULL,
                    'sale_id' => $sale->id(),
                    'package_id' => $item->package_id,
                    'quantity' => $item->quantity,
                    'comission_rate' => $item->_package_id_comission_rate,
                    'comission_type' => $item->_package_id_commission_type,
                    'price' => $item->_package_id_price,
                );

                $saleitem->save($data);

                $carts_id[] = $item->id;
            }

            $cart = $this->getModel('cart');
            $cart->delete($carts_id);

            $this->setRedirect('index.php/order-success');
        }
}
