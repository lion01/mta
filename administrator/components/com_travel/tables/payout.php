<?php

/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Payouts
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
class TablePayout extends JTable
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
	var $amount = null;
	/**
	 * @var string
	 */
	var $attachment = null;
	/**
	 * @var string
	 */
	var $payment_date = null;
	/**
	 * @var string
	 */
	var $created_date = null;
	/**
	 * @var string
	 */
	var $type = null;






	/**
	* Constructor
	*
	* @param object Database connector object
	*
	*/
	function __construct(& $db)
	{
		parent::__construct('#__travel_payouts', 'id', $db);
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
		$this->amount = $filter->clean($this->amount, 'FLOAT');
		$this->attachment = $filter->clean($this->attachment, 'STRING');
		$this->payment_date = $filter->clean($this->payment_date, 'STRING');
		$this->created_date = $filter->clean($this->created_date, 'STRING');
		$this->type = $filter->clean($this->type, 'STRING');


		if (!empty($this->amount) && !preg_match("/(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)/", $this->amount)){
			JError::raiseWarning( 1000, JText::sprintf("TRAVEL_VALIDATOR_WRONG_VALUE_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_AMOUNT")) );
			$valid = false;
		}

		if (!empty($this->attachment) && preg_match("", $this->attachment)){
			JError::raiseWarning( 1000, JText::sprintf("", JText::_("TRAVEL_FIELD_ATTACHMENT")) );
			$valid = false;
		}

		if (!empty($this->payment_date) && ($this->payment_date != '0000-00-00'))
		{
			$payment_date = TravelHelper::getSqlDate($this->payment_date, array('%Y-%m-%d'));
			if ($payment_date === null){
				JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_WRONG_DATETIME_FORMAT_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_PAYMENT_DATE")));
				$valid = false;
			}
			else
				$this->payment_date = $payment_date->toMySQL();
		}

		if (!empty($this->created_date) && ($this->created_date != '0000-00-00 00:00:00'))
		{
			$created_date = TravelHelper::getSqlDate($this->created_date, array('%Y-%m-%d %H:%M'));
			if ($created_date === null){
				JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_WRONG_DATETIME_FORMAT_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_CREATED_DATE")));
				$valid = false;
			}
			else
				$this->created_date = $created_date->toMySQL();
		}



		if ($this->amount == null)
			$this->amount = 0;
		if ($this->type == null)
			$this->type = "1";


		//Creation date
		if (!trim($this->created_date))
			$this->created_date = JFactory::getDate()->toMySql();


		if (($this->amount === null) || ($this->amount === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_AMOUNT")));
			$valid = false;
		}

		if (($this->payment_date === null) || ($this->payment_date === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_PAYMENT_DATE")));
			$valid = false;
		}

		if (($this->type === null) || ($this->type === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_TYPE")));
			$valid = false;
		}




		return $valid;
	}
}
