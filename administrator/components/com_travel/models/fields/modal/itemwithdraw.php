<?php
/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Withdraws
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

defined('JPATH_BASE') or die;

jimport('joomla.form.formfield');
require_once(dirname(__FILE__) .DS. 'item.php');

/**
 * Supports a modal withdraw picker.
 *
 * @package		Joomla.Administrator
 * @subpackage	com_content
 * @since		1.6
 */
class JFormFieldModal_Itemwithdraw extends JFormFieldModal_Item
{

	protected $type = 'Modal_Itemwithdraw';


	//Instance specific picker
	protected $_option = 'com_travel';
	protected $_view = 'withdraws';
	protected $_title;

	protected $_nullLabel = "TRAVEL_DATA_PICKER_SELECT_WITHDRAW";




	/**
	 * Method to get the field input markup.
	 *
	 * @return	string	The field input markup.
	 * @since	1.6
	 */
	protected function getInput()
	{
		$db	= JFactory::getDBO();
		$db->setQuery(
			'SELECT `amount`' .
			' FROM #__travel_withdraws' .
			' WHERE id = '.(int) $this->value
		);
		$this->_title = $db->loadResult();

		if ($error = $db->getErrorMsg()) {
			JError::raiseWarning(500, $error);
		}


		return parent::getInput();
	}
}