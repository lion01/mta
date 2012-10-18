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
defined('_JEXEC') or die('Restricted access');


/**
* Travel Table class
*
* @package		Joomla
* @subpackage	Travel
*
*/
class TablePackage extends JTable
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
	 * @var string
	 */
	var $title = null;
	/**
	 * @var string
	 */
	var $content = null;
	/**
	 * @var string
	 */
	var $commission_type = null;
	/**
	 * @var float
	 */
	var $comisssion_rate = null;
	/**
	 * @var float
	 */
	var $price = null;
	/**
	 * @var float
	 */
	var $value = null;
	/**
	 * @var int
	 */
	var $ordering = null;
	/**
	 * @var string
	 */
	var $creation_date = null;
	/**
	 * @var string
	 */
	var $modification_date = null;
	/**
	 * @var int
	 */
	var $published = null;






	/**
	* Constructor
	*
	* @param object Database connector object
	*
	*/
	function __construct(& $db)
	{
		parent::__construct('#__travel_packages', 'id', $db);
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
		$this->title = $filter->clean($this->title, 'STRING');
		$this->commission_type = $filter->clean($this->commission_type, 'STRING');
		$this->comisssion_rate = $filter->clean($this->comisssion_rate, 'FLOAT');
		$this->price = $filter->clean($this->price, 'FLOAT');
		$this->value = $filter->clean($this->value, 'FLOAT');
		$this->ordering = $filter->clean($this->ordering, 'INT');
		$this->creation_date = $filter->clean($this->creation_date, 'STRING');
		$this->modification_date = $filter->clean($this->modification_date, 'STRING');
		$this->published = $filter->clean($this->published, 'INT');


		if (!empty($this->comisssion_rate) && !preg_match("/(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)/", $this->comisssion_rate)){
			JError::raiseWarning( 1000, JText::sprintf("TRAVEL_VALIDATOR_WRONG_VALUE_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_COMISSSION_RATE")) );
			$valid = false;
		}

		if (!empty($this->price) && !preg_match("/(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)/", $this->price)){
			JError::raiseWarning( 1000, JText::sprintf("TRAVEL_VALIDATOR_WRONG_VALUE_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_PRICE")) );
			$valid = false;
		}

		if (!empty($this->value) && !preg_match("/(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)/", $this->value)){
			JError::raiseWarning( 1000, JText::sprintf("TRAVEL_VALIDATOR_WRONG_VALUE_FOR_PLEASE_RETRY", JText::_("TRAVEL_FIELD_VALUE")) );
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



		if ($this->commission_type == null)
			$this->commission_type = "0";


		//Creation date
		if (!trim($this->creation_date))
			$this->creation_date = JFactory::getDate()->toMySql();

		//Modification date
		$this->modification_date = JFactory::getDate()->toMySql();

		//New row : Ordering : place to the end
		if ($this->id == 0)
		{
			$db= JFactory::getDBO();

			$query = 	'SELECT `ordering` FROM `' . $this->_tbl . '`'
					. 	' ORDER BY `ordering` DESC LIMIT 1';
			$db->setQuery($query);
			$lastOrderObj = $db->loadObject();
			$this->ordering = (int)$lastOrderObj->ordering + 1;
		}


		if (($this->title === null) || ($this->title === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_TITLE")));
			$valid = false;
		}

		if (($this->commission_type === null) || ($this->commission_type === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_COMMISSION_TYPE")));
			$valid = false;
		}

		if (($this->comisssion_rate === null) || ($this->comisssion_rate === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_COMISSSION_RATE")));
			$valid = false;
		}

		if (($this->price === null) || ($this->price === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_PRICE")));
			$valid = false;
		}

		if (($this->value === null) || ($this->value === '')){
			JError::raiseWarning(2001, JText::sprintf("TRAVEL_VALIDATOR_IS_REQUESTED_PLEASE_RETRY", JText::_("TRAVEL_FIELD_VALUE")));
			$valid = false;
		}




		return $valid;
	}
}
