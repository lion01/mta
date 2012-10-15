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
	var $package_id = null;
	/**
	 * @var int
	 */
	var $quantity = null;
	/**
	 * @var int
	 */
	var $agent = null;
	/**
	 * @var float
	 */
	var $payment = null;
	/**
	 * @var bool
	 */
	var $completed = null;
	/**
	 * @var string
	 */
	var $creation_date = null;
	/**
	 * @var string
	 */
	var $modification_date = null;
	/**
	 * @var float
	 */
	var $comission_rate = null;
	/**
	 * @var string
	 */
	var $comission_type = null;






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
		$this->package_id = $filter->clean($this->package_id, 'INT');
		$this->quantity = $filter->clean($this->quantity, 'INT');
		$this->agent = $filter->clean($this->agent, 'INT');
		$this->payment = $filter->clean($this->payment, 'FLOAT');
		$this->completed = $filter->clean($this->completed, 'BOOL');
		$this->creation_date = $filter->clean($this->creation_date, 'STRING');
		$this->modification_date = $filter->clean($this->modification_date, 'STRING');
		$this->comission_rate = $filter->clean($this->comission_rate, 'FLOAT');
		$this->comission_type = $filter->clean($this->comission_type, 'STRING');


		if (!empty($this->quantity) && !preg_match("/^\d+$/", $this->quantity)){
			JError::raiseWarning( 1000, JText::sprintf("TRAVEL_VALIDATOR_WRONG_VALUE_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_QUANTITY")) );
			$valid = false;
		}

		if (!empty($this->payment) && !preg_match("/(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)/", $this->payment)){
			JError::raiseWarning( 1000, JText::sprintf("TRAVEL_VALIDATOR_WRONG_VALUE_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_PAYMENT")) );
			$valid = false;
		}

		if (!empty($this->creation_date) && ($this->creation_date != '0000-00-00'))
		{
			$creation_date = TravelHelper::getSqlDate($this->creation_date, array('%Y-%m-%d'));
			if ($creation_date === null){
				JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_WRONG_DATETIME_FORMAT_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_CREATION_DATE")));
				$valid = false;
			}
			else
				$this->creation_date = $creation_date->toMySQL();
		}

		if (!empty($this->modification_date) && ($this->modification_date != '0000-00-00'))
		{
			$modification_date = TravelHelper::getSqlDate($this->modification_date, array('%Y-%m-%d'));
			if ($modification_date === null){
				JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_WRONG_DATETIME_FORMAT_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_MODIFICATION_DATE")));
				$valid = false;
			}
			else
				$this->modification_date = $modification_date->toMySQL();
		}



		if ($this->payment == null)
			$this->payment = 0;
		if ($this->completed === null)
			$this->completed = 0;
		if ($this->comission_type == null)
			$this->comission_type = "0";


		//Creation date
		if (!trim($this->creation_date))
			$this->creation_date = JFactory::getDate()->toMySql();

		//Modification date
		$this->modification_date = JFactory::getDate()->toMySql();


		if (($this->package_id === null) || ($this->package_id === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_PACKAGE")));
			$valid = false;
		}

		if (($this->quantity === null) || ($this->quantity === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_QUANTITY")));
			$valid = false;
		}

		if (($this->agent === null) || ($this->agent === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_AGENT")));
			$valid = false;
		}

		if (($this->comission_rate === null) || ($this->comission_rate === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_COMISSION_RATE")));
			$valid = false;
		}

		if (($this->comission_type === null) || ($this->comission_type === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_COMISSION_TYPE")));
			$valid = false;
		}




		return $valid;
	}
}
