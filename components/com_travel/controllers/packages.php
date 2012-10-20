<?php
/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Packages
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

jimport('joomla.utilities.date');

/**
 * Travel Packages Controller
 *
 * @package		Joomla
 * @subpackage	Travel
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
		$render	= JRequest::getCmd('render');

		$this->context = strtolower('com_' . $this->getName() . '.' . $this->ctrl
					. ($layout?'.' . $layout:'')
					. ($render?'.' . $render:'')
					);

		$app = JFactory::getApplication();

	}

	function display( )
	{
            if (JRequest::getMethod() == 'POST') {
                $packages_id = isset($_POST['cid']) ? $_POST['cid'] : array();

                $this->_add_to_cart($packages_id);

		$this->setRedirect('index.php/agent/cart');
		return;
            }

            parent::display();

	}

        function _add_to_cart(array $packages_id)
        {
            $user = JFactory::getUser();
            $user_id = $user->get('id');
            $db = JFactory::getDBO();

            $cart = $this->getModel('cart');

            foreach ($packages_id as $package_id) {
                $query = "SELECT id, quantity FROM #__travel_carts WHERE package_id = $package_id AND user_id = $user_id LIMIT 1";
                $db->setQuery($query);

                $rows = $db->loadObjectList();
                if (count($rows) > 0) {
                    $cart->update(array($rows[0]->id), array('quantity' => $rows[0]->quantity + 1));
                } else {
                    $cart->save(
                        array(
                            'user_id' => $user_id,
                            'package_id' => $package_id,
                            'quantity' => 1,
                        )
                    );
                }
            }
        }
}
