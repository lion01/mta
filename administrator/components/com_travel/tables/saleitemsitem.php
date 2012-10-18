<?php

/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Saleitems
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
class TableSaleitemsitem extends JTable
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
	var $sale_id = null;
	/**
	 * @var int
	 */
	var $quantity = null;
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
		parent::__construct('#__travel_saleitems', 'id', $db);
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
		$this->sale_id = $filter->clean($this->sale_id, 'INT');
		$this->quantity = $filter->clean($this->quantity, 'INT');
		$this->comission_rate = $filter->clean($this->comission_rate, 'FLOAT');
		$this->comission_type = $filter->clean($this->comission_type, 'STRING');


		if (!empty($this->quantity) && !preg_match("/^\d+$/", $this->quantity)){
			JError::raiseWarning( 1000, JText::sprintf("TRAVEL_VALIDATOR_WRONG_VALUE_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_QUANTITY")) );
			$valid = false;
		}

		if (!empty($this->comission_rate) && !preg_match("/(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)/", $this->comission_rate)){
			JError::raiseWarning( 1000, JText::sprintf("TRAVEL_VALIDATOR_WRONG_VALUE_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_COMISSION_RATE")) );
			$valid = false;
		}



		if ($this->comission_type == null)
			$this->comission_type = "0";



		if (($this->package_id === null) || ($this->package_id === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_PACKAGES")));
			$valid = false;
		}

		if (($this->sale_id === null) || ($this->sale_id === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_SALES")));
			$valid = false;
		}

		if (($this->quantity === null) || ($this->quantity === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_QUANTITY")));
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
