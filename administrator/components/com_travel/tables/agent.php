<?php

/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Agents
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
class TableAgent extends JTable
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
	 * @var int
	 */
	var $parent = null;
	/**
	 * @var string
	 */
	var $bank = null;
	/**
	 * @var string
	 */
	var $bank_account = null;
	/**
	 * @var string
	 */
	var $organization = null;
	/**
	 * @var string
	 */
	var $street_address = null;
	/**
	 * @var string
	 */
	var $address = null;
	/**
	 * @var string
	 */
	var $postcode = null;
	/**
	 * @var string
	 */
	var $city = null;
	/**
	 * @var string
	 */
	var $state = null;
	/**
	 * @var string
	 */
	var $country = null;
	/**
	 * @var string
	 */
	var $contact_phone = null;
	/**
	 * @var string
	 */
	var $expired_date = null;






	/**
	* Constructor
	*
	* @param object Database connector object
	*
	*/
	function __construct(& $db)
	{
		parent::__construct('#__travel_agents', 'id', $db);
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
		$this->parent = $filter->clean($this->parent, 'INT');
		$this->bank = $filter->clean($this->bank, 'STRING');
		$this->bank_account = $filter->clean($this->bank_account, 'STRING');
		$this->organization = $filter->clean($this->organization, 'STRING');
		$this->street_address = $filter->clean($this->street_address, 'STRING');
		$this->address = $filter->clean($this->address, 'STRING');
		$this->postcode = $filter->clean($this->postcode, 'STRING');
		$this->city = $filter->clean($this->city, 'STRING');
		$this->state = $filter->clean($this->state, 'STRING');
		$this->country = $filter->clean($this->country, 'STRING');
		$this->contact_phone = $filter->clean($this->contact_phone, 'STRING');
		$this->expired_date = $filter->clean($this->expired_date, 'STRING');


		if (!empty($this->postcode) && !preg_match("/^[\-\+]?\d+$/", $this->postcode)){
			JError::raiseWarning( 1000, JText::sprintf("TRAVEL_VALIDATOR_WRONG_VALUE_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_POSTCODE")) );
			$valid = false;
		}

		if (!empty($this->contact_phone) && !preg_match("/^(\+[1-9][0-9]*(\([0-9]*\)|-[0-9]*-))?[0]?[1-9][0-9\- ]*$/", $this->contact_phone)){
			JError::raiseWarning( 1000, JText::sprintf("TRAVEL_VALIDATOR_WRONG_VALUE_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_CONTACT_PHONE")) );
			$valid = false;
		}

		if (!empty($this->expired_date) && ($this->expired_date != '0000-00-00'))
		{
			$expired_date = TravelHelper::getSqlDate($this->expired_date, array('%Y-%m-%d'));
			if ($expired_date === null){
				JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_WRONG_DATETIME_FORMAT_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_EXPIRED_DATE")));
				$valid = false;
			}
			else
				$this->expired_date = $expired_date->toMySQL();
		}



		if ($this->country == null)
			$this->country = "Malaysia";



		if (($this->user_id === null) || ($this->user_id === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_USER")));
			$valid = false;
		}

		if (($this->bank === null) || ($this->bank === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_BANK")));
			$valid = false;
		}

		if (($this->bank_account === null) || ($this->bank_account === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_BANK_ACCOUNT")));
			$valid = false;
		}

		if (($this->street_address === null) || ($this->street_address === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_STREET_ADDRESS")));
			$valid = false;
		}

		if (($this->postcode === null) || ($this->postcode === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_POSTCODE")));
			$valid = false;
		}

		if (($this->city === null) || ($this->city === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_CITY")));
			$valid = false;
		}

		if (($this->state === null) || ($this->state === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_STATE")));
			$valid = false;
		}

		if (($this->country === null) || ($this->country === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_COUNTRY")));
			$valid = false;
		}

		if (($this->contact_phone === null) || ($this->contact_phone === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_CONTACT_PHONE")));
			$valid = false;
		}

		if (($this->expired_date === null) || ($this->expired_date === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_EXPIRED_DATE")));
			$valid = false;
		}




		return $valid;
	}
}
