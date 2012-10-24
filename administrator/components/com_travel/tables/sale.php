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



// no direct access
defined('_JEXEC') or die('Restricted access');


/**
* Travel Table class
*
* @package		Joomla
* @subpackage	Travel
*
*/
class TableSale extends JTable
{

	/**
	 * Primary Key
	 *
	 * @var int
	 */
	var $id = null;

	/**
	 * @var string
	 */
	var $attribs = null;

	/**
	 * @var int
	 */
	var $user_id = null;
	/**
	 * @var float
	 */
	var $payment = null;
	/**
	 * @var float
	 */
	var $total_commission = null;
	/**
	 * @var float
	 */
	var $total_amount = null;
	/**
	 * @var float
	 */
	var $total_unit = null;
	/**
	 * @var string
	 */
	var $status = null;
	/**
	 * @var string
	 */
	var $shipping = null;
	/**
	 * @var string
	 */
	var $order_date = null;
	/**
	 * @var string
	 */
	var $modification_date = null;
	/**
	 * @var string
	 */
	var $payment_reference_code = null;






	/**
	* Constructor
	*
	* @param object Database connector object
	*
	*/
	function __construct(& $db)
	{
		parent::__construct('#__travel_sales', 'id', $db);
	}




	/**
	* Overloaded bind function
	*
	* @acces public
	* @param array $hash named array
	* @return null|string	null is operation was satisfactory, otherwise returns an error
	* @see JTable:bind
	*
	*/
	function bind($src, $ignore = array())
	{

		if (isset($src['attribs']) && is_array($src['attribs']))
		{
			$registry = new JRegistry;
			$registry->loadArray($src['attribs']);
			$src['attribs'] = (string) $registry;
		}

		return parent::bind($src, $ignore);
	}

	/**
	 * Overloaded check method to ensure data integrity
	 *
	 * @access public
	 * @return boolean True on success
	 * @see JTable:check
	 */
	function check()
	{
		$valid = true;

		$filter = new JFilterInput(array(), array(), 0, 0);
		$this->user_id = $filter->clean($this->user_id, 'INT');
		$this->payment = $filter->clean($this->payment, 'FLOAT');
		$this->total_commission = $filter->clean($this->total_commission, 'FLOAT');
		$this->total_amount = $filter->clean($this->total_amount, 'FLOAT');
		$this->total_unit = $filter->clean($this->total_unit, 'FLOAT');
		$this->status = $filter->clean($this->status, 'STRING');
		$this->shipping = $filter->clean($this->shipping, 'STRING');
		$this->order_date = $filter->clean($this->order_date, 'STRING');
		$this->modification_date = $filter->clean($this->modification_date, 'STRING');
		$this->payment_reference_code = $filter->clean($this->payment_reference_code, 'STRING');


		if (!empty($this->payment) && !preg_match("/(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)/", $this->payment)){
			JError::raiseWarning( 1000, JText::sprintf("TRAVEL_VALIDATOR_WRONG_VALUE_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_RECEIVED_PAYMENT")) );
			$valid = false;
		}

		if (!empty($this->total_commission) && !preg_match("/^-?\d*\.?\d*$/", $this->total_commission)){
			JError::raiseWarning( 1000, JText::sprintf("TRAVEL_VALIDATOR_WRONG_VALUE_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_TOTAL_COMMISSION")) );
			$valid = false;
		}

		if (!empty($this->total_amount) && !preg_match("/^-?\d*\.?\d*$/", $this->total_amount)){
			JError::raiseWarning( 1000, JText::sprintf("TRAVEL_VALIDATOR_WRONG_VALUE_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_TOTAL_AMOUNT")) );
			$valid = false;
		}

		if (!empty($this->total_unit) && !preg_match("/^-?\d*\.?\d*$/", $this->total_unit)){
			JError::raiseWarning( 1000, JText::sprintf("TRAVEL_VALIDATOR_WRONG_VALUE_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_TOTAL_UNIT")) );
			$valid = false;
		}

		if (!empty($this->order_date) && ($this->order_date != '0000-00-00 00:00:00'))
		{
			$order_date = TravelHelper::getSqlDate($this->order_date, array('%Y-%m-%d %H:%M'));
			if ($order_date === null){
				JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_WRONG_DATETIME_FORMAT_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_ORDER_DATE")));
				$valid = false;
			}
			else
				$this->order_date = $order_date->toMySQL();
		}

		if (!empty($this->modification_date) && ($this->modification_date != '0000-00-00 00:00:00'))
		{
			$modification_date = TravelHelper::getSqlDate($this->modification_date, array('%Y-%m-%d %H:%M'));
			if ($modification_date === null){
				JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_WRONG_DATETIME_FORMAT_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_MODIFICATION_DATE")));
				$valid = false;
			}
			else
				$this->modification_date = $modification_date->toMySQL();
		}



		if ($this->payment == null)
			$this->payment = 0;
		if ($this->total_commission == null)
			$this->total_commission = 0;
		if ($this->total_amount == null)
			$this->total_amount = 0;
		if ($this->total_unit == null)
			$this->total_unit = 0;
		if ($this->status == null)
			$this->status = "1";
		if ($this->shipping == null)
			$this->shipping = "1";


		//Creation date
		if (!trim($this->order_date))
			$this->order_date = JFactory::getDate()->toMySql();

		//Modification date
		$this->modification_date = JFactory::getDate()->toMySql();


		if (($this->user_id === null) || ($this->user_id === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_USER")));
			$valid = false;
		}

		if (($this->total_commission === null) || ($this->total_commission === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_TOTAL_COMMISSION")));
			$valid = false;
		}

		if (($this->total_amount === null) || ($this->total_amount === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_TOTAL_AMOUNT")));
			$valid = false;
		}

		if (($this->total_unit === null) || ($this->total_unit === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_TOTAL_UNIT")));
			$valid = false;
		}

		if (($this->status === null) || ($this->status === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_STATUS")));
			$valid = false;
		}

		if (($this->shipping === null) || ($this->shipping === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_SHIPPING")));
			$valid = false;
		}




		return $valid;
	}
}
